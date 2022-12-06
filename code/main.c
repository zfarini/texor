#include <SDL2/SDL.h>
#include <assert.h>
#define STBI_ONLY_PNG
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#include <stdio.h>

#define array_length(arr) (sizeof(arr) / sizeof(*(arr)))

typedef uint32_t u32;

typedef struct {
	int width;
	int height;
	uint32_t *pixels;
} Image;

typedef struct {
    char *data;
    //TODO: do want this to be unsigned?
    int length;
} String;

//TODO: if I have length 0 but I got some data from previous stuff realloc will be a problem
//TODO: this might be better like string_clone((String){.data = "bla", .length = 3}))
String cstr_to_string(char *cstr, int length)
{
    String s;
    s.length = length;
    s.data = malloc(length);
    memcpy(s.data, cstr, length);
    return s;
}

void string_insert_char_at(String *s, int at, char c)
{
    assert(at >= 0 && at <= s->length);
    s->data = realloc(s->data, s->length + 1);
    memmove(s->data + at + 1, s->data + at, s->length - at);
    s->data[at] = c;
    s->length++;
}

void string_remove_char_at(String *s, int at)
{
    assert(at >= 0 && at < s->length);
    memmove(s->data + at, s->data + at + 1, s->length - (at + 1));
    s->length--;
    s->data = realloc(s->data, s->length);
}

void string_append(String *s1, String s2)
{
    s1->data = realloc(s1->data, s1->length + s2.length);
    memcpy(s1->data + s1->length, s2.data, s2.length);
    s1->length += s2.length;
}

void string_insert_at(String *s1, String s2, int at)
{
    s1->data = realloc(s1->data, s1->length + s2.length);
    memmove(s1->data + at + s2.length, s1->data + at, s1->length - at);
    memcpy(s1->data + at, s2.data, s2.length);
    s1->length += s2.length;
}

