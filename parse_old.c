#include "parse.h"

Node *null_node = &(Node){0};
Node nodes[50005];
int node_count;
Token tokens[50005];
int token_count;
Func funcs[10005];
int func_count;
int curr_token;
Scope scopes[1000];
int scope_count;
Scope *curr_scope;

Image *error_image;
Buffer *error_buffer;
Image *parser_image;

int parser_y;
int error_y;

void error_token(Token *token, char *fmt, ...)
{
    if (error_y > error_image->height)
        return ;
    va_list ap;

    va_start(ap, fmt);
    char msg[4096];
    vsprintf(msg, fmt, ap);
    va_end(ap);
    int line, col;
    get_line_and_col_from_pos(error_buffer, token->start_pos, &line, &col);
    char s[4096];
    sprintf(s, "%s:%d:%d: ", error_buffer->filename, line + 1, col + 1);
    int x = 0;
    x += draw_text(error_image, s, x, error_y, 1, 1, 1);

    x += draw_text(error_image, "error: ", x, error_y, 1, 0, 0);
    x += draw_text(error_image, msg, x, error_y, 1, 1, 1);
    error_y += font_line_height;
    x = 0;
    int start = token->start_pos;
    while (start >= 0 && error_buffer->data[start] != '\n')
        start--;
    start++;
    int end = token->end_pos;
    while (end < error_buffer->size && error_buffer->data[end] != '\n')
        end++;
    memcpy(s, error_buffer->data + start, end - start);

    s[end - start] = 0;
    
    draw_text(error_image, s, 0, error_y, 1, 1, 1);
    error_y += font_line_height;
    x = 0;
    for (int i = start; i < token->start_pos; i++)
    {
        if (error_buffer->data[i] == '\t')
            x += font_advance_x * TAB_SIZE;
        else
            x += font_advance_x;
    }
    draw_text(error_image, "^", x, error_y, 0, 1, 0);
    error_y += font_line_height;
}

int draw_token(Image *draw_image, Token *token, int min_x, int min_y)
{
    char s[4096];
    switch (token->type)
    {
        case TOKEN_INT:
        {
            sprintf(s, "int, value: %d", token->value);
            break;
        }
        case TOKEN_IDENTIFIER:
        {
            sprintf(s, "identifier, name: %s", token->name);
            break;
        }
        case 0:
        {
            sprintf(s, "EOF");
            break;
        }
        default:
        {
            sprintf(s, "'%c'", token->type);
            break;
        }
    }
    char buf[4096];
    sprintf(buf, "{type: %s}", s);
    draw_text(draw_image, buf, min_x, min_y, 1, 1, 1);
    return font_line_height;
}

void skip_token(int type)
{
    if (tokens[curr_token].type != type)
        error_token(&tokens[curr_token], "expected '%c'", type);
    else
        curr_token++;
}

Node *make_node(int type)
{
    assert(node_count < array_length(nodes));
    Node *node = &nodes[node_count];
    memset(node, 0, sizeof(*node));
    node_count++;
    node->type = type;
    return node;
}

Scope *make_scope(Scope *parent)
{
    assert(scope_count < array_length(scopes));
    Scope *scope = &scopes[scope_count];
    memset(scope, 0, sizeof(*scope));
    scope->parent = parent;
    scope_count++;
    return scope;
}

Var *make_var(Scope *scope, char *name)
{
    assert(scope->var_count < array_length(scope->vars));
    Var *var = &scope->vars[scope->var_count];
    memset(var, 0, sizeof(*var));
    scope->var_count++;
    var->name = name;
    return var;
}

Func *make_func(char *name)
{
    assert(func_count < array_length(funcs));
    Func *func = &funcs[func_count];
    memset(func, 0, sizeof(*func));
    func_count++;
    func->name = name;
    return func;
}

Var *find_var(Scope *scope, char *name)
{
    if (!scope)
        return 0;
    for (int i = 0; i < scope->var_count; i++)
    {
        if (!strcmp(scope->vars[i].name, name))
        return (&scope->vars[i]);
    }
    return find_var(scope->parent, name);
}

Func *find_func(char *name)
{
    for (int i = 0; i < func_count; i++)
    {
        if (!strcmp(funcs[i].name, name))
            return (&funcs[i]);
    }
    return 0;
}

