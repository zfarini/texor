static const char *c_keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double",
                           "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
                           "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union",
                           "unsigned", "void", "volatile", "while"};

static int font_line_height;
static int font_advance_x;
static uint8_t *font_bitmaps[256];

static char *clipboard;

static Image test_image[64];
static int test_image_count;

static Buffer buffers[8];
static Buffer *active_buffer;
static int buffer_count = 1;

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

Image image_buffer(Image *image, int xoffset, int yoffset, int width, int height)
{
    Image result = {
        .width = width,
        .height = height,
        .pitch = image->pitch,
        .pixels = image->pixels + (yoffset * image->pitch) + xoffset,
    };
    return result;
}

void draw_image(Image *draw_image, Image *img, int min_x, int min_y, int max_x, int max_y, float a)
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
    if (max_x > draw_image->width)
        max_x = draw_image->width;
    if (max_y > draw_image->height)
        max_y = draw_image->height;
    uint32_t *row = draw_image->pixels + min_y * draw_image->pitch + min_x;
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
        row += draw_image->pitch;
    }
}

void draw_rect(Image *draw_image, int min_x, int min_y, int max_x, int max_y,
               float r, float g, float b, float a)
{
    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > draw_image->width) max_x = draw_image->width;
    if (max_y > draw_image->height) max_y = draw_image->height;

    uint32_t *row = draw_image->pixels + min_y * draw_image->pitch + min_x;
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
        row += draw_image->pitch;
    }
}

void draw_rect_outline(Image *draw_image, int min_x, int min_y, int max_x, int max_y,
        int thickness, float r, float g, float b, float a)
{
    draw_rect(draw_image, min_x, min_y, min_x + thickness, max_y, r, g, b, a);
    draw_rect(draw_image, min_x, min_y, max_x, min_y + thickness, r, g, b, a);
    draw_rect(draw_image, min_x, max_y - thickness, max_x, max_y, r, g, b, a);
    draw_rect(draw_image, max_x - thickness, min_y, max_x, max_y, r, g, b, a);
}

//TODO: kerning, antialiasing?
void draw_char(Image *draw_image, int c, int min_x, int min_y, float fr, float fg, float fb)
{
    if (c < 32 || c >= 127)
    {
        draw_rect(draw_image, min_x, min_y, min_x + font_advance_x,
                  min_y + font_line_height, 1, 0, 1, 1);
        return;
    }
    int init_min_x = min_x;
    int init_min_y = min_y;
    int max_x = min_x + font_advance_x;
    int max_y = min_y + font_line_height;

    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > draw_image->width) max_x = draw_image->width;
    if (max_y > draw_image->height) max_y = draw_image->height;

    uint32_t *row = draw_image->pixels + min_y * draw_image->pitch + min_x;
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
        row += draw_image->pitch;
    }
}

