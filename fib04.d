import std.stdio;

ulong fib(ulong n)
{
  return  n < 3 ? 1 : fib(n - 1) + fib(n - 2);
}

int main()
{
  writeln(fib(44));
  writeln(fib(45));
  writeln(fib(46));
  return 0;
}
