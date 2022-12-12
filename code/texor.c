#define TAB_SIZE 4

static const char *c_keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double",
                           "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
                           "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union",
                           "unsigned", "void", "volatile", "while"};

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

typedef struct Buffer {
    char *data;
    int size;
    char *filename;
    Command undo[4096];
    int undo_count;
    int selection_start_pos; // this shouldn't be on the buffer because we might have multiple views on the same buffer
    int selection_end_pos;
    int selection;
    int new_selection;
    int cursor_pos;
    int cursor_prev_pos;
    float offset_x;
    float offset_y;
    float scroll_y;
    float scroll_x;
    float scroll_dy;

    int min_x; //TODO: this could be from 0 to 1?
    int min_y;
    int max_x;
    int max_y;
} Buffer;

typedef struct Input {
    char *text;
    int is_control_key_pressed;
    int *is_pressed;
    int mouse_x;
    int mouse_y;
    int mouse_prev_x;
    int mouse_prev_y;
    float mouse_scroll_y;
    int is_mouse_left_button_pressed;
    float dt;
} Input;

static int font_line_height;
static int font_advance_x;
static uint8_t *font_bitmaps[256];

static Buffer *active_buffer;
static Buffer buffers[4];

static char *clipboard;

enum Mode {
    MODE_INSERT,
    MODE_NORMAL,
};

static int mode = MODE_NORMAL;

void push_command(Buffer *buffer, Command *cmd)
{
    buffer->undo[buffer->undo_count] = *cmd;
    buffer->undo_count++;
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

int clamp(int min, int x, int max)
{
    if (x < min)
        x = min;
    if (x > max)
        x = max;
    return x;
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

int is_identifier(char c)
{
    return (isalnum(c) || c == '_');
}

int get_line_count(Buffer *buffer)
{
    int result = 1;
    for (int i = 0; buffer->data[i]; i++)
        result += (buffer->data[i] == '\n');
    return result;
}

void draw_rect(Image *screen_buffer, int min_x, int min_y, int max_x, int max_y,
               float r, float g, float b, float a)
{
    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > screen_buffer->width) max_x = screen_buffer->width;
    if (max_y > screen_buffer->height) max_y = screen_buffer->height;

    for (int y = min_y; y < max_y; y++)
    {
        for (int x = min_x; x < max_x; x++)
        {
            uint32_t p = screen_buffer->pixels[y * screen_buffer->pitch + x];
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;

            dr = lerp(dr, a, r);
            dg = lerp(dg, a, g);
            db = lerp(db, a, b);
            screen_buffer->pixels[y* screen_buffer->pitch + x] =
            ((uint32_t)(dr * 255 + 0.5f) << 24) |
            ((uint32_t)(dg * 255 + 0.5f) << 16) |
            ((uint32_t)(db * 255 + 0.5f) << 8);
        }
    }
}

void draw_rect_outline(Image *screen_buffer, int min_x, int min_y, int max_x, int max_y,
        int thickness, float r, float g, float b, float a)
{
    draw_rect(screen_buffer, min_x, min_y, min_x + thickness, max_y, r, g, b, a);
    draw_rect(screen_buffer, min_x, min_y, max_x, min_y + thickness, r, g, b, a);
    draw_rect(screen_buffer, min_x, max_y - thickness, max_x, max_y, r, g, b, a);
    draw_rect(screen_buffer, max_x - thickness, min_y, max_x, max_y, r, g, b, a);
}

//TODO: kerning, antialiasing?
void draw_char(Image *screen_buffer, int c, int min_x, int min_y, float fr, float fg, float fb)
{
    if (c < 32 || c >= 127)
    {
        draw_rect(screen_buffer, min_x, min_y, min_x + font_advance_x,
                  min_y + font_line_height, 1, 0, 1, 1);
        return;
    }
    int init_min_x = min_x;
    int init_min_y = min_y;
    int max_x = min_x + font_advance_x;
    int max_y = min_y + font_line_height;

    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > screen_buffer->width) max_x = screen_buffer->width;
    if (max_y > screen_buffer->height) max_y = screen_buffer->height;


    for (int y = min_y; y < max_y; y++)
    {
        for (int x = min_x; x < max_x; x++)
        {
            uint8_t grey = font_bitmaps[c][(int)((y - init_min_y) * font_advance_x + (x - init_min_x))];
            float a = grey / 255.0f;
            uint32_t p = screen_buffer->pixels[y * screen_buffer->pitch + x];
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;

            dr = lerp(dr, a, fr);
            dg = lerp(dg, a, fg);
            db = lerp(db, a, fb);
            screen_buffer->pixels[y* screen_buffer->pitch + x] =
            ((uint32_t)(dr * 255 + 0.5f) << 24) |
            ((uint32_t)(dg * 255 + 0.5f) << 16) |
            ((uint32_t)(db * 255 + 0.5f) << 8);
        }
    }
}

