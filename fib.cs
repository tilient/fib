using System;

class Fibber
{
  static int fib(int n) {
    return (n < 3) ? 1 : fib(n-1) + fib(n-2);
  }

  static void Main() {
    for (int i = 44; i < 47; i++)
      Console.WriteLine("fib({0}) = {1}", i, fib(i));
  }
}