void draw_text(Image *draw_image, char *s, int min_x, int min_y, float fr, float fg, float fb)
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
                draw_char(draw_image, ' ', x, y, fr, fg, fb);
                x += font_advance_x;
            }
        }
        else
        {
            draw_char(draw_image, s[i], x, y, fr, fg, fb);
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
    int line = (screen_y + buffer->scroll_y) / font_line_height;
    int col = (screen_x + buffer->scroll_x) / font_advance_x;
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

void move_cursor(Buffer *buffer, int dir, int times)
{
    int line, col;
    get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
    if (dir == UP || dir == DOWN)
    {
        int visual_col = text_col_to_visual_col(buffer, line, col);
        if (dir == UP)
        {
            int c = visual_col_to_text_col(buffer, line - times, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line - times, c);
        }
        else
        {
            int c = visual_col_to_text_col(buffer, line + times, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line + times, c);
        }
    }
    else if (dir == LEFT)
    {
        buffer->cursor_pos = get_pos_from_line_and_col(buffer, line, col - times);
    }
    else if (dir == RIGHT)
    {
        buffer->cursor_pos = get_pos_from_line_and_col(buffer, line, col + times);
        if (buffer->data[buffer->cursor_pos] == '\n' &&
                buffer->cursor_pos && buffer->data[buffer->cursor_pos - 1] != '\n')
            buffer->cursor_pos--;
    }   
}

void do_text_command(Buffer *buffer, char *cmd)
{
    if (!strcmp(cmd, "q"))
        should_quit = 1;
    if (!strcmp(cmd, "w"))
    {
        FILE *file = fopen(buffer->filename, "w");
        if (file)
        {
            fwrite(buffer->data, buffer->size - 1, 1, file);
            fclose(file);
        }
        
    }
}

void do_command_(Buffer *buffer, Command *command, int redo)
{
    assert(buffer->undo_count < (int)array_length(buffer->undo));
    Command *c = &buffer->undo[buffer->undo_count];
    *c = *command;
    c->selection = buffer->selection;
    c->selection_start_pos = buffer->selection_start_pos;
    c->selection_end_pos = buffer->selection_end_pos;
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

    c->cursor_pos_before = buffer->cursor_pos;
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
    buffer->cursor_pos = c->cursor_pos_after;
}


void do_command(Buffer *buffer, Command *command)
{
    do_command_(buffer, command, 0);
}

void redo_command(Buffer *buffer, Command *command)
{
    do_command_(buffer, command, 1);
}

void undo_last_command(Buffer *buffer)
{
    if (!buffer->undo_count)
        return ;
    Command *c = &buffer->undo[buffer->undo_count - 1];
    buffer->undo_count--;
    buffer->redo[buffer->redo_count] = *c;
    buffer->redo_count++;

    buffer->selection = c->selection;
    buffer->selection_start_pos = c->selection_start_pos;
    buffer->selection_end_pos = c->selection_end_pos;
    if (c->type == Command_Insert)
    {
        buffer_erase_range(buffer, c->insertion_pos,
        c->insertion_pos + c->inserted_text_len - 1);
    }
    else
    {
        buffer_insert_at(buffer, c->erase_range_start, c->erased_text, c->erased_text_len);
    }
    buffer->cursor_pos = c->cursor_pos_before;
}

void redo_last_command(Buffer *buffer)
{
    if (!buffer->redo_count)
        return ;
    Command *c = &buffer->redo[buffer->redo_count - 1];
    buffer->redo_count--;
    buffer->cursor_pos = c->cursor_pos_before;
    redo_command(buffer, c);
    buffer->selection = 0;
}


void update_buffer_insert_mode(Buffer *buffer, Input *input)
{

    int cursor_save_pos = buffer->cursor_pos;
    //hack
    int temp_offset_x = uint_len(get_line_count(buffer)) * font_advance_x + 15;
    int mouse_pos = screen_pos_to_buffer_pos(buffer, input->mouse_x - temp_offset_x, input->mouse_y);
    int mouse_prev_pos = screen_pos_to_buffer_pos(buffer, input->mouse_prev_x - temp_offset_x, input->mouse_prev_y);

    if (input->is_pressed[SDL_SCANCODE_LEFT])
    {
        if (buffer->cursor_pos && buffer->data[buffer->cursor_pos - 1] != '\n')
            buffer->cursor_pos--;
    }
    if (input->is_pressed[SDL_SCANCODE_RIGHT])
    {
        if (buffer->cursor_pos + 1 < buffer->size && buffer->data[buffer->cursor_pos] != '\n')
            buffer->cursor_pos++;
    }   
    {
        int line, col;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
        int visual_col = text_col_to_visual_col(buffer, line, col);
        if (input->is_pressed[SDL_SCANCODE_UP])
        {
            int c = visual_col_to_text_col(buffer, line - 1, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line - 1, c);
        }
        if (input->is_pressed[SDL_SCANCODE_DOWN])
        {
            int c = visual_col_to_text_col(buffer, line + 1, visual_col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line + 1, c);
        }
    }
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_Z] && buffer->undo_count)
    {
        undo_last_command(buffer);
    }
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_R] && buffer->redo_count)
    {
        redo_last_command(buffer);

    }
    if (input->is_pressed[SDL_SCANCODE_RETURN])
    {
        if (buffer->text_buffer)
        {
            do_text_command(buffer->text_buffer, buffer->data);
            buffer->text_buffer->switch_to_normal_mode = 1;
        }
        else
        {
            int i = buffer->cursor_pos;
            if (buffer->data[i] == '\n')
                i--;
            while (i >= 0 && buffer->data[i] != '\n')
                i--;
            i++;
            int start = i;
            while (i < buffer->cursor_pos && (buffer->data[i] == ' ' || buffer->data[i] == '\t'))
                i++;
            printf("%d %d\n", i, start);
            char *s = malloc(i - start + 2); // @leak
            s[0] = '\n';
            memcpy(s + 1, buffer->data + start, i - start);
            s[i - start + 1] = 0;
            Command c = {.type = Command_Insert, .inserted_text = s, .inserted_text_len = strlen(s),
                         .insertion_pos = buffer->cursor_pos,
                        .cursor_pos_after = buffer->cursor_pos + strlen(s)};
            do_command(buffer, &c);
        }
    }
    if (input->is_pressed[SDL_SCANCODE_BACKSPACE] && !buffer->selection && buffer->cursor_pos)
    {
        Command c = {.type = Command_Erase, .erase_range_start = buffer->cursor_pos - 1,
                     .erase_range_end = buffer->cursor_pos - 1,
                    .cursor_pos_after = buffer->cursor_pos - 1};
        do_command(buffer, &c);
    }
    if (cursor_save_pos != buffer->cursor_pos)
        buffer->selection = 0;

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
            input->is_pressed[SDL_SCANCODE_BACKSPACE] || input->text[0])
        {
            assert(pos_end >= pos_start);
            Command c = {.type = Command_Erase, .erase_range_start = pos_start,
                        .erase_range_end = pos_end - 1,
                        .cursor_pos_after = pos_start};
            do_command(buffer, &c);
            buffer->selection = 0;
        }
    }
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_V])
    {
        int clipboard_len = strlen(clipboard);
        Command c = {.type = Command_Insert, .inserted_text = clipboard,
                     .inserted_text_len = clipboard_len,
                     .insertion_pos = buffer->cursor_pos, 
                    .cursor_pos_after = buffer->cursor_pos + clipboard_len};
        do_command(buffer, &c);
        buffer->selection = 0;
    }

    if (input->text[0]) // should happen after selection
    {
        for (int i = 0; input->text[i]; i++)
        {
            Command c = {.type = Command_Insert, .inserted_text = input->text,
                        .inserted_text_len = 1,
                        .insertion_pos = buffer->cursor_pos,
                        .cursor_pos_after = buffer->cursor_pos + 1};
            do_command(buffer, &c);
        }
    }
}

