#include <math.h>
#include <assert.h>
#include <stdio.h>
#include "SDL/SDL.h"
#define STBI_ONLY_PNG
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#define STB_TRUETYPE_IMPLEMENTATION
#include "stb_truetype.h"

#define array_length(arr) (sizeof(arr) / sizeof(*(arr)))

typedef struct Image {
    int width;
    int height;
    int pitch;
	uint32_t *pixels;
} Image;

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
    img.pitch = w;
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

#include "texor.c"

int main(void)
{
    Image back_buffer = {
        .width = 960,
        .height = 540,
    };
    back_buffer.pitch = back_buffer.width;
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
    back_buffer.pixels = calloc(back_buffer.width * back_buffer.height * sizeof(uint32_t), 1);
    assert(back_buffer.pixels);
    assert(window && renderer && screen_texture);

    Input input = {0};

    while (1)
    {
        char input_text[16];
        input_text[0] = 0;
        int is_pressed[512] = {0};//TODO: make this not reset and hadle typing speed?
        input.text = input_text;
        input.mouse_scroll_y = 0;
        SDL_Event ev;
        while (SDL_PollEvent(&ev))
        {
            if (ev.type == SDL_QUIT)
            {
                return 0;
            }
            else if (ev.type == SDL_TEXTINPUT)
            {
                assert(strlen(ev.text.text) == 1); // this seems to always work?
                memcpy(input.text + strlen(input.text), ev.text.text, strlen(ev.text.text) + 1);
            }
            else if (ev.type == SDL_KEYDOWN || ev.type == SDL_KEYUP)
            {
                int is_down = (ev.type == SDL_KEYDOWN);

                SDL_Keycode code = ev.key.keysym.sym;
                if (code == SDLK_TAB && is_down)
                    memcpy(input.text + strlen(input.text), "\t", 2);
                if (code == SDLK_LCTRL)
                    input.is_control_key_pressed = is_down;

               // if (code == SDLK_ESCAPE)
                //    return 0;
                //TODO: change this into GetKeyboardState?
                //TODO: this only give me one keydown in a frame
                int scancode = ev.key.keysym.scancode;
                if (!is_down)
                    is_pressed[scancode] = is_down;
                else if (!input.is_pressed[scancode])
                    is_pressed[scancode] = 1;
            }
            else if (ev.type == SDL_MOUSEBUTTONDOWN || ev.type == SDL_MOUSEBUTTONUP)
            {
                if (ev.button.button == SDL_BUTTON_LEFT)
                    input.is_mouse_left_button_pressed = (ev.type == SDL_MOUSEBUTTONDOWN);
            }
            else if (ev.type == SDL_MOUSEWHEEL)
            {
                input.mouse_scroll_y = ev.wheel.y;
            }
        }
        input.is_pressed = is_pressed;
        SDL_GetMouseState(&input.mouse_x, &input.mouse_y);

        update_and_render_the_editor(&back_buffer, &input);
        //TODO: SDL is leaking memory when sanitizers are enabled?
        SDL_RenderClear(renderer); // TODO: is this necessary?
        SDL_UpdateTexture(screen_texture, NULL, back_buffer.pixels, window_width * 4);
        SDL_RenderCopy(renderer, screen_texture, NULL, NULL);
        SDL_RenderPresent(renderer);
        input.mouse_prev_x = input.mouse_x;
        input.mouse_prev_y = input.mouse_y;

    }
    return 0;
}
