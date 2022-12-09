/*@TODO:
- printf style draw_text
- gap buffer
- handle tabs better
- multiple buffers + save
- handle the order of stuff in update
- undo
- redo
- vim / kakoune or maybe emacs? basics
- smooth scrolling (see bezier curves, cubic splines)
- window resizing
- multiple font sizes
- antialiasing
- kerning
- switch from sdl?
- handle small font sizes- search
- replace
- basic parser  // propably this should be done later
     - syntax highlighthing
- matching braces
- list all defintions (functions, types, ...)
- jump to definition (also peek definition)
- jump history
- macro recording
- multiple cursors?
- basic autocomplete
- split windows
- auto indentation
- snippets?
- registers?
- better parser
- optimizations
- integrated build system (with jump to errors)
*/

#define TAB_SIZE 4

static int font_line_height;
static int font_advance_x;
uint8_t *font_bitmaps[256];

static char *buffer_filename;
static char *buffer;
static int buffer_size;

static int cursor_pos;
static int cursor_prev_pos;

static int is_pressed[512];
static int is_control_key_pressed;
static int mouse_prev_x, mouse_prev_y;
static int mouse_x, mouse_y;
static float mouse_scroll_y;
static int is_mouse_left_button_pressed;


static float offset_x;
static float offset_y;
static float scroll_y;
static float scroll_x;
static float scroll_dy;

static int first_frame = 1;

static int selection_start_pos;
static int selection_end_pos;
static int selection;
static int new_selection;
static char *clipboard;


typedef enum Command_Type {
    Command_Enter,
    Command_Backspace,
    Command_Text,
    Command_Cut,
    Command_Paste,
} Command_Type;

typedef struct Command {
    Command_Type type;
    int c_pos; // cursor position before executing the command
    int c_end_pos;
    char *removed_string;
    int s_pos;//selection position
    int s_end_pos;
} Command;

Command undo_buffer[4096];
int undo_buffer_count;

//We could make this like printf style or not worth it?
void push_command(Command *cmd)
{
    undo_buffer[undo_buffer_count] = *cmd;
    undo_buffer_count++;
}

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
}

float lerp(float a, float t, float b)
{
	return a + t * (b - a);
}

int uint_len(uint32_t n)
{
    if (!n)
        return 1;
    int len = 0;
    while (n)
    {
        n /= 10;
        len++;
    }
    return len;
}

int get_line_count()
{
    int result = 1;
    for (int i = 0; buffer[i]; i++)
        result += (buffer[i] == '\n');
    return result;
}

void draw_rect(Image *draw_buffer, int min_x, int min_y, int max_x, int max_y,
               float r, float g, float b, float a)
{
    if (min_x < 0) min_x = 0;
	if (min_y < 0) min_y = 0;
	if (max_x > draw_buffer->width) max_x = draw_buffer->width;
	if (max_y > draw_buffer->height) max_y = draw_buffer->height;

    for (int y = min_y; y < max_y; y++)
	{
		for (int x = min_x; x < max_x; x++)
		{
            uint32_t p = draw_buffer->pixels[y * draw_buffer->width + x];
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;

            dr = lerp(dr, a, r);
            dg = lerp(dg, a, g);
            db = lerp(db, a, b);
            draw_buffer->pixels[y* draw_buffer->width + x] =
            ((uint32_t)(dr * 255 + 0.5f) << 24) |
            ((uint32_t)(dg * 255 + 0.5f) << 16) |
            ((uint32_t)(db * 255 + 0.5f) << 8);
        }
	}
}

