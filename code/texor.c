static const char *c_keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double",
                           "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
                           "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union",
                           "unsigned", "void", "volatile", "while"};
static char *clipboard;

static Image test_image[64];
static int test_image_count;

static Buffer buffers[32];
static Buffer cmd_buffers[32];
static Buffer *active_buffer;
static int buffer_count;
static int cmd_buffer_count;

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
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

void get_line_and_col_from_pos(Buffer *buffer, int pos, int *line, int *col)
{
    int l = 0, c = 0;
    for (int i = 0; buffer->data[i]; i++)
    {
        if (i == pos)
            break;
        if (buffer->data[i] == '\n')
        {
            l++;
            c = 0;
        }
        else
            c++;
    }
    if (line)
        *line = l;
    if (col)
        *col = c;
}

int get_pos_from_line_and_col(Buffer *buffer, int line, int col)
{
    if (line < 0)
        return 0;
    if (col < 0)
        col = 0;
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
    {
        assert(0); // ???
        return buffer->size - 1;
    }
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

struct timespec start, finish;

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
        int i = buffer->cursor_pos;
        if (buffer->data[i] == '\n')
            i--;
        while (i >= 0 && buffer->data[i] != '\n')
            i--;
        i++;
        int start = i;
        while (i < buffer->cursor_pos && (buffer->data[i] == ' ' || buffer->data[i] == '\t'))
            i++;
        char *s = malloc(i - start + 2); // @leak
        s[0] = '\n';
        memcpy(s + 1, buffer->data + start, i - start);
        s[i - start + 1] = 0;
        Command c = {.type = Command_Insert, .inserted_text = s, .inserted_text_len = strlen(s),
                     .insertion_pos = buffer->cursor_pos,
                    .cursor_pos_after = buffer->cursor_pos + strlen(s)};
        do_command(buffer, &c);
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
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_SPACE])
        buffer->marker_pos = buffer->cursor_pos;
    int mouse_moved = (input->mouse_x != input->mouse_prev_x) || (input->mouse_y != input->mouse_prev_y);
    if (input->is_mouse_left_button_pressed)//&& !buffer->selection)
    {
        buffer->cursor_pos = mouse_pos;
    }
#if 0
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
#endif
    //if (buffer->selection)
    {
        int pos_start = buffer->selection_start_pos;
        int pos_end = buffer->selection_end_pos;
        pos_start = buffer->marker_pos;
        pos_end = buffer->cursor_pos;
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
//        if ((input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_X]) ||
  //          input->is_pressed[SDL_SCANCODE_BACKSPACE] || input->text[0])
        if (input->is_control_key_pressed && (input->is_pressed[SDL_SCANCODE_X] 
                || input->is_pressed[SDL_SCANCODE_D]))
        {
            assert(pos_end >= pos_start);
            Command c = {.type = Command_Erase, .erase_range_start = pos_start,
                        .erase_range_end = pos_end - 1,
                        .cursor_pos_after = pos_start};
            do_command(buffer, &c);
            if (buffer->marker_pos > buffer->cursor_pos)
                buffer->marker_pos = buffer->cursor_pos;
            buffer->selection = 0;
        }
    }
    if (input->is_control_key_pressed && input->is_pressed[SDL_SCANCODE_V] && clipboard)
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

    assert(buffer->cursor_pos >= 0 && buffer->cursor_pos < buffer->size);
    //
    //rendering
    //
    //
    const int line_count = get_line_count(buffer);
    const int line_numbers_width = uint_len(line_count) * font_advance_x + 15;
    const int text_offset_x = line_numbers_width + 20; 
    const float dt = 1.0f / 60;

    //clear the screen
    for (int y = 0; y < draw_image->height; y++)
        memset(draw_image->pixels + y * draw_image->pitch, 0x22, draw_image->width * 4);

    int cursor_y, cursor_x;
    get_line_and_col_from_pos(buffer, buffer->cursor_pos, &cursor_y, &cursor_x);
    int cursor_visual_y = cursor_y;
    int cursor_visual_x = text_col_to_visual_col(buffer, cursor_y, cursor_x);

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
        cursor_visual_x = text_col_to_visual_col(buffer, cursor_y, cursor_x);
    }
#endif
    clock_t t = clock();


	const int first_line = (buffer->scroll_y) / font_line_height;
    const int last_line = clamp(0, first_line + (draw_image->height / font_line_height) + 1, line_count);
    //draw the cursor
#if 1
	{
        float cursor_w = font_advance_x;
        float cursor_h = font_line_height;
        float r = 0.9, g = 0.6, b = 0;

        int min_x = cursor_visual_x * font_advance_x - buffer->scroll_x + text_offset_x;
        int min_y = cursor_visual_y * font_line_height - buffer->scroll_y;
        draw_rect(draw_image, min_x, min_y, min_x + cursor_w, min_y + cursor_h, r, g, b, 1);
    
        int marker_y, marker_x;
        get_line_and_col_from_pos(buffer, buffer->marker_pos, &marker_y, &marker_x);
        marker_x = text_col_to_visual_col(buffer, marker_y, marker_x);
        min_x = marker_x * font_advance_x - buffer->scroll_x + text_offset_x;
        min_y = marker_y * font_line_height - buffer->scroll_y;       
        draw_rect_outline(draw_image, min_x, min_y, min_x + cursor_w, min_y + cursor_h, 1, 1, 0, 0, 1);
    }
#endif

    //draw the text

	clock_gettime(CLOCK_MONOTONIC, &start);