String int_to_string(int n)
{
    String s;
    int len = (n <= 0);
    int x = n;
    while (x)
    {
        len++;
        x/= 10;
    }
    s.length = len;
    s.data = malloc(len);
    if (x < 0)
        s.data[0] = '-';
    else if (x == 0)
        s.data[0] = '0';
    x = n;
    while (x)
    {
        s.data[len - 1] = x % 10 + '0';
        x/= 10;
        len--;

    }
    return s;
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

Image load_image(char *filename)
{
    int w, h, n;
    unsigned char *pixels = stbi_load(filename, &w, &h, &n, 4);
    if (!pixels)
    {
        printf("failed to load %s\n", filename);
        assert(0);
    }

    assert(n == 3 || n == 4);
    Image img;
    img.width = w;
    img.height = h;
    img.pixels = (uint32_t *)pixels;//malloc(w * h * 4);
    //pixels are 0xRRGGBBAA
    uint32_t *pixel = img.pixels;
    for (int y = 0; y < img.height; y++)
    {
        for (int x = 0; x < img.width; x++)
        {
			uint32_t p = *pixel;
			uint32_t r = (p >> 0)  & 0xFF;
			uint32_t g = (p >> 8)  & 0xFF;
			uint32_t b = (p >> 16) & 0xFF;
			uint32_t a = (p >> 24) & 0xFF;
            *pixel = (r << 24) | (g << 16) | (b << 8) | (a << 0);
            pixel++;
        }
    }
    //stbi_image_free(pixels);
    return img;
}

char *load_entire_file(char *filename)
{
    FILE *f = fopen(filename, "r");
    if (!f)
    {
        printf("failed to load file: %s\n", filename);
        assert(f);
        return 0;
    }
    fseek(f, 0, SEEK_END);
    long length = ftell(f);
    fseek(f, 0, SEEK_SET);
    char *result = malloc(length + 1);
    assert(result);
    fread(result, 1, length, f);
    result[length] = 0;
    fclose(f);
    //TODO: what should we do about '\r'?
    for (int i = 0; i < length;)
    {
        if (result[i] == '\r')
        {
            memmove(result + i, result + i + 1, length - i);
            length--;
        }
        else
            i++;
    }
    return result;
}

static Image font;

#define FONT_WIDTH 128
#define FONT_HEIGHT 64
#define FONT_COLS 18
#define FONT_ROWS 7
#define FONT_CHAR_WIDTH (FONT_WIDTH / FONT_COLS)
#define FONT_CHAR_HEIGHT (FONT_HEIGHT / FONT_ROWS)
#define FONT_SCALE 2.0f
#define CHAR_WIDTH (FONT_CHAR_WIDTH * FONT_SCALE)
#define CHAR_HEIGHT (FONT_CHAR_HEIGHT * FONT_SCALE)
#define TAB_SIZE 2

void draw_char(Image *draw_buffer, char c, int min_x, int min_y, float scale)
{
	int max_x = min_x + scale * FONT_CHAR_WIDTH;
	int max_y = min_y + scale * FONT_CHAR_HEIGHT;

    float start_x = min_x;
    float start_y = min_y;
    float xdiv = 1.0f / (max_x - min_x);
    float ydiv = 1.0f / (max_y - min_y);
	if (min_x < 0) min_x = 0;
	if (min_y < 0) min_y = 0;
	if (max_x > draw_buffer->width) max_x = draw_buffer->width;
	if (max_y > draw_buffer->height) max_y = draw_buffer->height;

	for (int y = min_y; y < max_y; y++)
	{
		for (int x = min_x; x < max_x; x++)
		{
            if (c > '~' || c < 32)
            {
                draw_buffer->pixels[y * draw_buffer->width + x] = 0xff00ff00;
                continue;
            }
			float tx = (float)(x - start_x) * xdiv;
			float ty = (float)(y - start_y) * ydiv;
			//printf("%d %d %d %d %f %f\n", min_x, min_y, max_x, max_y, tx, ty);
			int fx = tx * FONT_CHAR_WIDTH + ((c - 32) % FONT_COLS) * FONT_CHAR_WIDTH;
			int fy = ty * FONT_CHAR_HEIGHT + ((c - 32) / FONT_COLS) * FONT_CHAR_HEIGHT;
			// fx = (x - min_x)
			assert(fx < font.width);
			assert(fy < font.height);
            assert(fx >= 0);
            assert(fy >= 0);
			uint32_t s = font.pixels[fy * font.width + fx];
			draw_buffer->pixels[y * draw_buffer->width + x] = s;
			//
            // uint32_t d = draw_buffer->pixels[y * draw_buffer->width + x];
            // const float one_over_255 = 1.0f / 255.0f;
            // float sr = ((s >> 24) & 0xFF) * one_over_255;
            // float sg = ((s >> 16) & 0xFF) * one_over_255;
            // float sb = ((s >> 8) & 0xFF) * one_over_255;
            // float sa = ((s >> 0) & 0xFF) * one_over_255;

            // float dr = ((d >> 24) & 0xFF) * one_over_255;
            // float dg = ((d >> 16) & 0xFF) * one_over_255;
            // float db = ((d >> 8) & 0xFF) * one_over_255;
			// printf("%f\n", sa);
            // uint32_t r = (uint32_t)((dr + (sr - dr) * sa) * 255 + 0.5f);
            // uint32_t g = (uint32_t)((dg + (sg - dg) * sa) * 255 + 0.5f);
            // uint32_t b = (uint32_t)((db + (sb - db) * sa) * 255 + 0.5f);
            // draw_buffer->pixels[y * draw_buffer->width + x] = (r << 24) | (g << 16) | (b << 8);


		}
	}
}

void draw_text(Image *draw_buffer, String s, int min_x, int min_y, float scale)
{
	float x = min_x;
	float y = min_y;
	for (int i = 0; i < s.length; i++)
	{
		if (s.data[i] == '\n') continue;
		if (s.data[i] == '\t')
		{
			for (int j = 0; j < TAB_SIZE; j++)
			{
				draw_char(draw_buffer, ' ', x, y, scale);
				x += FONT_CHAR_WIDTH * scale;
			}
			continue;
		}
		draw_char(draw_buffer, s.data[i], x, y, scale);
		x += FONT_CHAR_WIDTH * scale;
	}
}

static String lines[4096];
static int line_count;

static int is_pressed[512];
static int is_control_key_pressed;
static int mouse_prev_x, mouse_prev_y;
static int mouse_x, mouse_y;
static float mouse_scroll_y;
static int is_mouse_left_button_pressed;

static int cursor_prev_x;
static int cursor_prev_y;
static int cursor_x;
static int cursor_y;
static float cursor_w = 4;
static float cursor_h = CHAR_HEIGHT;


static String clip_board;
static int clip_y0;
static int clip_x0;
static int clip_y1;
static int clip_x1;
static int clip;
// if we got a selected a region and then stopped pressing the mouse then this will be true (meaning next time we try to select we will create a new one)
static int new_clip;

static float offset_x = 4 * CHAR_WIDTH + 10;
static float offset_y;
static float scroll_y;
static float scroll_x;
static float scroll_dy;

static int first_frame = 1;

int cursor_visual_to_text(int visual_x, int y)
{
    assert(y >= 0 && y < line_count);
    int result = visual_x;
    int c = 0;
    for (int i = 0; i < lines[y].length  && c < visual_x; i++)
    {
        if (lines[y].data[i] == '\t')
        {
            //TODO: do make this round
            if (c + TAB_SIZE > visual_x)
            {
                result -= visual_x - c;
                break ;
            }
            c += 4;
            result -= TAB_SIZE - 1;
        }
        else
            c++;
    }
    if (result < 0)
        result = 0;
    if (result > lines[y].length)
        result = lines[y].length;
    return result;
}

int cursor_text_to_visual(int x, int y)
{
    assert(y >= 0 && y < line_count);
    int result = x;
    for (int i = 0; i < lines[y].length && i < x; i++)
    {
        if (lines[y].data[i] == '\t')
            result += TAB_SIZE - 1;
    }
    return result;
}

int fix_y(int y)
{
    if (y < 0)
        y = 0;
    if (y >= line_count)
        y = line_count - 1;
    return y;
}

typedef enum {
    Command_Char,
    Command_Enter,
    Command_Backspace,
    Command_Paste,
    Command_Cut,
} Command_Type;

typedef struct {
    Command_Type type;
    int cx, cy; // cursor position before executing the command, (we need to save this because we might type something then move the cursor then undo)
    int removed_char; // backspace
    int cursor_line_length;
    int x0, x1, y0, y1;
}Command;

static Command undo_buffer[4096];
static int undo_buffer_count;
//todo: weird behavior when I input the key on the left of 1
void update_and_render_the_editor(Image *draw_buffer, String input_text)
{
	if (first_frame)
	{
		font = load_image("font.png");
        char *file = load_entire_file("code/main.c");
        for (int i = 0; file[i];)
        {
            while (file[i] == '\n')
            {
                line_count++;// empty lines
                i++;
            }
            if (!file[i])
                break ;
            int j = i;
            while(file[j] && file[j] != '\n')
                j++;
            lines[line_count] = cstr_to_string(file + i, j - i);
            line_count++;
            if (!file[j])
                break ;
            i = j + 1;
        }
        if (file[0] == '\0')
            line_count = 1;
        free(file);
        first_frame = 0;
	}
    //undo
    if (is_control_key_pressed && is_pressed[SDL_SCANCODE_Z] && undo_buffer_count)
    {
        Command *c = &undo_buffer[undo_buffer_count - 1];
        undo_buffer_count--;
        //Apply reverse of command c
        switch (c->type)
        {
            case Command_Char:
            {
                string_remove_char_at(&lines[c->cy], c->cx);
                break;
            }
            case Command_Enter:
            {
                string_append(&lines[c->cy], lines[c->cy + 1]);
                free(lines[c->cy + 1].data);
                for (int y = c->cy + 1; y < line_count - 1; y++)
                {
                    lines[y] = lines[y + 1];
                }
                line_count--;
                break;
            }
            case Command_Backspace:
            {
                if (c->cx)
                {
                    string_insert_char_at(&lines[c->cy], c->cx - 1, c->removed_char);
                }
                else if (c->cy)
                {
                    String prevline = cstr_to_string(lines[c->cy - 1].data,
                                                     lines[c->cy - 1].length - c->cursor_line_length);
                    String newline = cstr_to_string(lines[c->cy - 1].data + lines[c->cy - 1].length - c->cursor_line_length,
                                                    c->cursor_line_length);

                    free(lines[c->cy - 1].data);
                    lines[c->cy - 1] = prevline;
                    for (int i = line_count; i >= c->cy + 1; i--)
                    {
                        lines[i] = lines[i - 1];
                    }
                    lines[c->cy] = newline;
                    line_count++;
                }
                break;
            }
            case Command_Paste:
            {
                break;
            }
            case Command_Cut:
            {
                break;
            }
            default:
            {
                assert(0);
                break;
            }
        }
        cursor_x = c->cx;
        cursor_y = c->cy;
        assert(cursor_y >= 0 && cursor_y < line_count);
        assert(cursor_x >= 0 && cursor_x <= lines[cursor_y].length);
    }

	if (is_pressed[SDL_SCANCODE_RETURN])
	{
        Command *c = &undo_buffer[undo_buffer_count];
        undo_buffer_count++;
        c->type = Command_Enter;
        c->cx = cursor_x;
        c->cy = cursor_y;

        String oldline = cstr_to_string(lines[cursor_y].data, cursor_x);
        String newline = cstr_to_string(lines[cursor_y].data + cursor_x, lines[cursor_y].length - cursor_x);
        free(lines[cursor_y].data);
		lines[cursor_y] = oldline;
		for (int i = line_count; i > cursor_y + 1; i--)
		{
			lines[i] = lines[i - 1];
		}
		lines[cursor_y + 1] = newline;
        cursor_y++;
		cursor_x = 0;
		line_count++;
	}
	if (is_pressed[SDL_SCANCODE_BACKSPACE] && !clip)
	{
        Command *c = &undo_buffer[undo_buffer_count];
        undo_buffer_count++;
        c->type = Command_Backspace;
        c->cx = cursor_x;
        c->cy = cursor_y;
        c->cursor_line_length = lines[c->cy].length;

		if (cursor_x)
		{
            c->removed_char = lines[cursor_y].data[cursor_x - 1];
            string_remove_char_at(&lines[cursor_y], cursor_x - 1);
            cursor_x--;
		}
		else if (cursor_y)
		{
			cursor_x = lines[cursor_y - 1].length;
            string_append(&lines[cursor_y - 1], lines[cursor_y]);
            free(lines[cursor_y].data);
			for (int y = cursor_y; y < line_count - 1; y++)
			{
				lines[y] = lines[y + 1];
			}
			line_count--;
			cursor_y--;
		}
	}
	if (is_pressed[SDL_SCANCODE_LEFT])
	{
		if (cursor_x)
			cursor_x--;
	}
	if (is_pressed[SDL_SCANCODE_RIGHT])
	{
		if (cursor_x < lines[cursor_y].length)
			cursor_x++;
	}
    {
        int cursor_visual_x = cursor_text_to_visual(cursor_x, cursor_y);
        if (is_pressed[SDL_SCANCODE_UP])
        {
            if (cursor_y)
                cursor_y--;
            cursor_x = cursor_visual_to_text(cursor_visual_x, cursor_y);
        }
        if (is_pressed[SDL_SCANCODE_DOWN])
        {
            if (cursor_y < line_count - 1)
                cursor_y++;
            cursor_x = cursor_visual_to_text(cursor_visual_x, cursor_y);
        }
    }

	if (is_pressed[SDL_SCANCODE_TAB])
    {
        //TODO: where we should insert?
        String t;
        t.data = "\t";
        t.length = 1;
        string_append(&input_text, t);
	}

    // selection
    if (is_mouse_left_button_pressed && (mouse_x != mouse_prev_x || mouse_y != mouse_prev_y))
    {
        int mouse_prev_cursor_y = (mouse_prev_y + scroll_y - offset_y) / CHAR_HEIGHT;
        int mouse_prev_cursor_x = (mouse_prev_x + scroll_x - offset_x) / CHAR_WIDTH;
        int mouse_cursor_y = (mouse_y + scroll_y - offset_y) / CHAR_HEIGHT;
        int mouse_cursor_x = (mouse_x + scroll_x - offset_x) / CHAR_WIDTH;
        if (!clip || new_clip)
        {
            clip = 1;
            clip_y0 = fix_y(mouse_prev_cursor_y);
            clip_x0 = cursor_visual_to_text(mouse_prev_cursor_x, clip_y0);
            new_clip = 0;
        }
        clip_y1 = fix_y(mouse_cursor_y);
        clip_x1 = cursor_visual_to_text(mouse_cursor_x, clip_y1);
    }
    if (new_clip && is_mouse_left_button_pressed)
        clip = 0;
    if (!is_mouse_left_button_pressed)
        new_clip = 1;
    if (is_control_key_pressed && is_pressed[SDL_SCANCODE_A])
    {
        clip = 1;
        clip_x0 = 0, clip_y0 = 0, clip_y1 = line_count - 1, clip_x1 = lines[line_count - 1].length;
    }

    // copy / cut

    int copy = (is_control_key_pressed && (is_pressed[SDL_SCANCODE_X] || is_pressed[SDL_SCANCODE_C]));
    int cut = (is_control_key_pressed && is_pressed[SDL_SCANCODE_X]) || (is_pressed[SDL_SCANCODE_BACKSPACE]) || input_text.length;
    if (clip && (copy || cut))
    {
        //calc new clip_board

        int x0 = clip_x0, y0 = clip_y0, x1 = clip_x1, y1 = clip_y1;
        if (y0 > y1)
        {
            swap(&y0, &y1);
            swap(&x0, &x1);
        }
        assert(y0 >= 0 && y0 < line_count);
        assert(y1 >= 0 && y1 < line_count);
        assert(x0 >= 0 && x0 <= lines[y0].length);
        assert(x1 >= 0 && x1 <= lines[y1].length);
        if (y0 < 0)
            y0 = 0;
        if (y1 >= line_count)
            y1 = line_count - 1;
        if (copy)
        {
            if (clip_board.length)
                free(clip_board.data);
            clip_board.data = 0;
            clip_board.length = 0;
            if (y0 == y1)
            {
                if (x0 > x1)
                    swap(&x0, &x1);
                string_append(&clip_board, (String){.data = lines[y0].data + x0,
                                  x1 - x0});
            }
            else
            {
                string_append(&clip_board, (String){.data = lines[y0].data + x0,
                                  .length = lines[y0].length - x0});
                for (int y = y0 + 1; y < y1; y++)
                {
                    string_append(&clip_board, (String){.data = "\n", .length = 1});
                    string_append(&clip_board, lines[y]);
                }
                string_append(&clip_board, (String){.data = "\n", .length = 1});
                string_append(&clip_board, (String){.data = lines[y1].data,
                                  .length = x1});
            }
            printf("clipboard: \"%.*s\"\n", clip_board.length, clip_board.data);
            //SDL_SetClipboardText(clip_board);
        }
        if (cut)
        {
            if (y0 == y1)
            {
                if (x0 > x1)
                    swap(&x0, &x1);
                memmove(lines[y0].data + x0, lines[y0].data +  x1, lines[y0].length - x1);
                lines[y0].length -= x1 - x0;
            }
            else
            {
                lines[y0].data = realloc(lines[y0].data, x0 + lines[y1].length - x1);
                memcpy(lines[y0].data + x0, lines[y1].data + x1, lines[y1].length - x1);
                lines[y0].length = x0 + lines[y1].length - x1;
                for (int y = y0 + 1; y <= y1; y++)
                    free(lines[y].data);
                for (int i = y1 + 1; i < line_count; i++)
                    lines[i - y1 + y0] = lines[i];
                line_count -= y1 - y0;
            }
            clip = 0;
            new_clip = 1;
        }
    }
#if 0
    if (is_control_key_pressed && is_pressed[SDL_SCANCODE_V] && clip_board.length && !clip)
    {
        int cy = cursor_y;

        //TODO: what if we make clip_board an array of strings?
        int i = 0;
        if (clip_board.data[0] == '\n')
        {
            i++;
        }
        else
        {
            int j = 0;
            while (j < clip_board.length && clip_board.data[j] != '\n')
                j++;
            string_append(&lines[cy], (String){clip_board.data, j});
            i = j;
        }
        cy++;
        while (i < clip_board.length)
        {
            while (i < clip_board.length && clip_board.data[i] == '\n')
            {
                memmove(lines + cy + 1, lines + cy, (line_count - cy) * sizeof(char *));
                lines[cy] = (String){0};
                line_count++;
                i++;
                cy++;
            }
            if (i == clip_board.length)
                break ;
            int j = i;
            while (j < clip_board.length && clip_board.data[j] != '\n')
                j++;

            memmove(lines + cy + 1, lines + cy, (line_count - cy) * sizeof(char *));
            lines[cy] = cstr_to_string(clip_board.data + i, j - i);
            line_count++;
            cy++;

            i = j;
            // if the last char in the string is a newline, we make a line for it
            if (clip_board.data[j] == '\n' && clip_board.data[j + 1])
                i++;
        }
        if (cy == cursor_y + 1)
            cursor_x += clip_board.length;
        else
            cursor_x = lines[cy - 1].length;
        assert(cy);
        cursor_y = cy - 1;
    }
#endif
    //update cursor by mouse position
    if (is_mouse_left_button_pressed)
    {
        int mouse_cursor_y = (mouse_y + scroll_y - offset_y) / CHAR_HEIGHT;
        int mouse_cursor_x = (mouse_x + scroll_x - offset_x) / CHAR_WIDTH;

        cursor_y = fix_y(mouse_cursor_y);
        cursor_x = cursor_visual_to_text(mouse_cursor_x, cursor_y);
    }

	if (input_text.length)
	{
        string_insert_at(&lines[cursor_y], input_text, cursor_x);
        for (int i = 0; i < input_text.length; i++)
        {
            Command *c = &undo_buffer[undo_buffer_count];
            undo_buffer_count++;
            c->type = Command_Char;
            c->cx = cursor_x + i;
            c->cy = cursor_y;
        }
		cursor_x += input_text.length;
	}

    //
    //
    //rendering
    //
    //
    //

    float dt = 1.0f / 60;

    int cursor_visual_y = cursor_y;
    int cursor_visual_x = cursor_text_to_visual(cursor_x, cursor_y);


    float ddy = mouse_scroll_y * 10000 - scroll_dy * 4;
    scroll_y += ddy * 0.5f * dt * dt + dt * scroll_dy;
    scroll_dy += ddy * dt;
    //TODO: make these work smooth like the mouse
    int cursor_moved = (cursor_x != cursor_prev_x || cursor_y != cursor_prev_y);
    if (cursor_moved && cursor_visual_y * CHAR_HEIGHT >= scroll_y + draw_buffer->height)
	{
        scroll_y = (cursor_visual_y + 1) * CHAR_HEIGHT - draw_buffer->height;
	}

    if (cursor_moved && cursor_visual_y * CHAR_HEIGHT < scroll_y)
    {
        scroll_y = cursor_visual_y * CHAR_HEIGHT;
    }

    if (cursor_moved && cursor_visual_x * CHAR_WIDTH + offset_x >= scroll_x + draw_buffer->width)
	{
        scroll_x = (cursor_visual_x + 1) * CHAR_WIDTH + offset_x - draw_buffer->width;
	}

    if (cursor_moved && cursor_visual_x * CHAR_WIDTH < scroll_x)
    {
        scroll_x = cursor_visual_x * CHAR_WIDTH;
    }



    if (scroll_y < 0)
        scroll_y = 0, scroll_dy = 0;
    if (scroll_x < 0)
        scroll_x = 0;
    if (line_count * CHAR_HEIGHT <= draw_buffer->height)
        scroll_y = 0, scroll_dy = 0;
    else if (scroll_y + draw_buffer->height > line_count * CHAR_HEIGHT)
        scroll_y = line_count * CHAR_HEIGHT  - draw_buffer->height;

	//clear the screen
	for (int y = 0; y < draw_buffer->height; y++)
	{
		for (int x = 0; x < draw_buffer->width; x++)
			draw_buffer->pixels[y * draw_buffer->width + x] = 0;
	}
    //draw the text
    {
        float y = offset_y;
        //TODO: don't iterate over all lines
        for (int i = 0; i < line_count; i++)
        {

            draw_text(draw_buffer, lines[i], offset_x - scroll_x, y - scroll_y, FONT_SCALE);
#if 1
            String s = int_to_string(i);

            for (int cy = y - scroll_y; cy < y - scroll_y + CHAR_HEIGHT && cy <draw_buffer->height; cy++)
            {
                for (int cx = 0; cx < offset_x && cx < draw_buffer->width; cx++)
                {
                    if (cy >= 0)
                        draw_buffer->pixels[cy * draw_buffer->width + cx] = 0;
                }
            }

            draw_text(draw_buffer, s, 0, y - scroll_y, FONT_SCALE);
            free(s.data);
#endif
		    y += CHAR_HEIGHT;

	    }
    }
    // draw overlay for line numbers
	for (int y = 0; y < draw_buffer->height; y++)
	{
		for (int x = 0; x < offset_x; x++)
		{
			uint32_t p = draw_buffer->pixels[y * draw_buffer->width + x];
			float r = ((p >> 24) & 0xFF) / 255.0f;
			float g = ((p >> 16) & 0xFF) / 255.0f;
			float b = ((p >> 8) & 0xFF) / 255.0f;
			r = lerp(r, 0.7, 0.5f);
			g = lerp(g, 0.7, 0.5f);
			b = lerp(b, 0.7, 0.5f);
			draw_buffer->pixels[y * draw_buffer->width + x] = ((uint32_t)(r * 255 + 0.5f) << 24) |
				((uint32_t)(g * 255 + 0.5f) << 16) |
				((uint32_t)(b * 255 + 0.5f) << 8);
		}
	}
#if 1
    // draw the selection overlay
    if (clip)
    {
        //TODO:
        //  if the cursor moved while there is selection it should be removed (but right now we move the cursor with the selection so it will always be true)
        //  order of doing stuff
        int y0 = clip_y0;
        int y1 = clip_y1;
        int x0 = cursor_text_to_visual(clip_x0, y0);
        int x1 = cursor_text_to_visual(clip_x1, y1);

        if (y0 > y1)
        {
            swap(&y0, &y1);
            swap(&x0, &x1);
        }

        y0 = ceilf(y0 * CHAR_HEIGHT - scroll_y + offset_y);
        y1 = ceilf(y1 * CHAR_HEIGHT - scroll_y + offset_y);
        x0 = x0 * CHAR_WIDTH - scroll_x + offset_x;
        x1 = x1 * CHAR_WIDTH - scroll_x + offset_x;
        //TODO: we need to be precise with the borders
        for (int y = (y0 < 0 ? 0 : y0); y < y1 + CHAR_HEIGHT && y < draw_buffer->height; y++)
        {
            int cy = (scroll_y + y - offset_y) / CHAR_HEIGHT;
            int tabs = 0;
            for (int i = 0; i < lines[cy].length; i++)
                tabs += (lines[cy].data[i] == '\t');

            for (int x = offset_x; x < draw_buffer->width; x++)
            {
                int in = 1;
                if (y0 == y1)
                {
                    if (x1 == x0)
                        in = 0;
                    if (x0 < x1 && (x < x0 || x >= x1))
                        in = 0;
                    if (x0 > x1 && (x < x1 || x >= x0))
                        in = 0;
                }
                else
                {

                    if ((y >= y0 && y < y0 + CHAR_HEIGHT) && x < x0)
                        in = 0;
                    if ((y >= y1 && y < y1 + CHAR_HEIGHT) && x >= x1)
                        in = 0;
                }
                int cx = (x - + scroll_x - offset_x) / (CHAR_WIDTH);

                if (cx >= lines[cy].length + 1 + (TAB_SIZE - 1) * tabs)
                    break;
                if (in)
                {
                    uint32_t p = draw_buffer->pixels[y * draw_buffer->width + x];
                    float r = ((p >> 24) & 0xFF) / 255.0f;
                    float g = ((p >> 16) & 0xFF) / 255.0f;
                    float b = ((p >> 8) & 0xFF) / 255.0f;
#if 1
                    r = lerp(r, 0.7, 0);
                    g = lerp(g, 0.5, 0.5);
                    b = lerp(b, 0.7, 0);
#endif
                    draw_buffer->pixels[y * draw_buffer->width + x] = ((uint32_t)(r * 255 + 0.5f) << 24) |
                        ((uint32_t)(g * 255 + 0.5f) << 16) |
                        ((uint32_t)(b * 255 + 0.5f) << 8);
                }
            }
        }
    }
#endif
    //draw the cursor
#if 1
	{
		static float time = 0;
		float alpha = (sin(time * 5) + 1) * 0.5f;
		uint32_t r = 255, g = 0, b = 0;
        alpha = 1;
		r *= alpha, g *= alpha, b *= alpha;
		uint32_t c = (r << 24) | (g << 16) | (b << 8);
		int min_x = cursor_visual_x * CHAR_WIDTH  + offset_x - scroll_x;
		int max_x = min_x + cursor_w;
		int min_y = cursor_visual_y * CHAR_HEIGHT + offset_y - scroll_y;
		int max_y = min_y + cursor_h;

		if (min_x < 0) min_x = 0;
		if (min_y < 0) min_y = 0;
		if (max_x > draw_buffer->width) max_x = draw_buffer->width;
		if (max_y > draw_buffer->height) max_y = draw_buffer->height;
		for (int y = min_y; y < max_y; y++)
		{
			for (int x = min_x; x < max_x; x++)
			{

				draw_buffer->pixels[y * draw_buffer->width + x] = c;
			}
		}
		time += 1.0f / 60;
	}
#endif
    cursor_prev_x = cursor_x;
    cursor_prev_y = cursor_y;
    mouse_prev_x = mouse_x;
    mouse_prev_y = mouse_y;
}

int main(void)
{
    Image back_buffer = {
        .width = 960,
        .height = 540,
    };
    int window_width = back_buffer.width;
    int window_height = back_buffer.height;

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("texor", 0, 1500,
                                          window_width, window_height, SDL_WINDOW_SHOWN);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC);
    SDL_SetWindowMinimumSize(window, window_width, window_height);
    //TODO: should these takes window or back_buffer width/height
    SDL_RenderSetLogicalSize(renderer, window_width, window_height);
    SDL_RenderSetIntegerScale(renderer, 1);
    SDL_Texture *screen_texture = SDL_CreateTexture(renderer,
                                                    SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING,
                                                    back_buffer.width, back_buffer.height);
    back_buffer.pixels = malloc(back_buffer.width * back_buffer.height * sizeof(uint32_t));
	assert(back_buffer.pixels);
	assert(window && renderer && screen_texture);

    printf("%f %f\n", CHAR_WIDTH, CHAR_HEIGHT);

    unsigned int t1 = SDL_GetTicks();
    while (1)
    {
		int enter = 0, backspace = 0;
		String input_text = {};
        SDL_Event ev;
		memset(is_pressed, 0, sizeof(is_pressed));
        mouse_scroll_y = 0;
        while (SDL_PollEvent(&ev))
        {
            if (ev.type == SDL_QUIT)
            {
                return 0;
            }
			else if (ev.type == SDL_TEXTINPUT)
			{
                input_text = cstr_to_string(ev.text.text, strlen(ev.text.text));
			}
			else if (ev.type == SDL_KEYDOWN || ev.type == SDL_KEYUP)
			{
				int is_down = (ev.type == SDL_KEYDOWN);

				SDL_Keycode code = ev.key.keysym.sym;
                if (code == SDLK_LCTRL)
                    is_control_key_pressed = is_down;

			    if (code == SDLK_ESCAPE)
					return 0;
                //TODO: change this into GetKeyboardState?
				is_pressed[ev.key.keysym.scancode] = is_down;

			}
            else if (ev.type == SDL_MOUSEBUTTONDOWN || ev.type == SDL_MOUSEBUTTONUP)
            {
                if (ev.button.button == SDL_BUTTON_LEFT)
                    is_mouse_left_button_pressed = (ev.type == SDL_MOUSEBUTTONDOWN);
            }
            else if (ev.type == SDL_MOUSEWHEEL)
            {
                static int last = 0;
                mouse_scroll_y = ev.wheel.y;
            }

        }
        SDL_GetMouseState(&mouse_x, &mouse_y);
        t1 = SDL_GetTicks();
		update_and_render_the_editor(&back_buffer, input_text);
        //printf("%d\n", SDL_GetTicks() - t1);
		free(input_text.data);
        SDL_RenderClear(renderer);
        SDL_UpdateTexture(screen_texture, NULL, back_buffer.pixels, window_width * 4);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);

    }
    return 0;
}