void draw_text(Image *screen_buffer, char *s, int min_x, int min_y, float fr, float fg, float fb)
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
                draw_char(screen_buffer, ' ', x, y, fr, fg, fb);
                x += font_advance_x;
            }
        }
        else
        {
            draw_char(screen_buffer, s[i], x, y, fr, fg, fb);
            x += font_advance_x;
        }
    }
}

void get_line_and_col_from_pos(Buffer *buffer, int pos, int *line, int *col)
{
    *line = 0;
    *col = 0;
    for (int i = 0; buffer->data[i]; i++)
    {
        if (i == pos)
            break;
        if (buffer->data[i] == '\n')
        {
            *line = *line + 1;
            *col = 0;
        }
        else
            *col = *col + 1;
    }
}

int get_pos_from_line_and_col(Buffer *buffer, int line, int col)
{
    if (line < 0)
        return 0;
    if (col < 0)
        col = 0;
    //find line start and add to it col? + clamp it
    int curr_line = 0;
    for (int i = 0; buffer->data[i]; i++)
    {
        if (curr_line == line)
        {
            int line_end = 0;
            while (buffer->data[i + line_end] && buffer->data[i + line_end] != '\n')
                line_end++;
            if (col > line_end)
                col = line_end;
            return i + col;
        }
        if (buffer->data[i] == '\n')
            curr_line++;

    }
    return buffer->size - 1;
}

