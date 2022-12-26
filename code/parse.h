#include <string.h>
#include <unistd.h>
#include <ctype.h>



typedef int64_t i64;

typedef struct Node Node;

typedef enum Token_Type {
    TOKEN_EOF,
    TOKEN_INT = 256,
    TOKEN_IDENTIFIER,
    TOKEN_WHILE,
    TOKEN_IF,
    TOKEN_AND, // &&
    TOKEN_OR, // ||
    TOKEN_EQUAL, // ==
    TOKEN_NOT_EQUAL, // !=
    TOKEN_GT_OR_EQUAL, // >=
    TOKEN_LT_OR_EQUAL, // <=
} Token_Type;

typedef struct Token {
    int type;
    int start_pos;
    int end_pos;
    i64 value;
    char name[128];
} Token;

typedef struct Var {
    char *name;
    Token *decl;
    int value;
}Var;

typedef struct Scope Scope;

struct Scope {
    Var vars[256];
    int var_count;
    Scope *parent;
};

typedef struct Func {
    char *name;
    Var *args[16];
    int arg_count;
    Node *decl;
    Scope *scope;
}Func;

typedef enum Node_Type {
    NODE_NONE,
    NODE_INT,
    NODE_VAR,
    NODE_NEG,
    NODE_BINARY_EXPR,
    NODE_VAR_ASSIGN,
    NODE_FUNC_DECL,
    NODE_FUNC_CALL,
    NODE_BLOCK,
    NODE_ARGS,
    NODE_WHILE,
    NODE_IF,
} Node_Type;


struct Node {
    int type;
    Token *token;
    Node *args;
    Node *block_first;
    Node *next_if;
    Node *else_node;
    Node *next;
    Node *body;
    Node *left;
    Node *right;
    Node *condition;
    //Node *ret;
    Var *var;
    Func *func;
    Scope *scope;
};

