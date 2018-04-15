/*
ldc2 -mcpu=native -O -release fib04b.d
*/

ulong fib(ulong n) {
  return  n < 3 ? 1 : fib(n - 1) + fib(n - 2);
}

auto fibs(ulong[] ns) {
  import std.algorithm.iteration: map;
  return ns.map!(n => [n, fib(n)]);
}

void main() {
  import std.stdio: writefln;
  foreach(t; [44U, 45U, 46U].fibs())
    writefln("fib(%d) = %d", t[0], t[1]);
}