void update_and_render_buffer(Buffer *buffer, Image *draw_image, Input *input)
{
    assert(buffer->cursor_pos >= 0 && buffer->cursor_pos < buffer->size);

    int filebar_height = font_line_height;
    int commandbar_height = font_line_height * 2;
    int text_height = draw_image->height - commandbar_height - filebar_height;
    
    int d = text_height - (text_height / font_line_height) * font_line_height;
    text_height -= d;
    assert(text_height % font_line_height == 0);
    commandbar_height += d;

    if (input->is_pressed[SDL_SCANCODE_ESCAPE] || buffer->switch_to_normal_mode)
    {
        buffer->mode = MODE_NORMAL;
        input->text[0] = 0; // is this possible?
        buffer->in[0] = 0;
        free(buffer->cmd_buffer->data);
        memset(buffer->cmd_buffer, 0, sizeof(*buffer->cmd_buffer));
        buffer->cmd_buffer->data = calloc(1, 1);
        buffer->cmd_buffer->size = 1;
        buffer->cmd_buffer->text_buffer = buffer;
        buffer->switch_to_normal_mode = 0;
        buffer->selection = 0;
    }
    if (buffer->mode == MODE_NORMAL && 
            (input->is_pressed[SDL_SCANCODE_I] || input->is_pressed[SDL_SCANCODE_A] ||
             input->is_pressed[SDL_SCANCODE_O]))
    {
        buffer->mode = MODE_INSERT;
        input->text[0] = 0;
        if (input->is_pressed[SDL_SCANCODE_A])
        {
            if (buffer->data[buffer->cursor_pos] != '\n')
                buffer->cursor_pos++;
        }
        else if (input->is_pressed[SDL_SCANCODE_O])
        {
            int line, col;
            get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, line + 1, 0);
            //got to the next lien with the same indentation
        }
    }
    int normal = (buffer->mode == MODE_NORMAL);
    int insert = (buffer->mode == MODE_INSERT || buffer->mode == MODE_COMMAND);
    int switch_to_command_mode = 0;
    // normal & insert mode
    //hack
    int temp_offset_x = uint_len(get_line_count(buffer)) * font_advance_x + 15;
    int mouse_pos = screen_pos_to_buffer_pos(buffer, input->mouse_x - temp_offset_x, input->mouse_y);
    int mouse_prev_pos = screen_pos_to_buffer_pos(buffer, input->mouse_prev_x - temp_offset_x, input->mouse_prev_y);
    if (input->is_mouse_left_button_pressed)//&& !buffer->selection)
    {
        buffer->cursor_pos = mouse_pos;
    }
    if (normal)
    {
        // 5j?
        memcpy(buffer->in + strlen(buffer->in), input->text, strlen(input->text) + 1);
        int l = strlen(buffer->in); 
        int p = 1, j = 0;
        while (j < l && isdigit(buffer->in[j]))
            j++;
        int times = atoi(buffer->in);
        int num = (times > 0);
        if (times <= 0)
            times = 1;
        if (buffer->in[0] == '0')
            j = 0, times = 1;
        char cmd[16];
        int k = j;
        while (k < l && isalpha(buffer->in[k]))
            k++;
        if (k == j)
            k++;
        if (buffer->in[0] == '0')
            k = 1;
        memcpy(cmd, buffer->in + j, k - j);
        cmd[k - j] = 0;
        //if (j < l)
        {
            printf("\"%s\"\n", cmd);
            int adv = 0;
            int invalid = 0;
            if (cmd[0] == 'g')
            {
                if (cmd[1] == 'g')
                {
                    buffer->cursor_pos = get_pos_from_line_and_col(buffer, times - 1, 0); 
                    adv = 2;
                }
                else if (cmd[1])
                    invalid = 1, adv = 1;
            }
            else if (cmd[0] == 'G')
            {
                int l = get_line_count(buffer);
                buffer->cursor_pos = get_pos_from_line_and_col(buffer, l - 1, 0);
                adv = 1;
            }
            else if (cmd[0] == '$')
            {
                while (buffer->cursor_pos + 1 < buffer->size && 
                        buffer->data[buffer->cursor_pos + 1] != '\n')
                    buffer->cursor_pos++;
                adv = 1; 
            }
            else if (!strcmp(cmd, "0"))
            {
                while (buffer->cursor_pos > 0 && buffer->data[buffer->cursor_pos - 1] != '\n')
                    buffer->cursor_pos--;
                adv = 1;
            }
            else if (cmd[0] == 'k')
            {
                move_cursor(buffer, UP, times);
                adv = 1;
            }
            else if (cmd[0] == 'j') 
            {
                move_cursor(buffer, DOWN, times);
                adv = 1;
            }
            else if (cmd[0] == 'h')
            {
                move_cursor(buffer, LEFT, times);
                adv = 1;
            }
            else if (cmd[0] == 'l')
            {
                move_cursor(buffer, RIGHT, times);
                adv = 1;
            }
            else if (cmd[0] == 'H')
            {
                int line, col;
                get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
                int l = buffer->scroll_y / font_line_height;
                buffer->cursor_pos = get_pos_from_line_and_col(buffer, l, 0);
                adv = 1;
            }
            else if (cmd[0] == 'L')
            {
                int line, col;
                get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
                int l = (buffer->scroll_y + text_height) / font_line_height;
                buffer->cursor_pos = get_pos_from_line_and_col(buffer, l - 1, 0);               
                adv = 1;
            }
            else if (cmd[0] == 'x')
            {
                if (buffer->cursor_pos + 1 < buffer->size)
                {
                    Command c = {.type = Command_Erase, .erase_range_start = buffer->cursor_pos,
                                 .erase_range_end = buffer->cursor_pos,
                                .cursor_pos_after = buffer->cursor_pos};
                    do_command(buffer, &c);
                }
                adv = 1;
            }
            else if (cmd[0] == 'd')
            {
                int start = -1, end = -1, new_pos = buffer->cursor_pos;
                if (cmd[1] == 'd')
                {
                    int line, col;
                    get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
                    start = get_pos_from_line_and_col(buffer, line, 0);
                    end = get_pos_from_line_and_col(buffer, line + times, 0) - 1;
                    new_pos = start;
                    adv = 2;
                }
                if (adv)
                {
                    Command c = {.type = Command_Erase, .erase_range_start = start, .erase_range_end = end,
                                .cursor_pos_after = new_pos};
                    do_command(buffer, &c);
                }
                else if (cmd[1]) // invalid skip
                    adv = 2, invalid = 1;
            }
            else if (cmd[0] == 'u')
            {
                for (int i = 0; i < times; i++)
                    undo_last_command(buffer);
                adv = 1;
            }
            else if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_R])
            {
                for (int i = 0; i < times; i++)
                    redo_last_command(buffer);
            }
            else if (cmd[0] == ':')
            {
                switch_to_command_mode = 1;
                adv = 1;
            }
            else if (cmd[0])
                invalid = 1, adv = 1;
            if (invalid)
                printf("INVALID COMMAND: \"%s\"\n", cmd);
            if (adv)
                memmove(buffer->in, buffer->in + j + adv, l - (j + adv) + 1);
        }
    }
    if (buffer->mode == MODE_COMMAND)
        update_buffer_insert_mode(buffer->cmd_buffer, input);
    else if (insert)
        update_buffer_insert_mode(buffer, input);
    assert(buffer->cursor_pos >= 0 && buffer->cursor_pos < buffer->size);
    //
    //rendering
    //
    //
    const int line_count = get_line_count(buffer);

    const int line_numbers_width = uint_len(line_count) * font_advance_x + 15;
    const int text_offset_x = line_numbers_width; 
    const float dt = 1.0f / 60;

    //clear the screen
    for (int y = 0; y < draw_image->height; y++)
        memset(draw_image->pixels + y * draw_image->pitch, 0x22, draw_image->width * 4);


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

    //todo: make these work smooth like the mouse
    int cursor_moved = (buffer->cursor_pos != buffer->cursor_prev_pos);

    if (cursor_moved && cursor_visual_y * font_line_height >= buffer->scroll_y + text_height)
    {
        buffer->scroll_y = (cursor_visual_y + 1) * font_line_height - text_height;
    }
    if (cursor_moved && cursor_visual_y * font_line_height < buffer->scroll_y)
    {
        buffer->scroll_y = cursor_visual_y * font_line_height;
    }
    if (cursor_moved && cursor_visual_x * font_advance_x >= buffer->scroll_x + draw_image->width - line_numbers_width)
    {
        buffer->scroll_x = (cursor_visual_x + 1) * font_advance_x - (draw_image->width - line_numbers_width);
    }
    if (cursor_moved && cursor_visual_x * font_advance_x < buffer->scroll_x)
    {
        buffer->scroll_x = cursor_visual_x * font_advance_x;
    }
    if (buffer->scroll_y < 0)
        buffer->scroll_y = 0, buffer->scroll_dy = 0;
    if (buffer->scroll_x < 0)
        buffer->scroll_x = 0;
    if (line_count * font_line_height < text_height)
        buffer->scroll_y = 0, buffer->scroll_dy = 0;
    else if (buffer->scroll_y + text_height > line_count * font_line_height)
    {
        buffer->scroll_y = line_count * font_line_height  - text_height;
        buffer->scroll_dy = 0;
    }
