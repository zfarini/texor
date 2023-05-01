FLAGS="-O2  -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable libSDL2-2.0.0.dylib"
#FLAGS=$FLAGS" -g3 -fsanitize=address -fsanitize=undefined"
echo $FLAGS
FILE=$(pwd)/code/main.c
gcc $FLAGS $FILE -o texor
