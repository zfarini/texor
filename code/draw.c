#include <emmintrin.h>
#include <smmintrin.h>
#include <stdalign.h>

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

__m128i compute_color_from_src(__m128i dest, __m128i src, __m128 alpha, int shift)
{
	__m128i m_mask = _mm_set1_epi32(0xFF);
	__m128 m_one_over_255 = _mm_set1_ps(1.0f / 255);
	__m128 m_one_over_two = _mm_set1_ps(0.5f);
	__m128 m_255 = _mm_set1_ps(255);


	// load source
	__m128i SRi = src;
	SRi = _mm_srli_epi32(SRi, shift);
	SRi = _mm_and_si128(SRi, m_mask);
	__m128 SR = _mm_cvtepi32_ps(SRi);
	SR = _mm_mul_ps(SR, m_one_over_255);
	// load dest
	__m128i DRi = dest;
	DRi = _mm_srli_epi32(DRi, shift);
	DRi = _mm_and_si128(DRi, m_mask);
	__m128 DR = _mm_cvtepi32_ps(DRi);
	DR = _mm_mul_ps(DR, m_one_over_255);

	// R = DR + (SR - DR) * SA
	__m128 R;
	R = _mm_sub_ps(SR, DR);
	R = _mm_mul_ps(R, alpha);
	R = _mm_add_ps(R, DR);
	R = _mm_mul_ps(R, m_255);
	R = _mm_add_ps(R, m_one_over_two);

	__m128 Ri = _mm_cvttps_epi32(R);
	Ri = _mm_slli_epi32(Ri, shift);
	return Ri;
}

void draw_img(Image *draw_image, Image *img, int min_x, int min_y, int max_x, int max_y, float a)
{
    if (max_x == min_x || max_y == min_y)
        return ;
    float start_x = min_x;
    float start_y = min_y;
    float xdiv = 1.0f / (max_x - min_x);
    float ydiv = 1.0f / (max_y - min_y);


	__m128 m_start_x = _mm_set1_ps(start_x);
	__m128 m_xdiv = _mm_set1_ps(xdiv);
	__m128 m_img_width = _mm_set1_ps(img->width);
	__m128 m_img_pitch = _mm_set1_ps(img->pitch);
	__m128 m_alpha = _mm_set1_ps(a);

    if (min_x < 0)
        min_x = 0;
    if (min_y < 0)
        min_y = 0;
    if (max_x > draw_image->width)
        max_x = draw_image->width;
    if (max_y > draw_image->height)
        max_y = draw_image->height;
	assert((max_x - min_x) % 4 == 0);
    uint32_t *row = draw_image->pixels + min_y * draw_image->pitch + min_x;
    for (int y = min_y; y < max_y; y++)
    {
        uint32_t *pixel = (uint32_t *)row;
        for (int x = min_x; x < max_x; x += 4)
        {
			alignas(16) uint32_t src_p[4];
#if 1
#if 0
			__m128 src_x = _mm_set_ps(x + 3 , x + 2, x + 1, x + 0); // check order
			src_x = _mm_sub_ps(src_x, m_start_x);
			src_x = _mm_mul_ps(src_x, m_xdiv);
			src_x = _mm_mul_ps(src_x, m_img_width);
			__m128 src_xi = _mm_cvttps_epi32(src_x);


			__m128i src_yi = _mm_set1_epi32((int)((y - start_y) * ydiv * img->height) * img->pitch);
			__m128i m_idx = _mm_add_epi32(src_xi, src_yi);

			alignas(16) uint32_t idx[4];
			_mm_store_si128((__m128i *)idx, m_idx);

			src_p[0] = img->pixels[idx[0]];
			src_p[1] = img->pixels[idx[1]];
			src_p[2] = img->pixels[idx[2]];
			src_p[3] = img->pixels[idx[3]];
#else
			int sy = (int)((y - start_y) * ydiv * img->height) * img->pitch;
			src_p[0] = img->pixels[(int)((x - start_x) * xdiv * img->width) + sy]; 
			src_p[1] = img->pixels[(int)((x + 1 - start_x) * xdiv * img->width) + sy]; 
			src_p[2] = img->pixels[(int)((x + 2 - start_x) * xdiv * img->width) + sy]; 
			src_p[3] = img->pixels[(int)((x + 3 - start_x) * xdiv * img->width) + sy]; 
#endif
			__m128i src = _mm_load_si128((__m128i *)src_p);
			__m128i dest = _mm_loadu_si128((__m128i *)pixel);

	// load source alpha
			__m128 SA = _mm_cvtepi32_ps(_mm_and_si128(src, _mm_set1_epi32(0xFF)));
			SA = _mm_mul_ps(SA, _mm_set1_ps(1.0f / 255));
			SA = _mm_mul_ps(SA, m_alpha);
			// R = R * 255 + 0.5

			__m128i R = compute_color_from_src(dest, src, SA, 24);
			__m128i G = compute_color_from_src(dest, src, SA, 16);
			__m128i B = compute_color_from_src(dest, src, SA, 8);

			__m128i res = R;
			res = _mm_or_si128(res, G);
			res = _mm_or_si128(res, B);

			_mm_storeu_si128((__m128i *)pixel, res);

 //           uint32_t s = img->pixels[src_y * img->pitch + src_x];
#else
			for (int j = 0; j < 4; j++)
			{
            	int src_x = ((float)(x + j - start_x) * xdiv) * img->width;
            	int src_y = ((float)(y - start_y) * ydiv) * img->height;
            	uint32_t s = img->pixels[src_y * img->pitch + src_x];
            	uint32_t d = pixel[j];
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
            	pixel[j] = (r << 24) | (g << 16) | (b << 8);
			}

#endif
            pixel += 4;

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
	//R = _mm_mul_ps(R, m_inv_255); // R /= 255.0f


#if 1
	// DR = (1 - src) * R + src * FR 
	__m128 DR;
	DR = _mm_mul_ps(R, src);
	DR = _mm_mul_ps(DR, m_negative_one);
	DR = _mm_add_ps(DR, R);
	DR = _mm_add_ps(DR, _mm_mul_ps(src, color)); // DR += src * color
	// DR = DR * 255 + 0.5
#else
	__m128 DR = _mm_mul_ps(src, color);
#endif
	//DR = _mm_mul_ps(DR, m_255);
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



    if (min_x < 0) min_x = 0;
    if (min_y < 0) min_y = 0;
    if (max_x > draw_image->width) max_x = draw_image->width;
    if (max_y > draw_image->height) max_y = draw_image->height;


	fr *= 255;
	fg *= 255;
	fb *= 255;
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
#if 1
			alignas(16) float src_p[4] = {0};
			src_p[0] = src_pixel[0];
				src_p[1] = src_pixel[1];
				src_p[2] = src_pixel[2];
				src_p[3] = src_pixel[3]; // todo: better load?

			__m128 src = _mm_load_ps(src_p);
			__m128i dest = _mm_loadu_si128((__m128i *)pixel);
			
			src = _mm_mul_ps(src, m_inv_255);

			__m128i res_r = compute_color(dest, src, m_fr, 24);
			__m128i res_g = compute_color(dest, src, m_fg, 16);
			__m128i res_b = compute_color(dest, src, m_fb, 8);

			__m128i res = res_r;
			res = _mm_or_si128(res, res_g);
			res = _mm_or_si128(res, res_b);

			_mm_storeu_si128((__m128i *)pixel, res);
#else

			for (int j = 0; j < 4; j++)
			{
				float a = src_pixel[j] / 255.0f;
				float R = ((pixel[j] >> 24) & 0xFF);
				float G = ((pixel[j] >> 16) & 0xFF);
				float B = ((pixel[j] >> 8) & 0xFF);

				R = (1 - a) * R + a * fr;
				G = (1 - a) * G + a * fg;
				B = (1 - a) * B + a * fb;



				//R = a * fr;

				pixel[j] = ((uint32_t)(R + 0.5f) << 24) | 
						   ((uint32_t)(G + 0.5f) << 16) |
						   ((uint32_t)(B + 0.5f) << 8);
				//pixel[j] = ((uint32_t)((((pixel[0] >> 24) / 255.0f) * (1 - a0) + a0 * fr) * 255.0f + 0.5f) << 24);
			}
#endif
			pixel += 4;
			src_pixel += 4;
        }
        src_row += font_advance_x;
        row += draw_image->pitch;
    }
}

