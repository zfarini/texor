static int font_line_height;
static int font_advance_x;
static uint8_t *font_bitmaps[256];

float lerp(float a, float t, float b)
{
    return a + t * (b - a);
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

