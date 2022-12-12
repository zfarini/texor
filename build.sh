FLAGS="-O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable libSDL2-2.0.0.dylib"
FILE=$(pwd)/code/main.c
gcc $FLAGS $FILE -o texor