#if 1
    { // make cursor follow mouse scroll
        int cursor_y, cursor_x;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &cursor_y, &cursor_x);
        int first = buffer->scroll_y / font_line_height;
        int last =  (buffer->scroll_y + text_height) / font_line_height;
        if (cursor_y < first)
        {
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, first + 1, cursor_x);
        }
        if (cursor_y > last)
        {
            buffer->cursor_pos = get_pos_from_line_and_col(buffer, last - 1, cursor_x);
        }
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &cursor_y, &cursor_x);
        cursor_visual_y = cursor_y;
        cursor_visual_x = cursor_x;
        for (int i = buffer->cursor_pos - 1; i >= 0 && buffer->data[i] != '\n'; i--)
        {
            if (buffer->data[i] == '\t')
                cursor_visual_x += TAB_SIZE - 1;
        }
    }
#endif


    const int first_line = (buffer->scroll_y) / font_line_height;
    const int last_line = clamp(0, first_line + (draw_image->height / font_line_height) + 1, line_count);
    //draw the cursor
    if (buffer->mode != MODE_COMMAND)
    {
        float cursor_w = font_advance_x;
        float cursor_h = font_line_height;
        float r = 0.9, g = 0.6, b = 0;
        if (insert)
        {
            r = 0.1, g = 0.7, b = 0;
            cursor_w *= 0.25f;
        }
        int min_x = cursor_visual_x * font_advance_x - buffer->scroll_x + text_offset_x;
        int min_y = cursor_visual_y * font_line_height - buffer->scroll_y;
        draw_rect(draw_image, min_x, min_y, min_x + cursor_w, min_y + cursor_h, r, g, b, 1);
    }

    //draw the text
    {
        int string_c = 0;
        int inside_oneline_comment = 0;
        int inside_multiline_comment = 0;

        int line = first_line;
        float y = first_line * font_line_height - buffer->scroll_y;
        float x = -buffer->scroll_x + text_offset_x;
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
                x = -buffer->scroll_x + text_offset_x;
                inside_oneline_comment = 0;
                i++;
                line++;
            }
            else if (buffer->data[i] == '\t')
            {
                for (int j = 0; j < TAB_SIZE; j++)
                {
                    draw_char(draw_image, ' ', x, y, 1, 1, 1);
                    x += font_advance_x;
                }
                i++;
            }
            else if (buffer->data[i] == ' ')
            {
                draw_char(draw_image, ' ', x, y, 1, 1, 1);
                x += font_advance_x;
                i++;
            }
            else if (inside_comment)
            {
                draw_char(draw_image, buffer->data[i], x, y, 0.5, 0.5, 0.5);
                i++;
                x += font_advance_x;
            }
            else if (string_c % 2 || buffer->data[i] == '"')
            {
                draw_char(draw_image, buffer->data[i], x, y, 0, 0.6, 0.1);
                i++;
                x += font_advance_x;
            }
            else if (isdigit(buffer->data[i]))
            {
                while (isdigit(buffer->data[i]))
                {
                    draw_char(draw_image, buffer->data[i], x, y, 0.8, 0.3, 0.8);
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
                    draw_char(draw_image, buffer->data[i], x, y, r, g, b);
                    i++;
                    x += font_advance_x;
                }
            }
            else
            {
                draw_char(draw_image, buffer->data[i], x, y, 0, 1, 1);
                x += font_advance_x;
                i++;
            }
        }
    }
    // draw the buffer->selection
    if (buffer->selection)
    {
        int line = first_line;
        float y = first_line * font_line_height - buffer->scroll_y;
        float x = -buffer->scroll_x + text_offset_x;
        int i = get_pos_from_line_and_col(buffer, first_line, 0);
        for (; buffer->data[i] && line <= last_line; i++)
        {
            if ((i >= buffer->selection_start_pos && i < buffer->selection_end_pos) ||
                (i >= buffer->selection_end_pos && i < buffer->selection_start_pos))
            {
                int max_x = x + font_advance_x;
                if (buffer->data[i] == '\t')
                    max_x = x + font_advance_x * TAB_SIZE;
                draw_rect(draw_image, x, y, max_x, y + font_line_height,
                          0.1, 0.5, 0.1, 0.4);
            }
            if (buffer->data[i] == '\n')
            {
                y += font_line_height;
                x = -buffer->scroll_x + text_offset_x;
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
#if 1
    //draw line numbers
    {
        draw_rect(draw_image, 0, 0, line_numbers_width, draw_image->height, 0.13, 0.13, 0.13, 1);
        int line = first_line;
        int max_d = uint_len(line_count) * font_advance_x;
        for (int line = first_line; line <= last_line; line++)
        {
            char s[10];
            sprintf(s, "%d", line);
            float y = (line - 1) * font_line_height - buffer->scroll_y;
            draw_text(draw_image, s, 5 + max_d - strlen(s) * font_advance_x, y, 
                        0.7, 0.7, 0.7);
        }
    }
#endif

    // file status
    {
        int min_y = text_height;
        draw_rect(draw_image, 0, min_y,
                  draw_image->width, min_y + filebar_height, 0.2, 0.3, 0.3, 1);
        char buf[256];
        sprintf(buf, "%s", buffer->filename);
        draw_text(draw_image, buf, 0, min_y, 1, 1, 1);
        int line, col;
        get_line_and_col_from_pos(buffer, buffer->cursor_pos, &line, &col);
        int line_count = get_line_count(buffer);
        int scroll_percent = ((float)(buffer->scroll_y) / (line_count * font_line_height)) * 100;
        sprintf(buf, "%d,%d    %d%%\n", line + 1, col + 1, scroll_percent);

        draw_text(draw_image, buf, draw_image->width - strlen(buf) * font_advance_x,
                  min_y, 1, 1, 1);
    }
    // command bar
    {
        int min_y = draw_image->height - commandbar_height;
        draw_rect(draw_image, 0, min_y, draw_image->width, draw_image->height, 0, 0, 0, 1);

        if (buffer->mode == MODE_COMMAND)
        {
            float cursor_w = font_advance_x;
            float cursor_h = font_line_height;
            float r = 0.8, g = 0.8, b = 0.8;
            int cursor_x, cursor_y;
            get_line_and_col_from_pos(buffer->cmd_buffer, buffer->cmd_buffer->cursor_pos, &cursor_y, &cursor_x);
            int x = cursor_x * font_advance_x + font_advance_x;
            int y = min_y + cursor_y  * font_line_height;

            draw_text(draw_image, ":", 0, min_y, 1, 1, 1);
            draw_text(draw_image, buffer->cmd_buffer->data, font_advance_x, min_y, 1, 1, 1);

            draw_rect(draw_image, x, y, x + cursor_w, y + cursor_h, r, g, b, 0.5);
        }
        draw_text(draw_image, buffer->in, draw_image->width - strlen(buffer->in) * font_advance_x - 40, 
                min_y, 1, 1, 1);

    }
#if 0
    if (buffer == active_buffer && test_image_count)
    {
        int w = draw_image->width;
        int h = draw_image->height;
        int min_x = draw_image->width - w - 10 - buffer->text_buffer.scroll_x;
        int min_y = -buffer->text_buffer.scroll_y;
        min_x = 0;
        min_y = 0;
        int max_x = min_x + w;
        int max_y = min_y + h;
        static int frame = 0;
        draw_image(draw_image, &test_image[(frame / 2) % test_image_count], min_x, min_y, max_x, max_y, 0.2);
        frame++;
    }
#endif
    if (switch_to_command_mode) // why?
    {
        buffer->mode = MODE_COMMAND;
    }
    buffer->cursor_prev_pos = buffer->cursor_pos;
    
}

void update_and_render_the_editor(Image *draw_image, Input *input)
{
    static int first_frame = 1;

    if (first_frame)
    {
        buffers[0].filename = "test";
        buffers[0].data = load_entire_file(buffers[0].filename);
        buffers[0].size = strlen(buffers[0].data) + 1;
        buffers[0].min_x = 5;
        buffers[0].max_x = draw_image->width  - 5;
        buffers[0].min_y = 5;
        buffers[0].max_y = draw_image->height - 5;

        buffers[1].filename = "code/main.c";
        buffers[1].data = load_entire_file(buffers[1].filename);
        buffers[1].size = strlen(buffers[1].data) + 1;
        buffers[1].min_x = buffers[0].max_x;
        buffers[1].max_x = draw_image->width - 5;
        buffers[1].min_y = buffers[0].min_y;
        buffers[1].max_y = buffers[0].max_y;

        buffers[2].filename = "command buffer";
        buffers[2].data = calloc(1, 1);
        buffers[2].size = 1;

        buffers[2].text_buffer = &buffers[0];
        buffers[0].cmd_buffer = &buffers[2];

        // TODO: when I load this it takes some time and mouse input become broken
#if 0
        Image cow_image = load_image("cow.png");
        printf("%d %d\n", cow_image.width, cow_image.height);
        test_image_count = 36;
        for (int j = 0; j < test_image_count; j++)
        {
            test_image[j] = image_buffer(&cow_image, 300 * j + 100, 50, 200, cow_image.height - 50);
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
        active_buffer = &buffers[0];
        free(font_contents);
    }

    memset(draw_image->pixels, 0, draw_image->pitch * draw_image->height * 4);

    clock_t t = clock();
#if 0
    if (input->is_mouse_left_button_pressed)
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
#endif

    for (int i = 0; i < buffer_count; i++)
    {
        Buffer *buffer = &buffers[i];

        Image img;
        img.width = buffer->max_x - buffer->min_x;
        img.height = buffer->max_y - buffer->min_y;
        img.pixels = draw_image->pixels + buffer->min_y * draw_image->pitch + buffer->min_x;
        img.pitch = draw_image->pitch;

        Input buffer_input = {0};
        int is_pressed[512] = {0};

        if (buffer == active_buffer)
        {
            buffer_input = *input;
        }
        else
        {
            buffer->selection = 0;
            buffer->new_selection = 0;
            buffer_input.text = "";
            buffer_input.is_pressed = is_pressed;
        }
        buffer_input.dt = input->dt;
        buffer_input.mouse_x = input->mouse_x - buffer->min_x;
        buffer_input.mouse_y = input->mouse_y - buffer->min_y;
        buffer_input.mouse_prev_x = input->mouse_prev_x - buffer->min_x;
        buffer_input.mouse_prev_y = input->mouse_prev_y - buffer->min_y;
        update_and_render_buffer(buffer, &img, &buffer_input);
        if (buffer == active_buffer)
            draw_rect_outline(draw_image, buffer->min_x, buffer->min_y,
                              buffer->max_x, buffer->max_y, 1, 1, 0, 0, 1);
    }
    t = clock() - t;
    int ms = roundf((double)t / CLOCKS_PER_SEC * 1000.0f);
    char buf[32];
    sprintf(buf, "%d", ms);
    draw_text(draw_image, buf, draw_image->width - strlen(buf) * font_advance_x,
                0, 1, 1, 1);
}
