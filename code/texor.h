#define TAB_SIZE 4

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


typedef enum {
    MODE_NORMAL,
    MODE_INSERT,
    MODE_VISUAL,
    MODE_COMMAND,
} Vim_Mode;

enum {
    LEFT,
    RIGHT,
    UP,
    DOWN
};

struct Buffer { // this will be shared by multiple buffers
    char *data;
    int size; // this includes \0
    char *filename;
    Command undo[4096]; // should this be here or on the buffer?
    Command redo[4096];
    int undo_count;
    int redo_count;
    float scroll_y;
    float scroll_x;
    float scroll_dy;
    int selection_start_pos;
    int selection_end_pos;
    int selection;
    int new_selection;
    int cursor_pos;
    int cursor_prev_pos;
    int min_x;
    int max_x;
    int min_y;
    int max_y;
    int mode;
    int text_mode;
    int switch_to_normal_mode;
    Buffer *text_buffer;
    char in[16];
    Buffer *cmd_buffer;
    int saved;
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