//TODO: kerning, antialiasing?
void draw_char(Image *draw_buffer, int c, int min_x, int min_y, float fr, float fg, float fb)
{
    if (c < 32 || c >= 127)
    {
        draw_rect(draw_buffer, min_x, min_y, min_x + font_advance_x,
                  min_y + font_line_height, 1, 0, 1, 1);
        return;
    }
    int init_min_x = min_x;
    int init_min_y = min_y;
    int max_x = min_x + font_advance_x;
    int max_y = min_y + font_line_height;

    if (min_x < 0) min_x = 0;
	if (min_y < 0) min_y = 0;
	if (max_x > draw_buffer->width) max_x = draw_buffer->width;
	if (max_y > draw_buffer->height) max_y = draw_buffer->height;


    for (int y = min_y; y < max_y; y++)
	{
		for (int x = min_x; x < max_x; x++)
        {
            uint8_t grey = font_bitmaps[c][(int)((y - init_min_y) * font_advance_x + (x - init_min_x))];
            float a = grey / 255.0f;
            uint32_t p = draw_buffer->pixels[y * draw_buffer->width + x];
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;

            dr = lerp(dr, a, fr);
            dg = lerp(dg, a, fg);
            db = lerp(db, a, fb);
            draw_buffer->pixels[y* draw_buffer->width + x] =
            ((uint32_t)(dr * 255 + 0.5f) << 24) |
            ((uint32_t)(dg * 255 + 0.5f) << 16) |
            ((uint32_t)(db * 255 + 0.5f) << 8);
        }
    }
}

void draw_text(Image *draw_buffer, char *s, int min_x, int min_y, float fr, float fg, float fb)
{
	float x = min_x;
	float y = min_y;
	for (int i = 0; s[i]; i++)
	{
		if (s[i] == '\n')
        {
            y += font_line_height;
            x = min_x;
        }
		else if (s[i] == '\t')
		{
			for (int j = 0; j < TAB_SIZE; j++)
			{
				draw_char(draw_buffer, ' ', x, y, fr, fg, fb);
                x += font_advance_x;
			}
		}
        else
        {
            draw_char(draw_buffer, s[i], x, y, fr, fg, fb);
            x += font_advance_x;
        }
    }
}

void get_line_and_col_from_pos(int pos, int *line, int *col)
{
    *line = 0;
    *col = 0;
    for (int i = 0; buffer[i]; i++)
    {
        if (i == pos)
            break;
        if (buffer[i] == '\n')
        {
            *line = *line + 1;
            *col = 0;
        }
        else
            *col = *col + 1;
    }
}

int get_pos_from_line_and_col(int line, int col)
{
    if (line < 0)
        return 0;
    if (col < 0)
        col = 0;
    //find line start and add to it col? + clamp it
    int curr_line = 0;
    for (int i = 0; buffer[i]; i++)
    {

        if (curr_line == line)
        {
            int line_end = 0;
            while (buffer[i + line_end] && buffer[i + line_end] != '\n')
                line_end++;
            if (col > line_end)
                col = line_end;
            return i + col;
        }
        if (buffer[i] == '\n')
            curr_line++;

    }
    return buffer_size - 1;
}


int visual_col_to_text_col(int line, int visual_col)
{
    int line_start = get_pos_from_line_and_col(line, 0);
    if (line_start >= buffer_size)
        return buffer_size;
    int c = 0;
    int text_col = visual_col;
    for (int i = line_start; buffer[i] && c < visual_col; i++)
    {
        if (buffer[i] == '\t')
        {
            if (c + TAB_SIZE > visual_col)
            {
                text_col -= visual_col - c;
                break;
            }
            c += TAB_SIZE;
            text_col -= TAB_SIZE - 1;
        }
        else
            c++;
    }
    return text_col;
}

int text_col_to_visual_col(int line, int text_col)
{
    if (line < 0)
        return 0;
    int line_start = get_pos_from_line_and_col(line, 0);
    int visual_col = text_col;
    if (line_start >= buffer_size)
        return visual_col;
    for (int i = line_start; buffer[i] && i < line_start + text_col; i++)
    {
        if (buffer[i] == '\t')
            visual_col += TAB_SIZE - 1;
    }
    return visual_col;
}

int screen_pos_to_buffer_pos(int screen_x, int screen_y)
{
    int line = (mouse_y + scroll_y - offset_y) / font_line_height;
    int col = (mouse_x + scroll_x - offset_x) / font_advance_x;
    //decrease col by something?
    int line_start = get_pos_from_line_and_col(line, 0);
    if (line_start >= buffer_size)
        return buffer_size;
    int text_col = visual_col_to_text_col(line, col);
    return get_pos_from_line_and_col(line, text_col);
}


