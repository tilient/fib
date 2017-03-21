#include <stdio.h>

int fib(int x)
{
  return (x < 3 ? 1 : fib(x-1)+fib(x-2));
}

int main()
{
  printf("%d\n", fib(44));
  printf("%d\n", fib(45));
  printf("%d\n", fib(46));
}