Node *parse_expr();
Node *parse_assign();
Node *parse_add();
Node *parse_mul();
Node *parse_unary();
Node *parse_lit();

Node *parse_func_decl()
{
    Node *node = make_node(NODE_FUNC_DECL);
    assert(tokens[curr_token].type == TOKEN_IDENTIFIER && 
           tokens[curr_token + 1].type == ':');
    node->token = &tokens[curr_token];
    curr_token++;
    skip_token(':');
    skip_token('(');

    Func *func = make_func(node->token->name);
    func->decl = node;
    node->func = func;
    func->scope = make_scope(curr_scope);
    curr_scope = func->scope;
    while (tokens[curr_token].type && tokens[curr_token].type != ')')
    {
        if (func->arg_count)
            skip_token(',');
        if (tokens[curr_token].type != TOKEN_IDENTIFIER)
        {
            error_token(&tokens[curr_token], "expected an identifier");
            break;
        } 
        assert(func->arg_count < array_length(func->args));
        
        Var *var = find_var(curr_scope, tokens[curr_token].name);
        if (var)
            error_token(&tokens[curr_token], "redeclaration in the same scope of variable '%s'\n", var->name);
        else
            var = make_var(curr_scope, tokens[curr_token].name);
        func->args[func->arg_count++] = var;        
        curr_token++;
    }
    skip_token(')');
    skip_token('{');

    node->body = make_node(NODE_BLOCK);
    Node *curr = node->body;
    while (tokens[curr_token].type != '}' && tokens[curr_token].type)
    {
#if 0
        if (tokens[curr_token].type == TOKEN_WHILE)
        {
            Node *loop = make_node(NODE_WHILE);
            loop->token = &tokens[curr_token];
            curr_token++;
            loop->condition = parse_expr();
            loop->body = parse_block();
        }
#endif
        curr->next = parse_expr();
        curr = curr->next;
    }
    curr->next = 0;
    skip_token('}');
    curr_scope = curr_scope->parent;
    return node;
}

Node *parse_expr()
{
    return parse_assign();
}

Node *parse_assign()
{
    // a = a = 3
    if (tokens[curr_token].type == TOKEN_IDENTIFIER && tokens[curr_token + 1].type == '=')
    {
        Node *node = make_node(NODE_VAR_ASSIGN); 

        node->left = make_node(NODE_VAR);
        node->left->token = &tokens[curr_token];
        curr_token++;

        node->token = &tokens[curr_token];
        curr_token++;
        node->right = parse_assign(); // evaluate right to left
        Var *var = find_var(curr_scope, node->left->token->name);
        if (!var)
            var = make_var(curr_scope, node->left->token->name);
        node->left->var = var;
        return node;
    }
    return parse_add();
}

Node *parse_add()
{
    Node *left = parse_mul();
    while (tokens[curr_token].type == '+' || tokens[curr_token].type == '-')
    {
        Node *node = make_node(NODE_BINARY_EXPR);
        node->left = left;
        node->token = &tokens[curr_token];
        curr_token++;
        node->right = parse_mul();
        left = node;
    }
    return left;
}

Node *parse_mul()
{
    Node *left = parse_unary();
    while (tokens[curr_token].type == '*' || tokens[curr_token].type == '/' || 
            tokens[curr_token].type == '%')
    {
        Node *node = make_node(NODE_BINARY_EXPR);
        node->left = left;
        node->token = &tokens[curr_token];
        curr_token++;
        node->right = parse_unary();
        left = node;
    }
    return left;
}

Node *parse_unary()
{
    if (tokens[curr_token].type == '+' || tokens[curr_token].type == '-')
    {
        if (tokens[curr_token].type == '-')
        {
            Node *node = make_node(NODE_NEG);
            node->token = &tokens[curr_token];
            curr_token++;
            node->left = parse_unary();
            return node;
        }
        else
        {
            curr_token++; // skip
            return parse_unary();
        }
    }
    else
        return parse_lit();
}

