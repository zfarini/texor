#define TAB_SIZE 4
/*TODO:
 *
- open new files, save
- change name of window->text_min_x and use them correctly
- try something like vim command bar to test code reuse
- start vim or emacs stuff
*/
static const char *c_keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double",
                           "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
                           "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union",
                           "unsigned", "void", "volatile", "while"};

typedef enum Command_Type {
    Command_Insert = 1,
    Command_Erase,
} Command_Type;

typedef struct Command {
    Command_Type type;
    int insertion_pos;
    char *inserted_text;
    int inserted_text_len;

    char *erased_text;
    int erased_text_len;

    int erase_range_start;
    int erase_range_end;

    int cursor_pos_before;
    int cursor_pos_after;
    
    int selection;
    int selection_start_pos;
    int selection_end_pos;
} Command;

typedef struct Buffer Buffer;
typedef struct Window Window;

struct Buffer { // this will be shared by multiple windows
    char *data;
    int size; // this includes \0
    char *filename;
    Command undo[4096]; // should this be here or on the window?
    Command redo[4096];
    int undo_count;
    int redo_count;
};

enum Window_Buffer_Mode {
    MODE_NORMAL,
    MODE_INSERT,
};

typedef struct Window_Buffer {
    Buffer *buffer;
    float scroll_y;
    float scroll_x;
    float scroll_dy;
    int selection_start_pos;
    int selection_end_pos;
    int selection;
    int new_selection;
    int cursor_pos;
    int cursor_prev_pos;
    int is_active;
    int is_cmd;
    int mode;
}Window_Buffer;

struct Window {
    int mode;
    Window_Buffer text_buffer;
    Window_Buffer command_buffer;
    // we might have later something like compilation buffer?
    int min_x;
    int max_x;
    int min_y;
    int max_y;
};

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

static Image test_image[64];
static int test_image_count;

//static int mode = MODE_NORMAL;


static Window windows[8];
static Window *active_window;
int window_count = 2;

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

Image image_window(Image *image, int xoffset, int yoffset, int width, int height)
{
    Image result = {
        .width = width,
        .height = height,
        .pitch = image->pitch,
        .pixels = image->pixels + (yoffset * image->pitch) + xoffset,
    };
    return result;
}

void draw_image(Image *screen_buffer, Image *img, int min_x, int min_y, int max_x, int max_y, float a)
{
    if (max_x == min_x || max_y == min_y)
        return ;
    float start_x = min_x;
    float start_y = min_y;
    float xdiv = 1.0f / (max_x - min_x);
    float ydiv = 1.0f / (max_y - min_y);

    if (min_x < 0)
        min_x = 0;
    if (min_y < 0)
        min_y = 0;
    if (max_x > screen_buffer->width)
        max_x = screen_buffer->width;
    if (max_y > screen_buffer->height)
        max_y = screen_buffer->height;
    uint32_t *row = screen_buffer->pixels + min_y * screen_buffer->pitch + min_x;
    for (int y = min_y; y < max_y; y++)
    {
        uint32_t *dest_pixel = (uint32_t *)row;
        for (int x = min_x; x < max_x; x++)
        {
            int src_x = ((float)(x - start_x) * xdiv) * img->width;
            int src_y = ((float)(y - start_y) * ydiv) * img->height;
            uint32_t s = img->pixels[src_y * img->pitch + src_x];
            uint32_t d = *dest_pixel;
            const float one_over_255 = 1.0f / 255.0f;
            float sr = ((s >> 24) & 0xFF) * one_over_255;
            float sg = ((s >> 16) & 0xFF) * one_over_255;
            float sb = ((s >> 8) & 0xFF) * one_over_255;
            float sa = ((s >> 0) & 0xFF) * one_over_255 * a;

            float dr = ((d >> 24) & 0xFF) * one_over_255;
            float dg = ((d >> 16) & 0xFF) * one_over_255;
            float db = ((d >> 8) & 0xFF) * one_over_255;

            uint32_t r = (uint32_t)((dr + (sr - dr) * sa) * 255 + 0.5f);
            uint32_t g = (uint32_t)((dg + (sg - dg) * sa) * 255 + 0.5f);
            uint32_t b = (uint32_t)((db + (sb - db) * sa) * 255 + 0.5f);
            *dest_pixel = (r << 24) | (g << 16) | (b << 8);
            dest_pixel++;
        }
        row += screen_buffer->pitch;
    }
}

