import std.stdio;

/*
to compile:

gdc -O3 -o fib04 fib04.d
ldc2 -mcpu=native -O -release -strip-debug fib04.d
dmd -O -inline -release -noboundscheck fib04.d

*/

pure nothrow @safe @nogc
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