Node *parse_lit()
{
    Node *node = 0;
    if (tokens[curr_token].type == '(')
    {
        curr_token++;
        node = parse_expr();
        skip_token(')');
    }
    else if (tokens[curr_token].type == TOKEN_INT)
    {
        node = make_node(NODE_INT);
        node->token = &tokens[curr_token];
        curr_token++;
    }
    else if (tokens[curr_token].type == TOKEN_IDENTIFIER && tokens[curr_token + 1].type == '(')
    {
        node = make_node(NODE_FUNC_CALL);
        node->token = &tokens[curr_token];
        curr_token += 2; 
        Func *f = find_func(node->token->name);
        if (!f)
            error_token(node->token, "undeclared function '%s'", node->token->name);
        node->func = f;
        
        node->args = make_node(NODE_ARGS);
        Node *curr = node->args;
        while (tokens[curr_token].type && tokens[curr_token].type != ')')
        {
            if (curr != node->args)
                skip_token(',');
            curr->next = parse_expr();
            curr = curr->next;
        }
        curr->next = 0;
        skip_token(')'); 
    }
    else if (tokens[curr_token].type == TOKEN_IDENTIFIER)
    {
        node = make_node(NODE_VAR);
        node->token = &tokens[curr_token];
        node->var = find_var(curr_scope, node->token->name);
        if (!node->var)
        {
            error_token(node->token, "undeclared variable '%s'", node->token->name);
        }
        curr_token++;
    }
    else
    {
        error_token(&tokens[curr_token], "expected expression");
        node = null_node;
        if (curr_token + 1 < token_count)
            curr_token++;
    }
    return node;
}

int evaluate_expr(Node *node)
{
    switch (node->type)
    {
        case 0:
        {
            return 0;
        }
        case NODE_VAR:
        {
            if (node->var)
                return node->var->value;
            return 0;
        }
        case NODE_NEG:
        {
            return -evaluate_expr(node->left);
        }
        case NODE_INT:
        {
            return node->token->value;
        }
        case NODE_VAR_ASSIGN:
        {
            Var *var = node->left->var;
            if (!var)
                return 0;
            var->value = evaluate_expr(node->right);
            return var->value;
        }
        case NODE_BINARY_EXPR:
        {
            int op = node->token->type;
            int left = evaluate_expr(node->left);
            int right = evaluate_expr(node->right);
            if (op == '+')
                return left + right;
            else if (op == '-')
                return left - right;
            else if (op == '*')
                return left * right;
            else if (op == '/')
            {
                if (!right)
                    right = 1;
                return left / right;
            }
            error_token(node->token, "unknown binary op");
            return (0);
        }
        case NODE_FUNC_CALL:
        {
            Func *func = node->func;
            if (!func)
                return (0);
            if (!strcmp(func->name, "print"))
            {
                Node *arg = node->args->next;
                if (arg)
                {
                    char s[256];
                    sprintf(s, "%d", evaluate_expr(arg));
                    draw_text(parser_image, s, 0, parser_y, 1, 1, 1);
                    parser_y += font_line_height;
                }
                return 0;
            }
            // assign arguments to stuff
            Node *arg = node->args->next;
            for (int i = 0; i < func->arg_count && arg; i++)
            {
                func->args[i]->value = evaluate_expr(arg);
                arg = arg->next;
            }
            assert(func->decl->body);
            Node *node = func->decl->body->next;
            int v = 0;
            Scope *prev = curr_scope;
            curr_scope = func->scope;
            while (node)
            {
                v = evaluate_expr(node);
                node = node->next;
            }
            curr_scope = prev;
            return v;
        }
        default:
        {
            assert(0);
        }
    }
    return (0);
}

