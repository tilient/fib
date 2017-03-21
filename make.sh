chicken fib_and_c04.scm -explicit-use -uses library -optimize-level 5
CHICKEN_FILES="chicken/runtime.c chicken/library.c chicken/build-version.c"
gcc -static -I./chicken fib_and_c04.c $CHICKEN_FILES -O3 -fno-strict-aliasing -fomit-frame-pointer -lm -o fib_and_c
strip fib_and_c
rm fib_and_c04.c

