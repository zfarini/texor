typedef enum Token_Type {
    TOKEN_IDENTIFIER,
    TOKEN_INT = 256,
} Token_Type;

typedef struct Token {
    int type;
    int start_pos;
    int end_pos;
    int int_value;
    char name[64];
} Token;

typedef struct Node Node;

typedef enum Node_Type {
    NODE_INT,
    NODE_BINARY_EXPR,

} Node_Type;

struct Node {
    int type;

    Node *left;
    Node *right;
    Token *token;
};

Image *dbg_print_image;
int dbg_print_min_x;
int dbg_print_curr_x;
int dbg_print_curr_y;
float dbg_print_r = 1, dbg_print_g = 1, dbg_print_b = 1;
float dbg_print_scroll_y = 0;

void print(char *fmt, ...)
{
    char s[4096];
    va_list args;
    va_start(args, fmt);
    vsprintf(s, fmt, args);
    va_end(args);
    for (int i = 0; s[i]; i++)
    {
        if (s[i] == '\n')
        {
            dbg_print_curr_y += font_line_height;
            dbg_print_curr_x = dbg_print_min_x;
        }
        else if (s[i] == '\t')
        {
            for (int j = 0; j < TAB_SIZE; j++)
            {
                draw_char(dbg_print_image, ' ', dbg_print_curr_x, dbg_print_curr_y - dbg_print_scroll_y, 
                        dbg_print_r, dbg_print_g, dbg_print_b);
                dbg_print_curr_x += font_advance_x;
            }
        }
        else
        {
            draw_char(dbg_print_image, s[i], dbg_print_curr_x, dbg_print_curr_y - dbg_print_scroll_y,
                    dbg_print_r, dbg_print_g, dbg_print_b);
            dbg_print_curr_x += font_advance_x;
        }
    }
}

void print_token(Token *token)
{
    char b[2] = {0};
    char *type = b;
    if (token->type == TOKEN_INT)
        type = "int";
    else if (token->type == TOKEN_IDENTIFIER)
        type = "idenfitifer";
    else
        type[0] = token->type;
    print("{type: \"%s\"", type);
    switch (token->type)
    {
        case TOKEN_INT:
        {
            print(", value: %d", token->int_value);
            break;
        }
        case TOKEN_IDENTIFIER:
        {
            print(", name: \"%s\"", token->name);
            break;
        }
    }
    print("}");
}

Token *tokens;
int token_count;
int curr_token_index;


Token *skip_token(int type)
{
    Token *tok = &tokens[curr_token_index];
    assert(tok->type == type);
    curr_token_index++;
    return tok;
}

Node *parse_expression()
{
    Token *l = skip_token(TOKEN_INT);
    Token *op = skip_token('+');
    Token *r = skip_token(TOKEN_INT);

    Node *node = malloc(sizeof(Node));
    node->left = malloc(sizeof(Node));
    node->right = malloc(sizeof(Node));
    node->type = NODE_BINARY_EXPR;
    node->token = op;
    node->left->token = l;
    node->left->type = NODE_INT;
    node->right->type = NODE_INT;
    node->right->token = r;
    return node;
}

/*TODO: inters
 *
 */
void draw_node(Node *node)
{
    print("{type: IDK}");
    draw_node(node->left);
    draw_node(node->rigth);
}

void parse(Image *draw_image, Buffer *buffer, int mouse_scroll)
{
    dbg_print_scroll_y += mouse_scroll;
    static float scroll_dy = 0;
    float ddy = mouse_scroll * 10000 - scroll_dy * 4;
    float dt = 1.0f / 60;
    dbg_print_scroll_y += ddy * 0.5f * dt * dt + dt * scroll_dy;
    scroll_dy += ddy * dt;
    if (dbg_print_scroll_y < 0)
    {
        dbg_print_scroll_y = 0;
        scroll_dy = 0;
    }
    if (dbg_print_curr_y < draw_image->height)
        dbg_print_scroll_y = 0, scroll_dy = 0;
    else if (dbg_print_scroll_y + draw_image->height > dbg_print_curr_y)
    {
        dbg_print_scroll_y = dbg_print_curr_y  - draw_image->height;
        scroll_dy = 0;
    }
    dbg_print_min_x = dbg_print_curr_x = dbg_print_curr_y = 0;
    dbg_print_r = dbg_print_g = dbg_print_b = 1;
    dbg_print_image = draw_image;
    char *s = buffer->data;
    int length = buffer->size - 1;

    tokens = calloc(length * sizeof(Token), 1);
    token_count = 0;
   

    for (int i = 0; i < length; )
    {
        while (isspace(s[i]))
            i++;
        if (i >= length)
            break;
        Token *token = &tokens[token_count];
        token->start_pos = i;
        token_count++;
        if (isdigit(s[i]))
        {
            int j = i, p = 1;
            while (j < length && isdigit(s[j]))
            {
                j++;
                p *= 10; // will overflow
            }
            int value = 0;
            while (i < j)
            {
                p /= 10;
                value += p * (s[i] - '0');
                i++;
            }
            token->int_value = value;
            token->type = TOKEN_INT;
        }
        else if (strchr("+*-/%={}(),;[]?:", s[i]))
        {
            token->type = s[i];
            i++;     
        }
        else if (is_identifier(s[i]))
        {
            token->type = TOKEN_IDENTIFIER;
            int j = i;
            while (j < length && is_identifier(s[j]))
                j++;
            memcpy(token->name, s + i, j - i);
            i = j;
        }
        else
        {
            printf("skipping unknown char (%d, '%c')\n", s[i], s[i]);
            i++;
            token_count--;
        }
        token->end_pos = i;
    }
    print("tokens: [\n");
    for (int i = 0; i < token_count; i++)
    {
        Token *token = &tokens[i];
        print("\t");
        int x = dbg_print_curr_x;
        print_token(token);
        if (buffer->cursor_pos >= token->start_pos && buffer->cursor_pos < token->end_pos)
        {
            draw_rect(draw_image, x , 
                    dbg_print_curr_y - dbg_print_scroll_y, dbg_print_curr_x,
                    (dbg_print_curr_y - dbg_print_scroll_y + font_line_height), 0.5, 0.5, 0, 0.5);
        }
        print("\n");
    }
    print("]\n");
    
    curr_token_index = 0;
    Node *node = parse_expression();
    draw_node(node);
    free(tokens);
}
