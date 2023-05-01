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
    if (min_x > draw_image->width || min_y > draw_image->height)
        return ;
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

#include <emmintrin.h>
#include <smmintrin.h>
#include <stdalign.h>



__m128i compute_color(__m128i dest, __m128 src, __m128 color, int shift)
{
	__m128i m_mask = _mm_set1_epi32(0xFF);
	__m128i m_255 = _mm_set1_ps(255);
	__m128i m_inv_255 = _mm_set1_ps(1.0f / 255);
	__m128i m_zero = _mm_set1_ps(0);
	__m128i m_negative_one = _mm_set1_ps(-1);
	__m128i m_one_over_two = _mm_set1_ps(0.5f);
	// Ri = (dest >> 24) & 0xFF
	__m128i Ri = dest;
	Ri = _mm_srli_epi32(Ri, shift);
	Ri = _mm_and_si128(Ri, m_mask);

	__m128 R = _mm_cvtepi32_ps(Ri); // convert to float
	R = _mm_mul_ps(R, m_inv_255); // R /= 255.0f


	// DR = (1 - src) * R + src * FR 
	__m128 DR = m_zero;
	//DR = _mm_xor_ps(DR, DR);
	DR = _mm_add_ps(DR, R);
	DR = _mm_mul_ps(DR, src);
	DR = _mm_mul_ps(DR, m_negative_one);
	DR = _mm_add_ps(DR, R);
	DR = _mm_add_ps(DR, _mm_mul_ps(src, color)); // DR += src * color
	// DR = DR * 255 + 0.5
	DR = _mm_mul_ps(DR, m_255);
	DR = _mm_add_ps(DR, m_one_over_two);

	__m128i res_r = _mm_cvttps_epi32(DR);
	res_r = _mm_slli_epi32(res_r, shift);
	return res_r;
}


//TODO: kerning, antialiasing?
void draw_char(Image *draw_image, int c, int min_x, int min_y, float fr, float fg, float fb)
{
    if (min_y > draw_image->height || min_x > draw_image->width)
        return;
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

	assert((max_x - min_x) % 4 == 0);



    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > draw_image->width) max_x = draw_image->width;
    if (max_y > draw_image->height) max_y = draw_image->height;


	__m128 m_inv_255 = _mm_set1_ps(1.0 / 255);
	__m128 m_fr = _mm_set1_ps(fr);
	__m128 m_fg = _mm_set1_ps(fg);
	__m128 m_fb = _mm_set1_ps(fb);



	
    uint32_t *row = draw_image->pixels + min_y * draw_image->pitch + min_x;

    uint8_t *src_row = &font_bitmaps[c][(min_y - init_min_y)  * font_advance_x + (min_x - init_min_x)];
    for (int y = min_y; y < max_y; y++)
    {
        uint32_t *pixel = row;
        uint8_t *src_pixel = src_row;

        for (int x = min_x; x < max_x; x += 4)
        {
			//_mm_prefetch(src_pixel + 8, 1);
			//_mm_prefetch(pixel + 8, 1);
#if 1
			alignas(16) float src_p[4];
			src_p[0] = src_pixel[0];
			src_p[1] = src_pixel[1];
			src_p[2] = src_pixel[2];
			src_p[3] = src_pixel[3]; // todo better load?

			__m128i dest = _mm_loadu_si128((__m128i *)pixel);
			


			__m128 src = _mm_load_ps(src_p);
			src = _mm_mul_ps(src, m_inv_255);

		

			__m128i res_r = compute_color(dest, src, m_fr, 24);
			__m128i res_g = compute_color(dest, src, m_fg, 16);
			__m128i res_b = compute_color(dest, src, m_fb, 8);



			__m128i res = res_r;
			res = _mm_add_epi32(res, res_g);
			res = _mm_add_epi32(res, res_b);


			//assert(((uintptr_t)pixel & 15) == 0);
			///assert(pixel & 15 == 0);
			// seems like this store have the same throughput as the aligned one
			_mm_storeu_si128((__m128i *)pixel, res); // if the first pointer is aligned to 16 then we can be aligned

#else

			for (int j = 0; j < 4; j++)
			{
				float a = src_pixel[j] / 255.0f;
				float R = ((pixel[j] >> 24) & 0xFF) / 255.0f;
				float G = ((pixel[j] >> 16) & 0xFF) / 255.0f;
				float B = ((pixel[j] >> 8) & 0xFF) / 255.0f;

				R = (1 - a) * R + a * fr;
				G = (1 - a) * G + a * fg;
				B = (1 - a) * B + a * fb;



				//R = a * fr;

				pixel[j] = ((uint32_t)(R * 255 + 0.5f) << 24) | 
						   ((uint32_t)(G * 255 + 0.5f) << 16) |
						   ((uint32_t)(B * 255 + 0.5f) << 8);
				//pixel[j] = ((uint32_t)((((pixel[0] >> 24) / 255.0f) * (1 - a0) + a0 * fr) * 255.0f + 0.5f) << 24);
			}
#endif


#if 0
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
#endif
            
			pixel += 4;
			src_pixel += 4;
        }
        src_row += font_advance_x;
        row += draw_image->pitch;
    }
}

int draw_text(Image *draw_image, char *s, int min_x, int min_y, float fr, float fg, float fb)
{
    if (min_y > draw_image->height || min_x > draw_image->width)
        return 0;
    float x = min_x;
    float y = min_y;
    for (int i = 0; s[i]; i++)
    {
        if (s[i] == '\t')
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
    return (x - min_x);
}