void parse(Image *draw_image, Buffer *buffer, int mouse_scroll)
{

    error_y = 0;
    error_buffer = buffer;
    parser_image = draw_image;
    parser_y = 0;
    Image err; 
    error_image = &err;
    *error_image = *draw_image;
    int h = draw_image->height / 2 - 5;
    draw_image->height = h;
    error_image->height = h;
    error_image->pixels = draw_image->pixels + (h + 5) * draw_image->pitch; 
    
    draw_rect(error_image, 0, 0, error_image->width + 10, error_image->height + 10, 0.2, 0.2, 0.2, 1);

    node_count = token_count = func_count = scope_count = 0;
  
    curr_scope = make_scope(0);
    
    make_func("print");

    int len = buffer->size - 1;
    for (int i = 0; i < len; )
    {
        while (i < len && isspace(buffer->data[i]))
            i++;
        if (i == len)
            break;
        Token *token = &tokens[token_count];
        token->start_pos = i;
        if (isdigit(buffer->data[i]))
        {
            int j = i;
            int val = 0;
            while (j < len && isdigit(buffer->data[j]))
            {
                val = val * 10 + (buffer->data[j] - '0');
                j++;
            }
            token->value = val;
#if 0
            if (j < len && buffer->data[j] == '.')
            {
                j++;
                int x = 1;
                int real = 0;
                while (j < len && isdigit(buffer->data[j]))
                {
                    real = real * 10 + (buffer->data[j] - '0');
                    j++;
                    x *= 10;
                }
                printf("%d %d\n", real, x);
                token->value += (float)real / x;
            }
#endif
            token->type = TOKEN_INT;
            i = j;
        }
        else if (isalpha(buffer->data[i]))
        {
            int j = i;
            while (j < len && isalnum(buffer->data[j]))
                j++;
            token->type = TOKEN_IDENTIFIER;
            assert(j - i + 1 < (int)array_length(token->name));
            memcpy(token->name, buffer->data + i, j - i);
            token->name[j - i] = 0;
            if (!strcmp(token->name, "while"))
                token->type = TOKEN_WHILE;
            i = j;
        }
        else if (strchr("+-*/%()=;,[]:{}", buffer->data[i]))
        {
            token->type = buffer->data[i];
            i++;
        }
        else
        {
            token->end_pos = i + 1;
            error_token(token, "unknown token");
            //printf("unknown token '%c'(%d)\n", buffer->data[i], buffer->data[i]);
            i++;
        }
        token->end_pos = i;
        token_count++;
    }
    tokens[token_count].type = 0;
    tokens[token_count].start_pos = len;
    tokens[token_count].end_pos = len + 1;
    token_count++;

    static float scroll;
    static float dscroll;

    float dt = 1.0f / 60;
    float ddy = mouse_scroll * 10000 - dscroll * 4;
    scroll += ddy * 0.5f * dt * dt + dt * dscroll;
    dscroll += ddy * dt;

    if (scroll < 0)
        scroll = 0;
    parser_y = -scroll;
    //crash when variable name is too long
#if 1
    for (int i = 0; i < token_count; i++)
    {
        Token *token = &tokens[i];
        char s[16];
        sprintf(s, "%d: ", i);
        draw_text(draw_image, s, 0, parser_y, 1, 1, 1);
        int dy = draw_token(draw_image, token, font_advance_x * strlen(s) + 2, parser_y);
        if (buffer->cursor_pos >= token->start_pos && buffer->cursor_pos < token->end_pos)
            draw_rect(draw_image, 0, parser_y, draw_image->width, parser_y + dy, 0.7, 0.7, 0.7, 0.3);
        parser_y += dy;
        if (parser_y > draw_image->height)
            break;
    }
#endif
    curr_token = 0;
    while (curr_token < token_count - 1)
    {
        char s[512];
        s[0] = 0;
        if (tokens[curr_token].type == TOKEN_IDENTIFIER &&
            tokens[curr_token + 1].type == ':')
        {
            Node *node = parse_func_decl();
            char s2[512] = {0};
            for (int i = 0; i < node->func->arg_count; i++)
            {
                char s3[16] = {0};
                sprintf(s3, "%s", node->func->args[i]->name);
                if (i + 1 < node->func->arg_count)
                {
                    s3[strlen(s3)] = ',';
                    s3[strlen(s3)] = ' ';
                }
                memcpy(s2 + strlen(s2), s3, strlen(s3) + 1);
            }
            sprintf(s, "declared function '%s(%s)'", node->token->name, s2);
        }
        else
        {
            Node *node = parse_expr();
            evaluate_expr(node);
#if 0
            int v = evaluate_expr(node);
            if (node->type == NODE_VAR_ASSIGN && node->left->var)
                sprintf(s, "%s = %d", node->left->var->name, v); 
            else
                sprintf(s, "%d", v);
#endif
            continue;
        }
        draw_text(draw_image, s, 0, parser_y, 1, 1, 1);
        parser_y += font_line_height;
    }
    //printf("%d %d %d %d\n", buffer->size, token_count, node_count, var_count);
}
