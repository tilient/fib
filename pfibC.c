#include <stdio.h>

int fib(int x)
{
  return (x < 3 ? 1 : fib(x-1) + fib(x-2));
}

int main()
{
  #pragma omp parallel for
  for (int n = 44; n <= 46; n++)
    printf("fib(%d) = %d\n", n, fib(n));
}
