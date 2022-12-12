FLAGS="-O2 -g -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable -Iinclude -L lib -l SDL2-2.0.0"
FILE=$(pwd)/code/main.c
gcc $FLAGS $FILE -o texor