void draw_rect(Image *screen_buffer, int min_x, int min_y, int max_x, int max_y,
               float r, float g, float b, float a)
{
    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > screen_buffer->width) max_x = screen_buffer->width;
    if (max_y > screen_buffer->height) max_y = screen_buffer->height;

    uint32_t *row = screen_buffer->pixels + min_y * screen_buffer->pitch + min_x;
    for (int y = min_y; y < max_y; y++)
    {
        uint32_t *pixel = row;
        for (int x = min_x; x < max_x; x++)
        {
            uint32_t p = *pixel;
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;
            
            dr = (1 - a) * dr + a * r;
            dg = (1 - a) * dg + a * g;
            db = (1 - a) * db + a * b;

            *pixel = ((uint32_t)(dr * 255 + 0.5f) << 24) |
                     ((uint32_t)(dg * 255 + 0.5f) << 16) |
                     ((uint32_t)(db * 255 + 0.5f) << 8);
            pixel++;
        }
        row += screen_buffer->pitch;
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

    uint32_t *row = screen_buffer->pixels + min_y * screen_buffer->pitch + min_x;
    uint8_t *src_row = &font_bitmaps[c][(min_y - init_min_y)  * font_advance_x + (min_x - init_min_x)];
    for (int y = min_y; y < max_y; y++)
    {
        uint32_t *pixel = row;
        uint8_t *src_pixel = src_row;
        for (int x = min_x; x < max_x; x++)
        {
            uint8_t grey = *src_pixel++;
            float a = grey / 255.0f;
            uint32_t p = *pixel;
            float dr = ((p >> 24) & 0xFF) / 255.0f;
            float dg = ((p >> 16) & 0xFF) / 255.0f;
            float db = ((p >> 8) & 0xFF) / 255.0f;
            dr = (1 - a) * dr + a * fr;
            dg = (1 - a) * dg + a * fg;
            db = (1 - a) * db + a * fb;
            *pixel = ((uint32_t)(dr * 255 + 0.5f) << 24) |
                     ((uint32_t)(dg * 255 + 0.5f) << 16) |
                     ((uint32_t)(db * 255 + 0.5f) << 8);
            pixel++;
        }
        src_row += font_advance_x;
        row += screen_buffer->pitch;
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
#if 0
void draw_text_f(Image *screen_buffer, int min_x, int min_y, float fr, float fb, float db,
                char *fmt, ...)
{
    char s[4096];
    va_list args;
    va_start(args, fmt);
    vsprintf(s, fmt, args);
    va_end(args);
    draw_text(screen_buffer, s, min_x, min_y, fr, fb, db);
}
#endif

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

int screen_pos_to_buffer_pos(Window_Buffer *wb, int screen_x, int screen_y)
{
    Buffer *buffer = wb->buffer;
    int line = (screen_y + wb->scroll_y) / font_line_height;
    int col = (screen_x + wb->scroll_x) / font_advance_x;
    //decrease col by something?
    int line_start = get_pos_from_line_and_col(buffer, line, 0);
    if (line_start >= buffer->size)
        return buffer->size;
    int text_col = visual_col_to_text_col(buffer, line, col);
    return get_pos_from_line_and_col(buffer, line, text_col);
}

void buffer_insert_at(Buffer *buffer, int pos, char *s, int len)
{
    buffer->data = realloc(buffer->data, buffer->size + len);
    memmove(buffer->data + pos + len, buffer->data + pos, buffer->size - pos);
    memcpy(buffer->data + pos, s, len);
    buffer->size += len;
}

void buffer_erase_range(Buffer *buffer, int start, int end) // end is included
{
    assert(start <= end);
    memmove(buffer->data + start, buffer->data + end + 1, buffer->size - end - 1);
    buffer->size -= end - start + 1;
    buffer->data = realloc(buffer->data, buffer->size);// we don't have to do this?
}

void do_command_(Window_Buffer *wb, Command *command, int redo)
{
    Buffer *buffer = wb->buffer;

    assert(buffer->undo_count < (int)array_length(buffer->undo));
    Command *c = &buffer->undo[buffer->undo_count];
    *c = *command;
    c->selection = wb->selection;
    c->selection_start_pos = wb->selection_start_pos;
    c->selection_end_pos = wb->selection_end_pos;
    buffer->undo_count++;
    
    if (redo == 0)
    {
        for (int i = 0; i < buffer->redo_count; i++)
        {
            free(buffer->redo[i].inserted_text);
            free(buffer->redo[i].erased_text);
        }
        buffer->redo_count = 0;
    }

    if (c->erase_range_start > c->erase_range_end)
        swap(&c->erase_range_start, &c->erase_range_end);

    c->cursor_pos_before = wb->cursor_pos;
    if (c->type == Command_Insert)
    {
        if (!redo)
        {
            char *new = malloc(c->inserted_text_len + 1);
            memcpy(new, c->inserted_text, c->inserted_text_len);
            new[c->inserted_text_len] = 0;
            c->inserted_text = new;
        }
        buffer_insert_at(buffer, c->insertion_pos, c->inserted_text,
                c->inserted_text_len);
    }
    else if (c->type == Command_Erase)
    {
        int len = c->erase_range_end - c->erase_range_start + 1;
        if (!redo)
        {
            c->erased_text = malloc(len + 1);
            c->erased_text_len = len;
            c->erased_text[len] = 0;
        }
        else
            assert(c->erased_text);
        assert(c->erase_range_start + len - 1 < buffer->size);
        memcpy(c->erased_text, buffer->data + c->erase_range_start, len);
        buffer_erase_range(buffer, c->erase_range_start, c->erase_range_end);
    }
    else
        assert(0);
    wb->cursor_pos = c->cursor_pos_after;
}


void do_command(Window_Buffer *wb, Command *command)
{
    do_command_(wb, command, 0);
}

void redo_command(Window_Buffer *wb, Command *command)
{
    do_command_(wb, command, 1);
}

void update_window_buffer(Window_Buffer *wb, Input *input)
{
    assert(wb && wb->buffer && wb->buffer->data);
    Buffer *buffer = wb->buffer;
    assert(wb->cursor_pos >= 0 && wb->cursor_pos < buffer->size);
    int cursor_save_pos = wb->cursor_pos;
    wb->mode = MODE_INSERT;
    if (wb->mode == MODE_NORMAL)
    {
        if (input->is_pressed[SDL_SCANCODE_I])
        {
            input->text = "";
            wb->mode = MODE_INSERT;
        }
        if (input->is_pressed[SDL_SCANCODE_A])
        {
            input->text = "";
            wb->mode = MODE_INSERT;
            if (wb->cursor_pos + 1 < buffer->size)
                wb->cursor_pos++;
        }
    }

    if (wb->mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_ESCAPE])
    {
        wb->mode = MODE_NORMAL;
    }
    if (wb->is_cmd)
        wb->mode = MODE_INSERT;

    if ((wb->mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_LEFT])
        || (wb->mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_H]))
    {
        if (wb->cursor_pos && buffer->data[wb->cursor_pos - 1] != '\n')
            wb->cursor_pos--;
    }
    if ((wb->mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_RIGHT])
        || (wb->mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_L]))
    {
        if (wb->cursor_pos + 1 < buffer->size && buffer->data[wb->cursor_pos] != '\n')
            wb->cursor_pos++;
    }

    {
        int line, col;
        get_line_and_col_from_pos(buffer, wb->cursor_pos, &line, &col);
        int visual_col = text_col_to_visual_col(buffer, line, col);
        if ((wb->mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_UP])
            || (wb->mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_K]))
        {
            int c = visual_col_to_text_col(buffer, line - 1, visual_col);
            wb->cursor_pos = get_pos_from_line_and_col(buffer, line - 1, c);
        }
        if ((wb->mode == MODE_INSERT && input->is_pressed[SDL_SCANCODE_DOWN])
            || (wb->mode == MODE_NORMAL && input->is_pressed[SDL_SCANCODE_J]))
        {
            int c = visual_col_to_text_col(buffer, line + 1, visual_col);
            wb->cursor_pos = get_pos_from_line_and_col(buffer, line + 1, c);
        }
    }
    if (wb->mode == MODE_INSERT)
    {
        if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_Z] && buffer->undo_count)
        {
            Command *c = &buffer->undo[buffer->undo_count - 1];
            buffer->undo_count--;

            buffer->redo[buffer->redo_count] = *c;
            buffer->redo_count++;

            wb->selection = c->selection;
            wb->selection_start_pos = c->selection_start_pos;
            wb->selection_end_pos = c->selection_end_pos;
            if (c->type == Command_Insert)
            {
                buffer_erase_range(buffer, c->insertion_pos,
                                   c->insertion_pos + c->inserted_text_len - 1);
            }
            else
            {
                buffer_insert_at(buffer, c->erase_range_start, c->erased_text, c->erased_text_len);
            }
            wb->cursor_pos = c->cursor_pos_before;
        }

        if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_R] && buffer->redo_count)
        {
            Command *c = &buffer->redo[buffer->redo_count - 1];
            buffer->redo_count--;
            wb->cursor_pos = c->cursor_pos_before;
            redo_command(wb, c);
            wb->selection = 0;
        }

        if (input->is_pressed[SDL_SCANCODE_RETURN])
        {

            Command c = {.type = Command_Insert, .inserted_text = "\n", .inserted_text_len = 1,
                         .insertion_pos = wb->cursor_pos,
                        .cursor_pos_after = wb->cursor_pos + 1};
            do_command(wb, &c);
        }
        if (input->is_pressed[SDL_SCANCODE_BACKSPACE] && !wb->selection && wb->cursor_pos)
        {
            Command c = {.type = Command_Erase, .erase_range_start = wb->cursor_pos - 1,
                         .erase_range_end = wb->cursor_pos - 1,
                        .cursor_pos_after = wb->cursor_pos - 1};
            do_command(wb, &c);
        }

        if (input->text[0])
        {
            for (int i = 0; input->text[i]; i++)
            {
                Command c = {.type = Command_Insert, .inserted_text = input->text,
                            .inserted_text_len = 1,
                            .insertion_pos = wb->cursor_pos,
                            .cursor_pos_after = wb->cursor_pos + 1};
                do_command(wb, &c);
            }
        }
        if (cursor_save_pos != wb->cursor_pos)
            wb->selection = 0;
        // mouse click & selection
        int mouse_pos = screen_pos_to_buffer_pos(wb, input->mouse_x, input->mouse_y);
        int mouse_prev_pos = screen_pos_to_buffer_pos(wb, input->mouse_prev_x, input->mouse_prev_y);
        if (wb->is_cmd)
            input->is_mouse_left_button_pressed = 0;
        if (input->is_mouse_left_button_pressed)//&& !wb->selection)
        {
            wb->cursor_pos = mouse_pos;
        }
        int mouse_moved = (input->mouse_x != input->mouse_prev_x) || (input->mouse_y != input->mouse_prev_y);
        if (input->is_mouse_left_button_pressed && mouse_moved)
        {
            if (!wb->selection || wb->new_selection)
            {
                wb->new_selection = 0;
                wb->selection = 1;
                wb->selection_start_pos = mouse_prev_pos;
            }
            wb->selection_end_pos = mouse_pos;
        }
        if (wb->new_selection && input->is_mouse_left_button_pressed)
            wb->selection = 0;
        if (!input->is_mouse_left_button_pressed)
            wb->new_selection = 1;
        if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_A])
        {
            wb->selection = 1;
            wb->selection_start_pos = 0;
            wb->selection_end_pos = buffer->size - 1;
        }
        if (wb->selection)
        {
            int pos_start = wb->selection_start_pos;
            int pos_end = wb->selection_end_pos;
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
                assert(pos_end >= pos_start);
                Command c = {.type = Command_Erase, .erase_range_start = pos_start,
                            .erase_range_end = pos_end - 1,
                            .cursor_pos_after = pos_start};
                do_command(wb, &c);
                wb->selection = 0;
            }
        }
        if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_V])
        {
            int clipboard_len = strlen(clipboard);
            Command c = {.type = Command_Insert, .inserted_text = clipboard,
                         .inserted_text_len = clipboard_len,
                         .insertion_pos = wb->cursor_pos, 
                        .cursor_pos_after = wb->cursor_pos + clipboard_len};
            do_command(wb, &c);
            wb->selection = 0;
        }
    }

    assert(wb->cursor_pos >= 0 && wb->cursor_pos < buffer->size);
}