int visual_col_to_text_col(Buffer *buffer, int line, int visual_col)
{
    int line_start = get_pos_from_line_and_col(buffer, line, 0);
    if (line_start >= buffer->size)
        return buffer->size;
    int c = 0;
    int text_col = visual_col;
    for (int i = line_start; buffer->data[i] && c < visual_col; i++)
    {
        if (buffer->data[i] == '\t')
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

int text_col_to_visual_col(Buffer *buffer, int line, int text_col)
{
    if (line < 0)
        return 0;
    int line_start = get_pos_from_line_and_col(buffer, line, 0);
    int visual_col = text_col;
    if (line_start >= buffer->size)
        return visual_col;
    for (int i = line_start; buffer->data[i] && i < line_start + text_col; i++)
    {
        if (buffer->data[i] == '\t')
            visual_col += TAB_SIZE - 1;
    }
    return visual_col;
}

int screen_pos_to_buffer_pos(Buffer *buffer, int screen_x, int screen_y)
{
    int line = (screen_y + buffer->scroll_y - buffer->offset_y) / font_line_height;
    int col = (screen_x + buffer->scroll_x - buffer->offset_x) / font_advance_x;
    //decrease col by something?
    int line_start = get_pos_from_line_and_col(buffer, line, 0);
    if (line_start >= buffer->size)
        return buffer->size;
    int text_col = visual_col_to_text_col(buffer, line, col);
    return get_pos_from_line_and_col(buffer, line, text_col);
}

void update_buffer(Buffer *buffer, Input *input)
{
    int cursor_save_pos = buffer->cursor_pos;

    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_Z] && buffer->undo_count)
    {
        Command *c = &buffer->undo[buffer->undo_count - 1];
        buffer->undo_count--;
        buffer->cursor_pos = c->c_end_pos;
        switch (c->type)
        {
            case Command_Text:
            case Command_Enter:
            case Command_Paste:
            {
                memmove(buffer->data + c->c_pos,  buffer->data + buffer->cursor_pos, buffer->size - buffer->cursor_pos);
                buffer->size -= buffer->cursor_pos - c->c_pos;
                buffer->data = realloc(buffer->data, buffer->size);
                break;
            }
            case Command_Backspace:
            {
                int len = strlen(c->removed_string);
                assert(buffer->cursor_pos == c->c_pos - len);
                buffer->data = realloc(buffer->data, buffer->size + len);
                memmove(buffer->data + c->c_pos, buffer->data + c->c_pos - len, buffer->size + len - c->c_pos);
                memcpy(buffer->data + c->c_pos - len, c->removed_string, len);
                buffer->size += len;
                break;
            }
            //TODO: Cut and Backspace should be the same
            case Command_Cut:
            {
                int len = strlen(c->removed_string);
                assert(c->s_end_pos - c->s_pos == len);
                buffer->data = realloc(buffer->data, buffer->size + len);
                memmove(buffer->data + c->s_end_pos, buffer->data + c->s_pos, buffer->size + len - c->s_end_pos);
                memcpy(buffer->data + c->s_pos, c->removed_string, len);
                buffer->size += len;
                break;
            }
            default:
            {
                assert(0);
                break;
            }
        }
        buffer->cursor_pos = c->c_pos;
        free(c->removed_string);
        //push to redo buffer?
    }
    mode = MODE_INSERT;
    //!!TODO: for the command thing implement it as having multiple buffers and switching between them (also u should be able to disable vim mode?)
    if (mode == MODE_NORMAL && input->text[0] == ':')
    {
    }
    if (mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_I])
    {
        mode = MODE_INSERT;
        input->text[0] = 0;
    }
    if (mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_ESCAPE])
        mode = MODE_NORMAL;
    if (input->is_pressed[SDL_SCANCODE_LEFT] || (mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_H]))
    {
        if (buffer->cursor_pos && buffer->data[buffer->cursor_pos - 1] != '\n')
            buffer->cursor_pos--;
    }
    if (input->is_pressed[SDL_SCANCODE_RIGHT] || (mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_L]))
    {
        if (buffer->cursor_pos < buffer->size && buffer->data[buffer->cursor_pos] != '\n')
            buffer->cursor_pos++;
    }
    {
        int line, col;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
        int visual_col = text_col_to_visual_col(buffer, line, col);
        if (input->is_pressed[SDL_SCANCODE_UP] || (mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_K]))
        {
            int c = visual_col_to_text_col(buffer, line - 1, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line - 1, c);
        }
        if (input->is_pressed[SDL_SCANCODE_DOWN] || (mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_J]))
        {
            int c = visual_col_to_text_col(buffer, line + 1, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line + 1, c);
        }
    }
    if (input->is_pressed[SDL_SCANCODE_RETURN])
    {
        int c_pos = buffer->cursor_pos;

        int line, col;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);

        int tab_count = 0;
        int line_start = get_pos_from_line_and_col(buffer, line, 0);

        for (int i = line_start; buffer->data[i] != '\n' && buffer->data[i] == '\t'; i++)
            tab_count++;
        buffer->data = realloc(buffer->data, buffer->size + 1 + tab_count);
        memmove(buffer->data + buffer->cursor_pos + 1 + tab_count, buffer->data + buffer->cursor_pos, buffer->size - buffer->cursor_pos);
        buffer->data[buffer->cursor_pos] = '\n';
        for (int j = buffer->cursor_pos + 1; j - buffer->cursor_pos - 1 < tab_count; j++)
            buffer->data[j] = '\t';
        buffer->cursor_pos += tab_count + 1;
        buffer->size += tab_count + 1;

        push_command(buffer, &(Command){
                         .type = Command_Enter,
                         .c_pos = c_pos,
                         .c_end_pos = buffer->cursor_pos,
                     });
    }
    if (input->is_pressed[SDL_SCANCODE_BACKSPACE] && !buffer->selection)
    {
        if (buffer->cursor_pos)
        {
            char *removed_string = malloc(2);
            removed_string[0] = buffer->data[buffer->cursor_pos - 1];
            removed_string[1] = 0;
            push_command(buffer, &(Command){
                             .type = Command_Backspace,
                             .c_pos = buffer->cursor_pos,
                             .c_end_pos = buffer->cursor_pos - 1,
                             .removed_string = removed_string,
                         });buffer->cursor_pos--;
            memmove(buffer->data + buffer->cursor_pos, buffer->data + buffer->cursor_pos + 1, buffer->size - buffer->cursor_pos - 1);
            buffer->size--;
        }
    }

    if (input->text[0] && mode == MODE_INSERT)
    {
        int text_len = strlen(input->text);

        for (int i = 0; i < text_len; i++)
        {
            push_command(buffer, &(Command){
                             .type = Command_Text,
                             .c_pos = buffer->cursor_pos + i,
                             .c_end_pos = buffer->cursor_pos + i + 1,
                         });
        }
        buffer->data = realloc(buffer->data, buffer->size + text_len);
        memmove(buffer->data + buffer->cursor_pos + text_len, buffer->data + buffer->cursor_pos, buffer->size - buffer->cursor_pos);
        memcpy(buffer->data + buffer->cursor_pos, input->text, text_len);
        buffer->size += text_len;
        buffer->cursor_pos += text_len;

    }
    if (cursor_save_pos != buffer->cursor_pos)
        buffer->selection = 0;
    // mouse click & selection
    int mouse_pos = screen_pos_to_buffer_pos(buffer, input->mouse_x, input->mouse_y);
    int mouse_prev_pos = screen_pos_to_buffer_pos(buffer, input->mouse_prev_x, input->mouse_prev_y);

    if (input->is_mouse_left_button_pressed)//&& !buffer->selection)
    {
        buffer->cursor_pos = mouse_pos;
    }
    int mouse_moved = (input->mouse_x != input->mouse_prev_x) || (input->mouse_y != input->mouse_prev_y);
    if (input->is_mouse_left_button_pressed && mouse_moved)
    {
        if (!buffer->selection || buffer->new_selection)
        {
            buffer->new_selection = 0;
            buffer->selection = 1;
            buffer->selection_start_pos = mouse_prev_pos;
        }
        buffer->selection_end_pos = mouse_pos;
    }
    if (buffer->new_selection && input->is_mouse_left_button_pressed)
        buffer->selection = 0;
    if (!input->is_mouse_left_button_pressed)
        buffer->new_selection = 1;
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_A])
    {
        buffer->selection = 1;
        buffer->selection_start_pos = 0;
        buffer->selection_end_pos = buffer->size - 1;
    }
    if (buffer->selection)
    {
        int pos_start = buffer->selection_start_pos;
        int pos_end = buffer->selection_end_pos;
        if (pos_start > pos_end)
            swap(&pos_start, &pos_end);
        int len = pos_end - pos_start;
        if (input->is_control_key_pressed &&
            (input->is_pressed[SDL_SCANCODE_C] || input->is_pressed[SDL_SCANCODE_X]))
        {

            clipboard = realloc(clipboard, len + 1);
            memcpy(clipboard, buffer->data + pos_start, len);
            clipboard[len] = 0;
            //printf("clipboard: \"%s\"\n", clipboard);
        }
        if ((input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_X]) ||
            input->is_pressed[SDL_SCANCODE_BACKSPACE])
        {
            int c_pos = buffer->cursor_pos;

            char *removed_string = malloc(len + 1);
            removed_string[len] = 0;
            memcpy(removed_string, buffer->data + pos_start, len);

            memmove(buffer->data + pos_start, buffer->data + pos_end, buffer->size - pos_end);
            buffer->size -= len;
            buffer->data = realloc(buffer->data, buffer->size);
            buffer->selection = 0;
            buffer->cursor_pos = pos_start;
            //TODO: should we use buffer->selection range here?

            push_command(buffer, &(Command){
                             .type = Command_Cut,
                             .c_pos = c_pos,
                             .c_end_pos = buffer->cursor_pos,
                             .s_pos = pos_start,
                             .s_end_pos = pos_end,
                             .removed_string = removed_string,
                         });
        }
    }
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_V])
    {
        int c_pos = buffer->cursor_pos;
        buffer->selection = 0;
        int len = strlen(clipboard);
        buffer->data = realloc(buffer->data, buffer->size + len);
        memmove(buffer->data + buffer->cursor_pos + len, buffer->data + buffer->cursor_pos, buffer->size - buffer->cursor_pos);
        memcpy(buffer->data + buffer->cursor_pos, clipboard, len);
        buffer->size += len;
        buffer->cursor_pos += len;
        push_command(buffer, &(Command){
                         .type = Command_Paste,
                         .c_pos = c_pos,
                         .c_end_pos = buffer->cursor_pos,
                     });
    }

    assert(buffer->cursor_pos >= 0 && buffer->cursor_pos <= buffer->size);

}

