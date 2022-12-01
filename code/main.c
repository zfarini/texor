#include <SDL2/SDL.h>
#include <assert.h>
#define STBI_ONLY_PNG
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#include <stdio.h>

typedef struct {
	int width;
	int height;
	uint32_t *pixels;
} image_t;

float lerp(float a, float t, float b)
{
	return a + t * (b - a);
}

image_t load_image(char *filename)
{
    int w, h, n;
    unsigned char *pixels = stbi_load(filename, &w, &h, &n, 4);
    if (!pixels)
    {
        printf("failed to load %s\n", filename);
        assert(0);
    }
    assert(n == 3 || n == 4);
    image_t img;
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

static image_t font;

#define FONT_WIDTH 128
#define FONT_HEIGHT 64
#define FONT_COLS 18
#define FONT_ROWS 7
#define FONT_CHAR_WIDTH (FONT_WIDTH / FONT_COLS)
#define FONT_CHAR_HEIGHT (FONT_HEIGHT / FONT_ROWS)

void draw_char(image_t *draw_buffer, char c, int min_x, int min_y, float scale)
{
	int max_x = min_x + scale * FONT_CHAR_WIDTH;
	int max_y = min_y + scale * FONT_CHAR_HEIGHT;

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
			float tx = (float)(x - min_x) / (max_x - min_x);
			float ty = (float)(y - min_y) / (max_y - min_y);
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

void draw_text(image_t *draw_buffer, char *s, int min_x, int min_y, float scale)
{
	float x = min_x;
	float y = min_y;
	for (int i = 0; s[i]; i++)
	{
		if (s[i] == '\n') continue;
		if (s[i] == '\t')
		{
			for (int j = 0; j < 4; j++)
			{
				draw_char(draw_buffer, ' ', x, y, scale);
				x += FONT_CHAR_WIDTH * scale;
			}
			continue;
		}
		draw_char(draw_buffer, s[i], x, y, scale);
		x += FONT_CHAR_WIDTH * scale;
	}
}

char buffer[4096];
int buffer_length = 0;
int cursor_x = 0;
int cursor_y = 0;
int cursor_w = 4;
int cursor_h = FONT_CHAR_HEIGHT * 2;
static int is_pressed[512];

static char *lines[1024];
static int line_count;
static int mouse_x, mouse_y;

int mouse_scroll_y = 0;

int is_mouse_left_button_pressed = 0;
//todo: weird behavior when I input the key on the left of 1
void update_and_render_the_editor(image_t *draw_buffer, char *input_text)
{
	if (!font.width)
	{
		font = load_image("font.png");
		lines[0] = calloc(1, 1);
        char *file = load_entire_file("code/main.c");
        for (int i = 0; file[i];)
        {
            while (file[i] == '\n')
            {
                lines[line_count++] = calloc(1, 1);
                i++;
            }
            if (!file[i])
                break ;
            int j = i;
            for (; file[j] && file[j] != '\n'; j++)
                ;
            lines[line_count] = malloc(j - i + 1);
            assert(lines[line_count]);
            memcpy(lines[line_count], file + i, j - i);// "ab\n"
            lines[line_count][j - i] = 0;
            line_count++;
            if (!file[j])
                break ;
            i = j + 1;
        }

	}
    //TODO next: mouse support? undo/redo,
	//clear the screen
	for (int y = 0; y < draw_buffer->height; y++)
	{
		for (int x = 0; x < draw_buffer->width; x++)
			draw_buffer->pixels[y * draw_buffer->width + x] = 0;
	}
    
    printf("%d\n", mouse_scroll_y);

	if (is_pressed[SDL_SCANCODE_RETURN])
	{

		char *newline = strdup(lines[cursor_y] + cursor_x);

		//todo: this is just a realloc
		char *oldline = malloc(cursor_x + 1);
		oldline[cursor_x] = 0;
		memcpy(oldline, lines[cursor_y], cursor_x);
		free(lines[cursor_y]);
		lines[cursor_y] = oldline;

	//	lines[cursor_y] = realloc(lines[cursor_y], cursor_x + 1);

		for (int i = line_count; i > cursor_y + 1; i--)
		{
			lines[i] = lines[i - 1];
		}
		cursor_y++;
		lines[cursor_y] = newline;
		cursor_x = 0;
		line_count++;

	}
	if (is_pressed[SDL_SCANCODE_BACKSPACE])
	{
		if (cursor_x)
		{
			memmove(lines[cursor_y] + cursor_x - 1, lines[cursor_y] + cursor_x, strlen(lines[cursor_y]) - cursor_x + 1);
			cursor_x--;
		}
		else if (cursor_y)
		{
			cursor_x = strlen(lines[cursor_y - 1]);
			lines[cursor_y - 1] = realloc(lines[cursor_y - 1], strlen(lines[cursor_y - 1]) + strlen(lines[cursor_y]) + 1);
			memcpy(lines[cursor_y - 1] + strlen(lines[cursor_y - 1]), lines[cursor_y], strlen(lines[cursor_y]) + 1);
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
		if (cursor_x < (int)strlen(lines[cursor_y]))
			cursor_x++;
	}
	if (is_pressed[SDL_SCANCODE_UP])
	{
		if (cursor_y)
			cursor_y--;
		if (cursor_x > (int)strlen(lines[cursor_y]))
			cursor_x = strlen(lines[cursor_y]);
	}
	if (is_pressed[SDL_SCANCODE_DOWN])
	{
		if (cursor_y < line_count - 1)
			cursor_y++;
		if (cursor_x > (int)strlen(lines[cursor_y]))
			cursor_x = strlen(lines[cursor_y]);
	}

	if (is_pressed[SDL_SCANCODE_TAB])
	{
		if (!input_text)
			input_text = "\t";
		else
		{
			int input_len = strlen(input_text);
			char *new_text = calloc(1, input_len + 2);
			memcpy(new_text, input_text, input_len);
			new_text[input_len] = '\t';
		}
	}
	// }
	if (input_text)
	{
		char *text = input_text;
		int text_len = strlen(text);
		int curr_line_len = strlen(lines[cursor_y]);
		assert(cursor_x <= curr_line_len && cursor_x >= 0);

		lines[cursor_y] = realloc(lines[cursor_y], text_len + curr_line_len + 1);
		memmove(lines[cursor_y] + cursor_x + text_len, lines[cursor_y] + cursor_x, curr_line_len - cursor_x);
		for (int i = cursor_x; i < cursor_x + text_len; i++)
		{
			lines[cursor_y][i] = text[i - cursor_x];
		}
		cursor_x += text_len;
		lines[cursor_y][curr_line_len + text_len] = 0;
	}


	//draw_char(draw_buffer, 'z', 0, 0, 4);
	//draw_text(draw_buffer, "Hello World, I can draw Into the screen! cool right?\nHell yeah\nEven new lines lol", 100, 300, 3);
	//draw_text(draw_buffer, "Hello World, I can draw Into the screen! cool right?\nHell yeah\nEven new lines lol", 100, 300, 3);
    static int offset_x = 0;
    static int offset_y = 0;
	offset_x = 3 * 2 * FONT_CHAR_WIDTH + 10;//todo: the 3 is hardcoded in the mouse_cursor_x 

    //move cursor to mouse positino

    //a
    //b -
    //c
    //d
	int y = offset_y;
	static float scroll_y = 0;
    static float scroll_x = 0;
    int cursor_visual_x = cursor_x;
    int cursor_visual_y = cursor_y;
    for (int i = 0; lines[cursor_y][i] && i < cursor_x; i++)
    {
        if (lines[cursor_y][i] == '\t')
            cursor_visual_x += 3;
    }
	if ((cursor_visual_x + 1) * FONT_CHAR_WIDTH * 2 + offset_x >= draw_buffer->width)
	{
		float new_scroll = (cursor_visual_x + 1) * FONT_CHAR_WIDTH * 2 + offset_x - draw_buffer->width;
		if (new_scroll > scroll_x)
			scroll_x = new_scroll;
	}
	if ((cursor_visual_x) * FONT_CHAR_WIDTH * 2 < scroll_x)
	{
		scroll_x =	(cursor_visual_x) * FONT_CHAR_WIDTH * 2;
	}
	if ((cursor_visual_y + 1) * FONT_CHAR_HEIGHT * 2 >= draw_buffer->height)
	{
		float new_scroll = (cursor_visual_y + 1) * FONT_CHAR_HEIGHT * 2 - draw_buffer->height;
		if (new_scroll > scroll_y)
			scroll_y = new_scroll;
	}
	if ((cursor_visual_y) * FONT_CHAR_HEIGHT * 2 < scroll_y)
	{
		scroll_y =	(cursor_visual_y) * FONT_CHAR_HEIGHT * 2;
	}
#if 0 // TODO: for scroll we really need to understand where we are
    static float dx = 0;
    dx += mouse_scroll_y;
    printf("dx = %f\n", dx);
    scroll_y += dx;
#endif
 

	for (int i = 0; i < line_count; i++)
	{
        char *s;
        {
            int x = i;
            int len = (i == 0);
            while (x)
            {
                len++;
                x /= 10;
            }

            s = malloc(10);
            s[len] = 0;
            x = i;
            if (!x)
                s[0] = '0';
            int j = len - 1;
            while (x)
            {
                s[j--] = x % 10 + '0';
                x /= 10;
            }
        }
		draw_text(draw_buffer, lines[i], offset_x - scroll_x, y - scroll_y, 2);
#if 1
        for (int cy = y - scroll_y; cy < y + 2 * FONT_CHAR_HEIGHT && cy <draw_buffer->height; cy++)
        {
            for (int cx = 0; cx < offset_x && cx < draw_buffer->width; cx++)
            {
                if (cy >= 0)
                draw_buffer->pixels[cy * draw_buffer->width + cx] = 0;
            }
        }

		draw_text(draw_buffer, s, 0, y - scroll_y, 2);
#endif
        free(s);
		y += 2 * FONT_CHAR_HEIGHT;
	}
	{
		static float time = 0;
		float alpha = (sin(time * 5) + 1) * 0.5f;
		uint32_t r = 255, g = 0, b = 0;
        alpha = 1;
		r *= alpha, g *= alpha, b *= alpha;
		uint32_t c = (r << 24) | (g << 16) | (b << 8);
		int min_x = cursor_visual_x * FONT_CHAR_WIDTH * 2  + offset_x - scroll_x;
		int max_x = min_x + cursor_w;
		int min_y = cursor_visual_y * FONT_CHAR_HEIGHT * 2 + offset_y - scroll_y;
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
    if (mouse_x >= offset_x && is_mouse_left_button_pressed)
    {
#if 1
        //TODO: we need ceil here because scrool might not be a multiple of CHAR_HEIGHT, think about
        //this more later
        int mouse_cursor_y = (mouse_y) / (FONT_CHAR_HEIGHT * 2) + ceilf(scroll_y / (FONT_CHAR_HEIGHT * 2));
        int mouse_cursor_x = (mouse_x) / (FONT_CHAR_WIDTH * 2) - 3 + ceilf(scroll_x / (FONT_CHAR_WIDTH * 2));
        cursor_x = mouse_cursor_x;
        cursor_y = mouse_cursor_y;
        if (cursor_y >= line_count)
            cursor_y = line_count - 1;


        int c = 0;
        for (int i = 0; lines[cursor_y][i] && c < mouse_cursor_x; i++)
        {
            if (lines[cursor_y][i] == '\t')
            {
                if (c + 4 > mouse_cursor_x)
                {
                    //TODO: think more about how this works
                    cursor_x -= mouse_cursor_x - c;
                    break ;
                }
                c += 4;
                cursor_x -= 3;
            }
            else
                c++;
        }// "       "
        printf("%d %d %d\n", mouse_cursor_x, cursor_x, cursor_y);
        if (cursor_x >= (int)strlen(lines[cursor_y]))
            cursor_x = strlen(lines[cursor_y]);
#endif
#if 0
       {
            static float time = 0;
            uint32_t r = 0, g = 0, b = 255;
            uint32_t c = (r << 24) | (g << 16) | (b << 8);
            int min_x = mouse_cursor_x * FONT_CHAR_WIDTH * 2  + offset_x - scroll_x;
            int max_x = min_x + cursor_w;
            int min_y = mouse_cursor_y * FONT_CHAR_HEIGHT * 2 + offset_y - scroll_y;
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
    }   
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
#if 0 
    for (int y = mouse_y; y < mouse_y + 5; y++)
    {
        for (int x = mouse_x; x < mouse_x + 5; x++)
        {
            draw_buffer->pixels[y * draw_buffer->width + x] = 0xffff0000;
        }
    }
#endif

}

int main(void)
{
    image_t back_buffer = {
        .width = 960,
        .height = 1280,
    };
    int window_width = back_buffer.width;
    int window_height = back_buffer.height;

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("texor", 0, 1500,
            window_width, window_height, SDL_WINDOW_SHOWN);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED|
            SDL_RENDERER_PRESENTVSYNC);
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

    float target_seconds_per_frame = 1.f / 60;
    unsigned int t1 = SDL_GetTicks();

    while (1)
    {
		int enter = 0, backspace = 0;
		char *input_text = 0;
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
				input_text = strdup(ev.text.text);

				printf("input: \"%s\"\n", ev.text.text);
			}
			else if (ev.type == SDL_KEYDOWN || ev.type == SDL_KEYUP)
			{
				int is_down = (ev.type == SDL_KEYDOWN);

				SDL_Keycode code = ev.key.keysym.sym;

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
        printf("%d\n", mouse_scroll_y);
        SDL_GetMouseState(&mouse_x, &mouse_y);
		update_and_render_the_editor(&back_buffer, input_text);
		free(input_text);
        SDL_RenderClear(renderer);
        SDL_UpdateTexture(screen_texture, NULL, back_buffer.pixels, window_width * 4);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);

    }
    return 0;
}