void draw_window_buffer(Image *screen_buffer, Window_Buffer *wb, Input *input)
{
    Buffer *buffer = wb->buffer;

    int line_count = get_line_count(buffer);

    float dt = 1.0f / 60;

    int cursor_y, cursor_x;
    get_line_and_col_from_pos(buffer, wb->cursor_pos, &cursor_y, &cursor_x);

    int cursor_visual_y = cursor_y;
    int cursor_visual_x = cursor_x;
    for (int i = wb->cursor_pos - 1; i >= 0 && buffer->data[i] != '\n'; i--)
    {
        if (buffer->data[i] == '\t')
            cursor_visual_x += TAB_SIZE - 1;
    }

    float ddy = input->mouse_scroll_y * 10000 - wb->scroll_dy * 4;
    wb->scroll_y += ddy * 0.5f * dt * dt + dt * wb->scroll_dy;
    wb->scroll_dy += ddy * dt;

    //TODO: make these work smooth like the mouse
    int cursor_moved = (wb->cursor_pos != wb->cursor_prev_pos);

    if (cursor_moved && cursor_visual_y * font_line_height >= wb->scroll_y + screen_buffer->height)
    {
        wb->scroll_y = (cursor_visual_y + 1) * font_line_height - screen_buffer->height;
    }
    if (cursor_moved && cursor_visual_y * font_line_height < wb->scroll_y)
    {
        wb->scroll_y = cursor_visual_y * font_line_height;
    }
    if (cursor_moved && cursor_visual_x * font_advance_x >= wb->scroll_x + screen_buffer->width)
    {
        wb->scroll_x = (cursor_visual_x + 1) * font_advance_x - screen_buffer->width;
    }
    if (cursor_moved && cursor_visual_x * font_advance_x < wb->scroll_x)
    {
        wb->scroll_x = cursor_visual_x * font_advance_x;
    }
    if (wb->scroll_y < 0)
        wb->scroll_y = 0, wb->scroll_dy = 0;
    if (wb->scroll_x < 0)
        wb->scroll_x = 0;
    if (line_count * font_line_height < screen_buffer->height)
        wb->scroll_y = 0, wb->scroll_dy = 0;
    else if (wb->scroll_y + screen_buffer->height > line_count * font_line_height)
    {
        wb->scroll_y = line_count * font_line_height  - screen_buffer->height;
        wb->scroll_dy = 0;
    }
    //draw the cursor
    if (wb->is_active)
    {
        float cursor_w = font_advance_x;
        float cursor_h = font_line_height;
        float r = 0.1, g = 0.7, b = 0;
#if 0
        if (wb->mode == MODE_INSERT)
        {
            cursor_w *= 0.25f;
            cursor_h *= 0.8;
            r = 0.1, g = 0.7, b = 0;
        }
#endif
        int min_x = cursor_visual_x * font_advance_x - wb->scroll_x;
        int min_y = cursor_visual_y * font_line_height - wb->scroll_y;
        draw_rect(screen_buffer, min_x, min_y, min_x + cursor_w, min_y + cursor_h, r, g, b, 1);
    }
    int first_line = (wb->scroll_y) / font_line_height;
    int last_line = first_line + (screen_buffer->height / font_line_height) + 2;

    //draw the text

    if (wb->is_cmd)
    {
        if (wb->is_active)
        {
            draw_text(screen_buffer, buffer->data, 0, 0, 1, 1, 1);
        }
    }
    else
    {
        int string_c = 0;
        int inside_oneline_comment = 0;
        int inside_multiline_comment = 0;
        int line = first_line;
        float y = first_line * font_line_height - wb->scroll_y;
        float x = -wb->scroll_x;
        int i = get_pos_from_line_and_col(buffer, first_line, 0);
        for (; line <= last_line && buffer->data[i];)
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
                x = -wb->scroll_x;
                inside_oneline_comment = 0;
                i++;
                line++;
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

    // draw the window->selection
    if (wb->selection)
    {
        int line = first_line;
        float y = first_line * font_line_height - wb->scroll_y;
        float x = -wb->scroll_x;
        int i = get_pos_from_line_and_col(buffer, first_line, 0);
        for (; buffer->data[i] && line <= last_line; i++)
        {
            if ((i >= wb->selection_start_pos && i < wb->selection_end_pos) ||
                (i >= wb->selection_end_pos && i < wb->selection_start_pos))
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
                x = -wb->scroll_x;
                line++;
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
    wb->cursor_prev_pos = wb->cursor_pos;
}


void update_and_render_window(Window *window, Image *screen_buffer, Input *input)
{
    int line_count = get_line_count(window->text_buffer.buffer); // these should get computed after update?
    int filebar_height = font_line_height;
    int commandbar_height = 0;//font_line_height;
    int line_numbers_width = uint_len(line_count) * font_advance_x + 15;
    int text_height = screen_buffer->height - commandbar_height - filebar_height;
    //clear the screen
    for (int y = 0; y < screen_buffer->height; y++)
        memset(screen_buffer->pixels + y * screen_buffer->pitch, 0x22, screen_buffer->width * 4);
#if 0
    if (window->command_buffer.is_active && input->is_pressed[SDL_SCANCODE_ESCAPE])
    {
        window->command_buffer.is_active = 0;
        window->text_buffer.is_active = 1;
        window->text_buffer.mode = MODE_NORMAL;
    }
    if (!window->command_buffer.is_active && window->text_buffer.mode == MODE_NORMAL
            && input->text[0] == ':') 
    {
        Buffer *buffer = window->command_buffer.buffer;
        free(buffer->data);
        input->text = "";
        buffer->data = calloc(1, 1);
        buffer->size = 1;
        buffer->undo_count = 0;
        buffer->redo_count = 0;
        window->command_buffer.is_active = 1;
        window->command_buffer.cursor_pos = 0;
        window->text_buffer.is_active = 0;
    }
#endif

    int is_pressed[512] = {0};
    {
        Input in = {0};
        if (window->text_buffer.is_active)
        {
            in = *input; 
        }
        else
        {
            in.text = "";
            in.is_pressed = is_pressed;
        }
        in.mouse_x = input->mouse_x - line_numbers_width;
        in.mouse_prev_x = input->mouse_prev_x - line_numbers_width;
        Image img;
        img.width = screen_buffer->width - line_numbers_width;
        img.height = text_height;
        img.pitch = screen_buffer->pitch;
        img.pixels = screen_buffer->pixels + line_numbers_width;
        update_window_buffer(&window->text_buffer, &in);
        draw_window_buffer(&img, &window->text_buffer, &in);
    }
    {
        Input in = {0};
        if (window->command_buffer.is_active)
        {
            in = *input;
        }
        else
        {
            in.text = "";
            in.is_pressed = is_pressed;
        }
        in.mouse_y = input->mouse_y - (screen_buffer->height - commandbar_height);
        in.mouse_prev_y = input->mouse_prev_y - (screen_buffer->height - commandbar_height);
        Image img;
        img.width = screen_buffer->width;
        img.height = commandbar_height;
        img.pitch = screen_buffer->pitch;
        img.pixels = screen_buffer->pixels + (screen_buffer->height - img.height) * img.pitch;
        update_window_buffer(&window->command_buffer, &in);
        draw_window_buffer(&img, &window->command_buffer, &in);
    }
#if 1
    //draw line numbers
    {
        int first_line = (window->text_buffer.scroll_y) / font_line_height;
        int last_line = first_line + (screen_buffer->height / font_line_height) + 1;
        line_count = get_line_count(window->text_buffer.buffer); // might be changed from last time
        if (last_line > line_count)
            last_line = line_count;
        int line = first_line;
        int max_d = uint_len(line_count) * font_advance_x;
        for (int line = first_line; line <= last_line; line++)
        {
            char s[10];
            sprintf(s, "%d", line);
            float y = (line - 1) * font_line_height - window->text_buffer.scroll_y;
            draw_text(screen_buffer, s, 5 + max_d - strlen(s) * font_advance_x, y, 
                        0.7, 0.7, 0.7);
        }
    }
#endif

    // file status
    {
        Buffer *buffer = window->text_buffer.buffer;
        int min_y = text_height;
        draw_rect(screen_buffer, 0, min_y,
                  screen_buffer->width, min_y + filebar_height, 0.2, 0.3, 0.3, 1);
        char buf[256];
        sprintf(buf, "%s", buffer->filename);
        draw_text(screen_buffer, buf, 0, min_y, 1, 1, 1);

        int line, col;
        get_line_and_col_from_pos(buffer, window->text_buffer.cursor_pos, &line, &col);
        int line_count = get_line_count(buffer);
        int scroll_percent = ((float)(window->text_buffer.scroll_y) / (line_count * font_line_height)) * 100;
        sprintf(buf, "%d,%d    %d%%\n", line + 1, col + 1, scroll_percent);

        draw_text(screen_buffer, buf, screen_buffer->width - strlen(buf) * font_advance_x,
                  min_y, 1, 1, 1);
    }
#if 0
    if (window == active_window && test_image_count)
    {
        int w = screen_buffer->width;
        int h = screen_buffer->height;
        int min_x = screen_buffer->width - w - 10 - window->text_buffer.scroll_x;
        int min_y = -window->text_buffer.scroll_y;
        min_x = 0;
        min_y = 0;
        int max_x = min_x + w;
        int max_y = min_y + h;
        static int frame = 0;
        draw_image(screen_buffer, &test_image[(frame / 2) % test_image_count], min_x, min_y, max_x, max_y, 0.2);
        frame++;
    }
#endif
}
void update_and_render_the_editor(Image *screen_buffer, Input *input)
{
    static int first_frame = 1;

    if (first_frame)
    {
        buffers[0].filename = "test";
        buffers[0].data = load_entire_file(buffers[0].filename);
        buffers[0].size = strlen(buffers[0].data) + 1;


        buffers[1].filename = "code/main.c";
        buffers[1].data = load_entire_file(buffers[1].filename);
        buffers[1].size = strlen(buffers[1].data) + 1;

        buffers[2].filename = "command buffer";
        buffers[2].data = calloc(1, 1);
        buffers[2].size = strlen(buffers[2].data) + 1;
        buffers[3].filename = "command buffer";
        buffers[3].data = calloc(1, 1);
        buffers[3].size = strlen(buffers[3].data) + 1;
        
        windows[0].text_buffer.buffer = &buffers[0];
        windows[0].text_buffer.is_active = 1;
        windows[0].command_buffer.buffer = &buffers[2];
        windows[0].command_buffer.is_cmd = 1;
        windows[0].min_x = 5;
        windows[0].max_x = screen_buffer->width / 2 - 5;
        windows[0].min_y = 5;
        windows[0].max_y = screen_buffer->height - 5;
#if 1
        windows[1].text_buffer.buffer = &buffers[1];
        windows[1].text_buffer.is_active = 1;
        windows[1].command_buffer.buffer = &buffers[3];
        windows[1].command_buffer.is_cmd = 1;
        windows[1].min_x = windows[0].max_x;
        windows[1].max_x = screen_buffer->width - 5;
        windows[1].min_y = windows[0].min_y;
        windows[1].max_y = windows[0].max_y;
#endif
        // TODO: when I load this it takes some time and mouse input become broken
#if 0
        Image cow_image = load_image("cow.png");
        printf("%d %d\n", cow_image.width, cow_image.height);
        test_image_count = 36;
        for (int j = 0; j < test_image_count; j++)
        {
            test_image[j] = image_window(&cow_image, 300 * j + 100, 50, 200, cow_image.height - 50);
        }
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
        active_window = &windows[0];
        free(font_contents);
    }
    clock_t t = clock();
#if 1
    if (input->is_mouse_left_button_pressed)
    {
        for (int i = 0; i < window_count; i++)
        {
            Window *window = &windows[i];
            if (input->mouse_x >= window->min_x && input->mouse_x < window->max_x &&
                input->mouse_y >= window->min_y && input->mouse_y < window->max_y)
            {
                active_window = window;
                break;
            }
        }
    }
#endif
    memset(screen_buffer->pixels, 0, screen_buffer->pitch * screen_buffer->height * 4);
    for (int i = 0; i < window_count; i++)
    {
        Window *window = &windows[i];

        Image img;
        img.width = window->max_x - window->min_x;
        img.height = window->max_y - window->min_y;
        img.pixels = screen_buffer->pixels + window->min_y * screen_buffer->pitch + window->min_x;
        img.pitch = screen_buffer->pitch;

        Input window_input = {0};
        int is_pressed[512] = {0};

        if (window == active_window)
        {
            window_input = *input;

        }
        else
        {
//            window->text_buselection = 0;
//           window->new_selection = 0;
            window_input.text = "";
            window_input.is_pressed = is_pressed;
        }
        window_input.dt = input->dt;
        window_input.mouse_x = input->mouse_x - window->min_x;
        window_input.mouse_y = input->mouse_y - window->min_y;
        window_input.mouse_prev_x = input->mouse_prev_x - window->min_x;
        window_input.mouse_prev_y = input->mouse_prev_y - window->min_y;
        update_and_render_window(window, &img, &window_input);
        if (window == active_window)
            draw_rect_outline(screen_buffer, window->min_x, window->min_y,
                              window->max_x, window->max_y, 1, 1, 0, 0, 1);
    }
    t = clock() - t;
    int ms = roundf((double)t / CLOCKS_PER_SEC * 1000.0f);
    char buf[32];
    sprintf(buf, "%d", ms);
    draw_text(screen_buffer, buf, screen_buffer->width - strlen(buf) * font_advance_x,
                0, 1, 1, 1);
}
