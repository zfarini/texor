#include <SDL2/SDL.h>
#include <assert.h>
#define STBI_ONLY_PNG
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

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
			float tx = (float)(x - min_x) / (max_x - min_x);
			float ty = (float)(y - min_y) / (max_y - min_y);
			//printf("%d %d %d %d %f %f\n", min_x, min_y, max_x, max_y, tx, ty);
			int fx = tx * FONT_CHAR_WIDTH + ((c - 32) % FONT_COLS) * FONT_CHAR_WIDTH;
			int fy = ty * FONT_CHAR_HEIGHT + ((c - 32) / FONT_COLS) * FONT_CHAR_HEIGHT;
			// fx = (x - min_x)
			assert(fx < font.width);
			assert(fy < font.height);
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
		{ // todo: we got a problem with tab (we need like a visual cursor vs actual cursor)
			for (int j = 0; j < 1; j++)
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
int offset_x = 0;
int offset_y = 0;
static char *lines[1024];
int line_count = 1;

//todo: weird behavior when I input the key on the left of 1
void update_and_render_the_editor(image_t *draw_buffer, char *input_text)
{
	if (!font.width)
	{
		font = load_image("font.png");
		lines[0] = calloc(1, 1);
		line_count = 1;
	}
	//clear the screen
	for (int y = 0; y < draw_buffer->height; y++)
	{
		for (int x = 0; x < draw_buffer->width; x++)
			draw_buffer->pixels[y * draw_buffer->width + x] = 0;
	}

	if (is_pressed[SDL_SCANCODE_RETURN])
	{

		char *newline = strdup(lines[cursor_y] + cursor_x);

		printf("newline: %s, old_line: %s\n", newline, lines[cursor_y]);
		//todo: this is just a realloc
		char *oldline = malloc(cursor_x + 1);
		oldline[cursor_x] = 0;
		memcpy(oldline, lines[cursor_y], cursor_x);
		free(lines[cursor_y]);
		lines[cursor_y] = oldline;

	//	lines[cursor_y] = realloc(lines[cursor_y], cursor_x + 1);
		printf("newline: %s, old_line: %s\n", newline, lines[cursor_y]);

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
		printf("HELLO\n");
		char *text = input_text;
		int text_len = strlen(text);
		int curr_line_len = strlen(lines[cursor_y]);
		assert(cursor_x <= curr_line_len && cursor_x >= 0);

		printf("%p %d\n", lines[cursor_y], text_len);
		lines[cursor_y] = realloc(lines[cursor_y], text_len + curr_line_len + 1);
		memmove(lines[cursor_y] + cursor_x + text_len, lines[cursor_y] + cursor_x, curr_line_len - cursor_x);
		for (int i = cursor_x; i < cursor_x + text_len; i++)
		{
			lines[cursor_y][i] = text[i - cursor_x];
		}
		cursor_x += text_len;
		lines[cursor_y][curr_line_len + text_len] = 0;
	}

	printf("%d\n", line_count);

	//draw_char(draw_buffer, 'z', 0, 0, 4);
	//draw_text(draw_buffer, "Hello World, I can draw Into the screen! cool right?\nHell yeah\nEven new lines lol", 100, 300, 3);
	//draw_text(draw_buffer, "Hello World, I can draw Into the screen! cool right?\nHell yeah\nEven new lines lol", 100, 300, 3);
	offset_x = 2 * 2 * FONT_CHAR_WIDTH + 10;


	int y = offset_y;
	static float scroll_y = 0;
	//wait how does this work again? and why here I need + 1 but I don't need it later?
	if ((cursor_y + 1) * FONT_CHAR_HEIGHT * 2 >= draw_buffer->height)
	{
		float new_scroll = (cursor_y + 1) * FONT_CHAR_HEIGHT * 2 - draw_buffer->height;
		if (new_scroll > scroll_y)
			scroll_y = new_scroll;
	}
	if ((cursor_y) * FONT_CHAR_HEIGHT * 2 < scroll_y)
	{
		scroll_y =	(cursor_y) * FONT_CHAR_HEIGHT * 2;
	}
	for (int i = 0; i < line_count; i++)
	{
		char s[3] = {};
		s[0] = s[1] = s[2] = 0;
		if (i < 10)
		{
			s[0] = i + '0';
		}
		else
		{
			s[0] = i / 10 + '0';
			s[1] = i % 10 + '0';
		}
		draw_text(draw_buffer, s, 0, y - scroll_y, 2);
		draw_text(draw_buffer, lines[i], offset_x, y - scroll_y, 2);
		y += 2 * FONT_CHAR_HEIGHT;
	}
	{
			static float time = 0;
		float alpha = (sin(time) + 1) * 0.5f;
		uint32_t r = 0, g = 0, b = 255;
		alpha = 1;
		r *= alpha, g *= alpha, b *= alpha;
		uint32_t c = (r << 24) | (g << 16) | (b << 8);
		int min_x = cursor_x * FONT_CHAR_WIDTH * 2  + offset_x;
		int max_x = min_x + cursor_w;
		int min_y = cursor_y * FONT_CHAR_HEIGHT * 2 + offset_y - scroll_y;
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

}

int main(void)
{
    image_t back_buffer = {
        .width = 960,
        .height = 540,
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
				is_pressed[ev.key.keysym.scancode] = is_down;

			}

        }
		update_and_render_the_editor(&back_buffer, input_text);
		free(input_text);
        SDL_RenderClear(renderer);
        SDL_UpdateTexture(screen_texture, NULL, back_buffer.pixels, window_width * 4);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);

    }
    return 0;
}
