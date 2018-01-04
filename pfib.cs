// compile: mcs pfib.cs
// run    : mono pfib.exe

using System;
using System.Threading.Tasks;

class Fibber
{
  static int fib(int n)
  {
    return (n < 3) ? 1 : fib(n-2) + fib(n-1);
  }

  static void Main()
  {
    Parallel.For(44, 47, i =>
    {
      Console.WriteLine("fib({0}) = {1}", i, fib(i));
    });
  }
}