void draw_buffer(Image *screen_buffer, Buffer *buffer, Input *input)
{
    // calculate scroll
    float dt = 1.0f / 60;

    int cursor_y, cursor_x;
    get_line_and_col_from_pos(buffer, buffer->cursor_pos, &cursor_y, &cursor_x);

    int cursor_visual_y = cursor_y;
    int cursor_visual_x = cursor_x;
    for (int i = buffer->cursor_pos - 1; i >= 0 && buffer->data[i] != '\n'; i--)
    {
        if (buffer->data[i] == '\t')
            cursor_visual_x += TAB_SIZE - 1;
    }

    float ddy = input->mouse_scroll_y * 10000 - buffer->scroll_dy * 4;
    buffer->scroll_y += ddy * 0.5f * dt * dt + dt * buffer->scroll_dy;
    buffer->scroll_dy += ddy * dt;

    //TODO: make these work smooth like the mouse

    int filebar_height = font_line_height;
    int commandbar_height = font_line_height;
    int bottom_height = filebar_height + commandbar_height;

    int max_height = screen_buffer->height - bottom_height;
    int cursor_moved = (buffer->cursor_pos != buffer->cursor_prev_pos);

    if (cursor_moved && cursor_visual_y * font_line_height >= buffer->scroll_y + max_height)
    {
        buffer->scroll_y = (cursor_visual_y + 1) * font_line_height - max_height;
    }

    if (cursor_moved && cursor_visual_y * font_line_height < buffer->scroll_y)
    {
        buffer->scroll_y = cursor_visual_y * font_line_height;
    }

    if (cursor_moved && cursor_visual_x * font_advance_x + buffer->offset_x >= buffer->scroll_x + screen_buffer->width)
    {
        buffer->scroll_x = (cursor_visual_x + 1) * font_advance_x + buffer->offset_x - screen_buffer->width;
    }

    if (cursor_moved && cursor_visual_x * font_advance_x < buffer->scroll_x)
    {
        buffer->scroll_x = cursor_visual_x * font_advance_x;
    }
    int line_count = get_line_count(buffer);

    buffer->offset_x = uint_len(line_count) * font_advance_x + 10;
    if (buffer->scroll_y < 0)
        buffer->scroll_y = 0, buffer->scroll_dy = 0;
    if (buffer->scroll_x < 0)
        buffer->scroll_x = 0;
    if (line_count * font_line_height <= max_height)
        buffer->scroll_y = 0, buffer->scroll_dy = 0;
    else if (buffer->scroll_y + max_height > line_count * font_line_height)
        buffer->scroll_y = line_count * font_line_height  - max_height;

    //clear the screen
    for (int y = 0; y < screen_buffer->height; y++)
    {
        for (int x = 0; x < screen_buffer->width; x++)
        {
            screen_buffer->pixels[y * screen_buffer->pitch + x] = 0x22;
        }
    }
    //draw the cursor
    //if (!buffer->selection)
    {
        float cursor_w = font_advance_x;
        float cursor_h = font_line_height;
        int min_x = cursor_visual_x * font_advance_x  + buffer->offset_x - buffer->scroll_x;
        int min_y = cursor_visual_y * font_line_height + buffer->offset_y - buffer->scroll_y;
        float r = 1, g = 0.5, b = 0;
        if (mode == MODE_INSERT)
            r = 0.1, g = 0.7, b = 0.1;
        draw_rect(screen_buffer, min_x, min_y, min_x + cursor_w, min_y + cursor_h,
                  r, g, b, 1);
    }//draw the text
    {
        float y = buffer->offset_y - buffer->scroll_y;
        float x = buffer->offset_x - buffer->scroll_x;
        int string_c = 0;
        int inside_oneline_comment = 0;
        int inside_multiline_comment = 0;
        for (int i = 0; buffer->data[i];)
        {
            if (buffer->data[i] == '/' && buffer->data[i + 1] == '/')
                inside_oneline_comment = 1;
            if (i >= 3 && buffer->data[i - 1] == '/' && buffer->data[i - 2] == '*'
                    && buffer->data[i - 3] != '/')
                inside_multiline_comment = 0;
            if (buffer->data[i] == '/' && buffer->data[i + 1] == '*')
                inside_multiline_comment = 1;
            int inside_comment = inside_oneline_comment || inside_multiline_comment;

            if (!inside_comment &&
                    buffer->data[i] == '"' && (!i || buffer->data[i - 1] != '\\'))
                string_c++;
            if (buffer->data[i] == '\n')
            {
                y += font_line_height;
                x = buffer->offset_x - buffer->scroll_x;
                inside_oneline_comment = 0;
                i++;
            }
            else if (buffer->data[i] == '\t')
            {
                for (int j = 0; j < TAB_SIZE; j++)
                {
                    draw_char(screen_buffer, ' ', x, y, 1, 1, 1);
                    x += font_advance_x;
                }
                i++;
            }
            else if (buffer->data[i] == ' ')
            {
                draw_char(screen_buffer, ' ', x, y, 1, 1, 1);
                x += font_advance_x;
                i++;
            }
            else if (inside_comment)
            {
                draw_char(screen_buffer, buffer->data[i], x, y, 0.5, 0.5, 0.5);
                i++;
                x += font_advance_x;
            }
            else if (string_c % 2 || buffer->data[i] == '"')
            {
                draw_char(screen_buffer, buffer->data[i], x, y, 0, 0.6, 0.1);
                i++;
                x += font_advance_x;
            }
            else if (isdigit(buffer->data[i]))
            {
                while (isdigit(buffer->data[i]))
                {
                    draw_char(screen_buffer, buffer->data[i], x, y, 0.8, 0.3, 0.8);
                    i++;
                    x += font_advance_x;
                }
            }
            else if (is_identifier(buffer->data[i]))//assuming buffe[i] is not digit
            {
                int j = i;
                while (is_identifier(buffer->data[j]))
                    j++;
                int keyword_index = -1;
                for (uint32_t k = 0; k < array_length(c_keywords); k++)
                {
                    if (j - i == (int)strlen(c_keywords[k]) &&
                        !memcmp(buffer->data + i, c_keywords[k], j - i))
                    {
                        keyword_index = k;
                        break;
                    }
                }
                float r = 1, g = 1, b = 1;
                if (keyword_index != -1)
                    r = 0.9, g = 0.7, b = 0;
                while (is_identifier(buffer->data[i]))
                {
                    draw_char(screen_buffer, buffer->data[i], x, y, r, g, b);
                    i++;
                    x += font_advance_x;
                }
            }
            else
            {
                draw_char(screen_buffer, buffer->data[i], x, y, 0, 1, 1);
                x += font_advance_x;
                i++;
            }
        }
    }
    //draw line numbers
    {
        draw_rect(screen_buffer, 0, 0, buffer->offset_x, max_height, 0, 0, 0, 1);
        int line_count = get_line_count(buffer);
        for (int line = 1; line <= line_count; line++)
        {
            char s[10];
            sprintf(s, "%d", line);
            float y = (line - 1) * font_line_height;
            draw_text(screen_buffer, s, 0, y - buffer->scroll_y, 1, 1, 1);
        }

    }
    // draw overlay for line numbers
    draw_rect(screen_buffer, 0, 0, buffer->offset_x, screen_buffer->height, 0.7, 0.7, 0.7, 0.5);
    // draw the buffer->selection
    if (buffer->selection)
    {
        float x = buffer->offset_x - buffer->scroll_x;
        float y = buffer->offset_y - buffer->scroll_y;
        for (int i = 0; buffer->data[i]; i++)
        {

            if ((i >= buffer->selection_start_pos && i < buffer->selection_end_pos) ||
                (i >= buffer->selection_end_pos && i < buffer->selection_start_pos))
            {
                int max_x = x + font_advance_x;
                if (buffer->data[i] == '\t')
                    max_x = x + font_advance_x * TAB_SIZE;
                draw_rect(screen_buffer, x, y, max_x, y + font_line_height,
                          0.1, 0.5, 0.1, 0.4);
            }
            if (buffer->data[i] == '\n')
            {
                y += font_line_height;
                x = buffer->offset_x - buffer->scroll_x;
            }
            else
            {
                if (buffer->data[i] == '\t')
                    x += TAB_SIZE * font_advance_x;
                else
                    x += font_advance_x;
            }
        }
    }
    // file status
    {
        int min_y = screen_buffer->height - bottom_height;
        draw_rect(screen_buffer, 0, min_y,
                  screen_buffer->width, min_y + filebar_height, 0.2, 0.3, 0.3, 1);
        char buf[256];
        sprintf(buf, "%s", buffer->filename);
        draw_text(screen_buffer, buf, 0, min_y, 1, 1, 1);

        int line, col;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
        int line_count = get_line_count(buffer);
        int scroll_percent = ((float)(buffer->scroll_y) / (line_count * font_line_height)) * 100;
        sprintf(buf, "%d,%d    %d%%\n", line + 1, col + 1, scroll_percent);

        draw_text(screen_buffer, buf, screen_buffer->width - strlen(buf) * font_advance_x,
                  min_y, 1, 1, 1);
    }

    // command bar
    {
        int min_y = screen_buffer->height - commandbar_height;
        draw_rect(screen_buffer, 0, min_y, screen_buffer->width, min_y + commandbar_height,
                  0.1, 0.1, 0.1, 1);
        //draw_text(screen_buffer, "hello test ::", 0, min_y, 1, 0, 0);
    }
    buffer->cursor_prev_pos = buffer->cursor_pos;
}