int _draw_text(Image *draw_image, char *s, int min_x, int min_y, float fr, float fg, float fb)
{
    if (min_y > draw_image->height || min_x > draw_image->width)
        return 0;
    float x = min_x;
    float y = min_y;
    for (int i = 0; s[i] && s[i] != '\n'; i++)
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

typedef struct {
	int id;
	pthread_t thread;
} Thread_Info;

typedef struct {
	Image *draw_image;
	char *s;
	int min_x;
	int min_y;
	float fr, fg, fb;
} Entry;


typedef struct {
	Entry entries[2];
	int	  entry_count;
} Work_Entry;

volatile int entry_curr;
volatile int entry_count;
volatile int entry_completed;
volatile int main_is_waiting;
static Work_Entry entries[64000 / 4];
sem_t *semaphore;

void *thread_proc(void *arg)
{
	Thread_Info *info = arg;

	//sem_wait(semaphore);
	while (1)
	{
		int idx;
		idx = entry_curr;

		int c;
		c = entry_count;
		if (idx < c)
		{
			if (__sync_bool_compare_and_swap(&entry_curr, idx, idx + 1))
			{
				for (int i = 0; i < entries[idx].entry_count; i++)
				{
					Entry *e = &entries[idx].entries[i];
					//printf("thread %d is drawing line: \"%s\"\n", info->id, e->s);
					_draw_text(e->draw_image, e->s, e->min_x, e->min_y, e->fr, e->fg, e->fb);
					e->s = 0;
					e->draw_image = 0;
				}
				entries[idx].entry_count = 0;
				__sync_add_and_fetch(&entry_completed, 1);
			}
		}
		else
		{
			sem_wait(semaphore);
		}

	}
	return 0;
}

#define THREADS 0

void draw_text(Image *draw_image, char *s, int min_x, int min_y, float fr, float fg, float fb)
{
#if THREADS
	Work_Entry *work_entry = &entries[entry_count];
	
	Entry *entry = &work_entry->entries[work_entry->entry_count++];
	entry->draw_image = draw_image;
	entry->s = s;
	entry->min_x = min_x;
	entry->min_y = min_y;
	entry->fr = fr;
	entry->fg = fg;
	entry->fb = fb;
	//printf("%s\n", s);
	int is_main_waiting = __atomic_load_n(&main_is_waiting, __ATOMIC_SEQ_CST);
	if (work_entry->entry_count == array_length(work_entry->entries) || main_is_waiting) {
		__sync_add_and_fetch(&entry_count, 1);
		sem_post(semaphore);
	}
#else
	_draw_text(draw_image, s, min_x, min_y, fr, fb, fb);
#endif
}
