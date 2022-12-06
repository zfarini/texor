FLAGS="-g -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable -Iinclude -L lib -l SDL2-2.0.0"

gcc $FLAGS code/main.c -o texor