void update_and_render_the_editor(Image *draw_buffer, char *input_text)
{
    if (first_frame)
    {
        buffer_filename = "test";
        buffer = load_entire_file(buffer_filename);
        buffer_size = strlen(buffer) + 1;

        stbtt_fontinfo info;

        long size;
        unsigned char *font_contents;
        FILE *file = fopen("liberation-mono.ttf", "rb");
        assert(file);
        fseek(file, 0, SEEK_END);
        size = ftell(file);
        fseek(file, 0, SEEK_SET);
        font_contents = malloc(size);
        fread(font_contents, size, 1, file);
        fclose(file);

        if (!stbtt_InitFont(&info, font_contents, 0))
            assert(0);
        font_line_height = 20;
        float scale = stbtt_ScaleForPixelHeight(&info, font_line_height);

        int ascent, descent, lineGap;
        stbtt_GetFontVMetrics(&info, &ascent, &descent, &lineGap);
        ascent = roundf(ascent * scale);
        descent = roundf(descent * scale);
        for (int c = 32; c < 127; c++)
        {
            uint8_t *bitmap = font_bitmaps[c];
            /* how wide is this character */
            int ax;
            int lsb;
            stbtt_GetCodepointHMetrics(&info, c, &ax, &lsb);
            /* (Note that each Codepoint call has an alternative Glyph version which caches the work required to lookup the character word[i].) */

            /* get bounding box for character (may be offset to account for chars that dip above or below the line) */
            int c_x1, c_y1, c_x2, c_y2;
            stbtt_GetCodepointBitmapBox(&info, c, scale, scale, &c_x1, &c_y1, &c_x2, &c_y2);

            /* compute y (different characters have different heights) */
            int y = ascent + c_y1;
            /* render character (stride and offset is important here) */
            int h = c_y2 - c_y1;
            int w = c_x2 - c_x1;

            //TOOD: changed this ceil for smaller fonts, we gonna need to do better
            font_advance_x = ceilf(ax * scale);
            //printf("%d %f\n", font_advance_x, ax * scale);
            //printf("%d %d %d %d\n", w, h, y, font_advance_x);
            int byteOffset = roundf(lsb * scale) + (y * font_advance_x);
            font_bitmaps[c] = calloc(font_line_height * font_advance_x, sizeof(uint8_t));
            stbtt_MakeCodepointBitmap(&info, font_bitmaps[c] + byteOffset, w, h, font_advance_x, scale, scale, c);
        }
        first_frame = 0;
    }
    int cursor_save_pos = cursor_pos;

    if (is_control_key_pressed && is_pressed[SDL_SCANCODE_Z] && undo_buffer_count)
    {
        Command *c = &undo_buffer[undo_buffer_count - 1];
        undo_buffer_count--;
        cursor_pos = c->c_end_pos;
        switch (c->type)
        {
            case Command_Text:
            case Command_Enter:
            case Command_Paste:
            {
                memmove(buffer + c->c_pos,  buffer + cursor_pos, buffer_size - cursor_pos);
                buffer_size -= cursor_pos - c->c_pos;
                buffer = realloc(buffer, buffer_size);
                break;
            }
            case Command_Backspace:
            {
                int len = strlen(c->removed_string);
                assert(cursor_pos == c->c_pos - len);
                buffer = realloc(buffer, buffer_size + len);
                memmove(buffer + c->c_pos, buffer + c->c_pos - len, buffer_size + len - c->c_pos);
                memcpy(buffer + c->c_pos - len, c->removed_string, len);
                buffer_size += len;
                break;
            }
            //TODO: Cut and Backspace should be the same
            case Command_Cut:
            {
                int len = strlen(c->removed_string);
                assert(c->s_end_pos - c->s_pos == len);
                buffer = realloc(buffer, buffer_size + len);
                memmove(buffer + c->s_end_pos, buffer + c->s_pos, buffer_size + len - c->s_end_pos);
                memcpy(buffer + c->s_pos, c->removed_string, len);
                buffer_size += len;
                break;
            }
            default:
            {
                assert(0);
                break;
            }
        }
        cursor_pos = c->c_pos;
        free(c->removed_string);
        //push to redo buffer?
    }
    if (is_pressed[SDL_SCANCODE_RETURN])
    {
        int c_pos = cursor_pos;

        int line, col;
        get_line_and_col_from_pos(cursor_pos, &line, &col);

        int tab_count = 0;
        int line_start = get_pos_from_line_and_col(line, 0);

        for (int i = line_start; buffer[i] != '\n' && buffer[i] == '\t'; i++)
            tab_count++;
        buffer = realloc(buffer, buffer_size + 1 + tab_count);
        memmove(buffer + cursor_pos + 1 + tab_count, buffer + cursor_pos, buffer_size - cursor_pos);
        buffer[cursor_pos] = '\n';
        for (int j = cursor_pos + 1; j - cursor_pos - 1 < tab_count; j++)
            buffer[j] = '\t';
        cursor_pos += tab_count + 1;
        buffer_size += tab_count + 1;

        push_command(&(Command){
                         .type = Command_Enter,
                         .c_pos = c_pos,
                         .c_end_pos = cursor_pos,
                     });
    }
    if (is_pressed[SDL_SCANCODE_BACKSPACE] && !selection)
    {
        if (cursor_pos)
        {
            char *removed_string = malloc(2);
            removed_string[0] = buffer[cursor_pos - 1];
            removed_string[1] = 0;
            push_command(&(Command){
                             .type = Command_Backspace,
                             .c_pos = cursor_pos,
                             .c_end_pos = cursor_pos - 1,
                             .removed_string = removed_string,
                         });cursor_pos--;
            memmove(buffer + cursor_pos, buffer + cursor_pos + 1, buffer_size - cursor_pos - 1);
            buffer_size--;
        }
    }
    if (is_pressed[SDL_SCANCODE_LEFT])
    {
        if (cursor_pos)
            cursor_pos--;
    }
    if (is_pressed[SDL_SCANCODE_RIGHT])
    {
        if (cursor_pos < buffer_size)
            cursor_pos++;
    }
    {
        int line, col;
        get_line_and_col_from_pos(cursor_pos, &line, &col);
        int visual_col = text_col_to_visual_col(line, col);
        if (is_pressed[SDL_SCANCODE_UP])
        {
            int c = visual_col_to_text_col(line - 1, visual_col);
            cursor_pos = get_pos_from_line_and_col(line - 1, c);
        }
        if (is_pressed[SDL_SCANCODE_DOWN])
        {
            int c = visual_col_to_text_col(line + 1, visual_col);
            cursor_pos = get_pos_from_line_and_col(line + 1, c);
        }
    }
    if (input_text[0])
    {
        int text_len = strlen(input_text);

        for (int i = 0; i < text_len; i++)
        {
            push_command(&(Command){
                             .type = Command_Text,
                             .c_pos = cursor_pos + i,
                             .c_end_pos = cursor_pos + i + 1,
                         });
        }
        buffer = realloc(buffer, buffer_size + text_len);
        memmove(buffer + cursor_pos + text_len, buffer + cursor_pos, buffer_size - cursor_pos);
        memcpy(buffer + cursor_pos, input_text, text_len);
        buffer_size += text_len;
        cursor_pos += text_len;

    }
    if (cursor_save_pos != cursor_pos)
        selection = 0;
    // mouse click & selection
    {
        int mouse_pos = screen_pos_to_buffer_pos(mouse_x, mouse_y);
        int mouse_prev_pos = screen_pos_to_buffer_pos(mouse_prev_x, mouse_prev_y);

        if (is_mouse_left_button_pressed)//&& !selection)
        {
            cursor_pos = mouse_pos;
        }
        if (is_mouse_left_button_pressed && (mouse_x != mouse_prev_x || mouse_y != mouse_prev_y))
        {
            if (!selection || new_selection)
            {
                new_selection = 0;
                selection = 1;
                selection_start_pos = mouse_prev_pos;
            }
            selection_end_pos = mouse_pos;
        }
        if (new_selection && is_mouse_left_button_pressed)
            selection = 0;
        if (!is_mouse_left_button_pressed)
            new_selection = 1;
        if (is_control_key_pressed && is_pressed[SDL_SCANCODE_A])
        {
            selection = 1;
            selection_start_pos = 0;
            selection_end_pos = buffer_size - 1;
        }

    }
    if (selection)
    {
        int pos_start = selection_start_pos;
        int pos_end = selection_end_pos;
        if (pos_start > pos_end)
            swap(&pos_start, &pos_end);
        int len = pos_end - pos_start;
        if (is_control_key_pressed &&
            (is_pressed[SDL_SCANCODE_C] || is_pressed[SDL_SCANCODE_X]))
        {

            clipboard = realloc(clipboard, len + 1);
            memcpy(clipboard, buffer + pos_start, len);
            clipboard[len] = 0;
            //printf("clipboard: \"%s\"\n", clipboard);
        }
        if ((is_control_key_pressed && is_pressed[SDL_SCANCODE_X]) ||
            is_pressed[SDL_SCANCODE_BACKSPACE])
        {
            int c_pos = cursor_pos;

            char *removed_string = malloc(len + 1);
            removed_string[len] = 0;
            memcpy(removed_string, buffer + pos_start, len);

            memmove(buffer + pos_start, buffer + pos_end, buffer_size - pos_end);
            buffer_size -= len;
            buffer = realloc(buffer, buffer_size);
            selection = 0;
            cursor_pos = pos_start;
            //TODO: should we use selection range here?

            push_command(&(Command){
                             .type = Command_Cut,
                             .c_pos = c_pos,
                             .c_end_pos = cursor_pos,
                             .s_pos = pos_start,
                             .s_end_pos = pos_end,
                             .removed_string = removed_string,
                         });
        }
    }
    if (is_control_key_pressed && is_pressed[SDL_SCANCODE_V])
    {
        int c_pos = cursor_pos;
        selection = 0;
        int len = strlen(clipboard);
        buffer = realloc(buffer, buffer_size + len);
        memmove(buffer + cursor_pos + len, buffer + cursor_pos, buffer_size - cursor_pos);
        memcpy(buffer + cursor_pos, clipboard, len);
        buffer_size += len;
        cursor_pos += len;
        push_command(&(Command){
                         .type = Command_Paste,
                         .c_pos = c_pos,
                         .c_end_pos = cursor_pos,
                     });
    }
    assert(cursor_pos >= 0 && cursor_pos <= buffer_size);
    //
    //@rendering
    //

    // calculate scroll
    float dt = 1.0f / 60;

    int cursor_y, cursor_x;
    get_line_and_col_from_pos(cursor_pos, &cursor_y, &cursor_x);

    int cursor_visual_y = cursor_y;
    int cursor_visual_x = cursor_x;
    for (int i = cursor_pos - 1; i >= 0 && buffer[i] != '\n'; i--)
    {
        if (buffer[i] == '\t')
            cursor_visual_x += TAB_SIZE - 1;
    }

    float ddy = mouse_scroll_y * 10000 - scroll_dy * 4;
    scroll_y += ddy * 0.5f * dt * dt + dt * scroll_dy;
    scroll_dy += ddy * dt;

    //TODO: make these work smooth like the mouse

    int filebar_height = font_line_height;
    int max_height = draw_buffer->height - filebar_height;
    int cursor_moved = (cursor_pos != cursor_prev_pos);

    if (cursor_moved && cursor_visual_y * font_line_height >= scroll_y + max_height)
    {
        scroll_y = (cursor_visual_y + 1) * font_line_height - max_height;
    }

    if (cursor_moved && cursor_visual_y * font_line_height < scroll_y)
    {
        scroll_y = cursor_visual_y * font_line_height;
    }

    if (cursor_moved && cursor_visual_x * font_advance_x + offset_x >= scroll_x + draw_buffer->width)
    {
        scroll_x = (cursor_visual_x + 1) * font_advance_x + offset_x - draw_buffer->width;
    }

    if (cursor_moved && cursor_visual_x * font_advance_x < scroll_x)
    {
        scroll_x = cursor_visual_x * font_advance_x;
    }
    int line_count = get_line_count();

    offset_x = uint_len(line_count) * font_advance_x + 10;
    if (scroll_y < 0)
        scroll_y = 0, scroll_dy = 0;
    if (scroll_x < 0)
        scroll_x = 0;
    if (line_count * font_line_height <= max_height)
        scroll_y = 0, scroll_dy = 0;
    else if (scroll_y + max_height > line_count * font_line_height)
        scroll_y = line_count * font_line_height  - max_height;

    //clear the screen
    for (int y = 0; y < draw_buffer->height; y++)
    {
        for (int x = 0; x < draw_buffer->width; x++)
        {
            uint32_t color = 0x22222200;
            if (x < offset_x)
                color = 0;
            draw_buffer->pixels[y * draw_buffer->width + x] = color;
        }
    }
    //draw the cursor
    //if (!selection)
    {
        float cursor_w = font_advance_x * 0.9;
        float cursor_h = font_line_height;
        int min_x = cursor_visual_x * font_advance_x  + offset_x - scroll_x;
        int min_y = cursor_visual_y * font_line_height + offset_y - scroll_y;
        draw_rect(draw_buffer, min_x, min_y, min_x + cursor_w, min_y + cursor_h,
                  1, 0.5, 0, 1);
    }//draw the text
    {
        float y = offset_y;
        float x = offset_x;
        for (int i = 0; buffer[i]; i++)
        {
            if (buffer[i] == '\n')
            {
                y += font_line_height;
                x = offset_x;
                continue;

            }
            int c = buffer[i];
            if (buffer[i] == '\t')
            {
                for (int j = 0; j < TAB_SIZE; j++)
                {
                    draw_char(draw_buffer, ' ', x - scroll_x, y - scroll_y, 1, 1, 1);
                    x += font_advance_x;
                }
            }
            else
            {
                if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
                    || c == '_')
                    draw_char(draw_buffer, c, x - scroll_x, y - scroll_y, 1, 1, 1);
                else
                    draw_char(draw_buffer, c, x - scroll_x, y - scroll_y, 0, 1, 1);
                x += font_advance_x;
            }
        }
    }
    //draw line numbers
    {
        draw_rect(draw_buffer, 0, 0, offset_x, max_height, 0, 0, 0, 1);
        int line_count = get_line_count();
        for (int line = 1; line <= line_count; line++)
        {
            char s[10];
            sprintf(s, "%d", line);
            float y = (line - 1) * font_line_height;
            draw_text(draw_buffer, s, 0, y - scroll_y, 1, 1, 1);
        }

    }
    // draw overlay for line numbers
    draw_rect(draw_buffer, 0, 0, offset_x, draw_buffer->height, 0.7, 0.7, 0.7, 0.5);
    // draw the selection
    if (selection)
    {
        float x = offset_x - scroll_x;
        float y = offset_y - scroll_y;
        for (int i = 0; buffer[i]; i++)
        {

            if ((i >= selection_start_pos && i < selection_end_pos) ||
                (i >= selection_end_pos && i < selection_start_pos))
            {
                int max_x = x + font_advance_x;
                if (buffer[i] == '\t')
                    max_x = x + font_advance_x * TAB_SIZE;
                draw_rect(draw_buffer, x, y, max_x, y + font_line_height,
                          0.1, 0.5, 0.1, 0.4);
            }
            if (buffer[i] == '\n')
            {
                y += font_line_height;
                x = offset_x - scroll_x;
            }
            else
            {
                if (buffer[i] == '\t')
                    x += TAB_SIZE * font_advance_x;
                else
                    x += font_advance_x;
            }
        }
    }

    // file status
    {
        int min_y = draw_buffer->height - filebar_height;
        draw_rect(draw_buffer, 0, min_y,
                  draw_buffer->width, draw_buffer->height, 0.2, 0.3, 0.3, 1);
        char buf[256];
        sprintf(buf, "%s", buffer_filename);
        draw_text(draw_buffer, buf, 0, min_y, 1, 1, 1);

        int line, col;
        get_line_and_col_from_pos(cursor_pos, &line, &col);
        int line_count = get_line_count();
        int scroll_percent = ((float)(scroll_y) / (line_count * font_line_height)) * 100;
        sprintf(buf, "%d,%d    %d%%\n", line + 1, col + 1, scroll_percent);

        draw_text(draw_buffer, buf, draw_buffer->width - strlen(buf) * font_advance_x,
                  min_y, 1, 1, 1);
    }
    mouse_prev_x = mouse_x;
    mouse_prev_y = mouse_y;
    cursor_prev_pos = cursor_pos;
}