#if 1
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
				r = 1, g = 1, b = 1;
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
#else

    float y = first_line * font_line_height - buffer->scroll_y;
    float x = -buffer->scroll_x + text_offset_x;
    int i = get_pos_from_line_and_col(buffer, first_line, 0);
	char *last = buffer->data + i;
	for (; buffer->data[i]; i++)
	{
		if (buffer->data[i] == '\n')
		{
			draw_text(draw_image, last, x, y, 1, 1, 1);
			y += font_line_height;
			last = buffer->data + i + 1;
			//draw_text(draw_image, last, x, y, 1, 1, 1);
			//last = buffer->data + i + 1;
		}
		//y += font_line_height;
	}
#endif
	main_is_waiting = 1;
    // draw the buffer->selection
	
    buffer->cursor_prev_pos = buffer->cursor_pos;
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
            draw_text(draw_image, s, 25 + max_d - strlen(s) * font_advance_x, y, 
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
        sprintf(buf, "%d,%d    %d%%", line + 1, col + 1, scroll_percent);

        draw_text(draw_image, buf, draw_image->width - strlen(buf) * font_advance_x,
                  min_y, 1, 1, 1);
    }
    // command bar
    {
        int min_y = draw_image->height - commandbar_height;
        draw_rect(draw_image, 0, min_y, draw_image->width, draw_image->height, 0, 0, 0, 1);
        draw_text(draw_image, "empty for now", 0, min_y, 1, 1, 1);
    }
#if 0
    if (buffer == active_buffer && test_image_count)
    {
        int w = draw_image->width;
        int h = draw_image->height;
        int min_x = draw_image->width - w - 10 - buffer->scroll_x;
        int min_y = -buffer->scroll_y;
        min_x = 0;
        min_y = 0;
        int max_x = min_x + w;
        int max_y = min_y + h;
        static int frame = 0;
        draw_img(draw_image, &test_image[(frame / 2) % test_image_count], min_x, min_y, max_x, max_y, 0.4);
        frame++;
    }
#endif
}

int nframes = 0;
double time_sum = 0;

void update_and_render_the_editor(Image *draw_image, Input *input)
{
    static int first_frame = 1;

    if (first_frame)
    {
        buffers[0].filename = "test";
        buffers[0].data = load_entire_file(buffers[0].filename);
        buffers[0].size = strlen(buffers[0].data) + 1;
        buffers[0].min_x = 5;
        buffers[0].max_x = draw_image->width - 5;
        buffers[0].min_y = 5;
        buffers[0].max_y = draw_image->height - 5;
        buffer_count++;

        // TODO: when I load this it takes some time and mouse input become broken
#if 1
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
        font_line_height = 40;
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
            font_bitmaps[c] = calloc(font_line_height * font_advance_x + 4, sizeof(uint8_t));
            stbtt_MakeCodepointBitmap(&info, font_bitmaps[c] + byteOffset, w, h, font_advance_x, scale, scale, c);
        }
        first_frame = 0;
        active_buffer = &buffers[0];
        free(font_contents);
    }


    memset(draw_image->pixels, 0, draw_image->pitch * draw_image->height * 4);
	

#if 1
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
            else if (buffer == active_buffer)
                active_buffer = 0;
        }
    }
#endif

    for (int i = 0; i < buffer_count; i++)
    {
        Buffer *buffer = &buffers[i];

#if 1
        Image img = *draw_image;
        img.width = buffer->max_x - buffer->min_x;
        img.height = buffer->max_y - buffer->min_y;
        img.pixels = draw_image->pixels + buffer->min_y * draw_image->pitch + buffer->min_x;
        img.pitch = draw_image->pitch;
#endif

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
        update_and_render_buffer(buffer, draw_image, &buffer_input);
        if (buffer == active_buffer)
            draw_rect_outline(draw_image, buffer->min_x, buffer->min_y,
                              buffer->max_x, buffer->max_y, 1, 1, 0, 0, 1);
        if (should_quit && buffer->filename)
        {
            int fd = open(buffer->filename, O_WRONLY | O_TRUNC);
            if (fd >= 0)
            {
                if (write(fd, buffer->data, buffer->size - 1) < 0)
                    printf("failed to write to file '%s'\n", buffer->filename);
            }
            else
                printf("failed to open file '%s'\n", buffer->filename);
        }
    }
    {
        Buffer *buffer = &buffers[0];
        Image img;
        img.width = buffer->max_x - buffer->min_x;
        img.height = buffer->max_y - buffer->min_y;
        img.pixels = draw_image->pixels + buffer->min_y * draw_image->pitch
            + buffer->max_x + 5;
        img.pitch = draw_image->pitch;
        int scroll = 0;
        if (!active_buffer)
            scroll = input->mouse_scroll_y;
 //       parse(&img, buffer, scroll);
    }

	while (entry_completed < entry_count)
	{
		; // todo: do work instead of just waiting
	}	
	entry_count = 0;
	entry_curr = 0;
	entry_completed = 0;
	clock_gettime(CLOCK_MONOTONIC, &finish);
	double elapsed = (finish.tv_sec - start.tv_sec) * 1000;
	elapsed += (finish.tv_nsec - start.tv_nsec) / 1000000.0;
	nframes++;
	time_sum += elapsed;
	printf("%f\n", elapsed);

	if (should_quit)
		printf("final time: %f\n", time_sum / nframes); 

    char buf[32];
    sprintf(buf, "%d", (int)roundf(elapsed));
   // draw_text(draw_image, buf, draw_image->width - strlen(buf) * font_advance_x,
     //          0, 1, 1, 1);


}