void update_and_render_the_editor(Image *screen_buffer, Input *input)
{
    static int first_frame = 1;
    int buffer_count = 2;
    if (first_frame)
    {

        buffers[0].filename = "test";
        buffers[0].data = load_entire_file(buffers[0].filename);
        buffers[0].size = strlen(buffers[0].data) + 1;
        buffers[0].min_x = 5;
        buffers[0].max_x = screen_buffer->width - 5;
        buffers[0].min_y = 5;
        buffers[0].max_y = screen_buffer->height / 2 - 5;

        buffers[1].filename = "code/main.c";
        buffers[1].data = load_entire_file(buffers[1].filename);
        buffers[1].size = strlen(buffers[1].data) + 1;
        buffers[1].min_x = buffers[0].min_x;
        buffers[1].max_x = buffers[0].max_x;
        buffers[1].min_y = buffers[0].max_y + 5;
        buffers[1].max_y = screen_buffer->height - 5;;
#if 0
        buffers[1].min_x = buffers[0].max_x + 10;
        buffers[1].max_x = screen_buffer->width - 5;
        buffers[1].min_y = buffers[0].min_y;
        buffers[1].max_y = buffers[0].max_y;
        buffers[2].filename = "code/stb_image.h";
        buffers[2].data = load_entire_file(buffers[2].filename);
        buffers[2].size = strlen(buffers[2].data) + 1;
        buffers[2].min_x = buffers[0].min_x;
        buffers[2].max_x = screen_buffer->width - 5;
        buffers[2].min_y = buffers[0].max_y + 10;
        buffers[2].max_y = screen_buffer->height - 5;

        buffers[3].filename = "code/stb_truetype.h";
        buffers[3].data = load_entire_file(buffers[3].filename);
        buffers[3].size = strlen(buffers[3].data) + 1;
        buffers[3].min_x = buffers[1].min_x;
        buffers[3].max_x = buffers[1].max_x;
        buffers[3].min_y = buffers[2].min_y;
        buffers[3].max_y = buffers[2].max_y;
#endif

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

    int mouse_moved = (input->mouse_x != input->mouse_prev_x) || (input->mouse_y != input->mouse_prev_y);

    if (input->is_mouse_left_button_pressed && (!active_buffer || !active_buffer->selection))
    {
        for (int i = 0; i < buffer_count; i++)
        {
            Buffer *buffer = &buffers[i];
            if (input->mouse_x >= buffer->min_x && input->mouse_x < buffer->max_x &&
                input->mouse_y >= buffer->min_y && input->mouse_y < buffer->max_y)
            {
                active_buffer = buffer;
                break;
            }
        }
    }
    //memset(screen_buffer->pixels, 0, screen_buffer->pitch * screen_buffer->height * 4);
    for (int i = 0; i < buffer_count; i++)
    {
        Buffer *buffer = &buffers[i];
        int buffer_mouse_x = clamp(0, input->mouse_x - buffer->min_x, buffer->max_x);
        int buffer_mouse_y = clamp(0, input->mouse_y - buffer->min_y, buffer->max_y);
        int buffer_mouse_prev_x = clamp(0, input->mouse_prev_x - buffer->min_x, buffer->max_x);
        int buffer_mouse_prev_y = clamp(0, input->mouse_prev_y - buffer->min_y, buffer->max_y);

        Image img;
        img.width = buffer->max_x - buffer->min_x;
        img.height = buffer->max_y - buffer->min_y;
        img.pixels = screen_buffer->pixels + buffer->min_y * screen_buffer->pitch + buffer->min_x;
        img.pitch = screen_buffer->pitch;
        if (buffer == active_buffer)
        {
            Input buffer_input = *input;
            buffer_input.mouse_x = buffer_mouse_x;
            buffer_input.mouse_y = buffer_mouse_y;
            buffer_input.mouse_prev_x = buffer_mouse_prev_x;
            buffer_input.mouse_prev_y = buffer_mouse_prev_y;
            update_buffer(&buffers[i], &buffer_input);
            draw_buffer(&img, &buffers[i], &buffer_input);
        }
        else
        {
            int is_pressed[512] = {0};
            Input buffer_input = {};
            buffer_input.text = "";
            buffer_input.mouse_x = buffer_mouse_x;
            buffer_input.mouse_y = buffer_mouse_y;
            buffer_input.mouse_prev_x = buffer_mouse_prev_x;
            buffer_input.mouse_prev_y = buffer_mouse_prev_y;
            buffer_input.is_pressed = is_pressed;
            buffer_input.dt = input->dt;
            update_buffer(&buffers[i], &buffer_input);
            draw_buffer(&img, &buffers[i], &buffer_input);
        }

        if (buffer == active_buffer)
            draw_rect_outline(screen_buffer, buffer->min_x, buffer->min_y, buffer->max_x, buffer->max_y, 2, 1, 0, 0, 1);
        else
            draw_rect_outline(screen_buffer, buffer->min_x, buffer->min_y, buffer->max_x, buffer->max_y, 2, 0.5, 0.5, 0.5, 1);
    }
}
