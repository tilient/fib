import std.stdio;
import std.range;
import std.functional;
import std.datetime.stopwatch;

/*
to compile:

gdc -O3 -o fib fib.d
ldc2 -mcpu=native -O -release -strip-debug fib.d
dmd -O -inline -release -noboundscheck fib.d

*/

ulong fibRec(ulong n) {
  return  n < 3 ? 1 : fibRec(n - 1) + fibRec(n - 2);
}

ulong fibRecMem(ulong n) {
  alias mfib = memoize!fibRecMem;
  return  n < 3 ? 1 : mfib(n - 1) + mfib(n - 2);
}

ulong fibStream(ulong n) {
  return recurrence!("a[n-1] + a[n-2]")(1UL, 1UL)
           .drop(n-1).front;
}

ulong fibStatic(ulong n) {
  static immutable N = 300;
  static immutable fibs =
    recurrence!("a[n-1] + a[n-2]")(1UL, 1UL).take(N).array();
  return (n < N) ? fibs[n-1] : 0;
}

ulong fibLoop(ulong n) {
  ulong a = 1;
  ulong b = 1;
  foreach(_; 2 .. n) {
     ulong aa = a;
     a = b;
     b = b + aa;
  }
  return b;
}

alias fibLoopMem = memoize!fibLoop;

void test(string title, ulong function(ulong n) f ) {
  writefln("--- %s ---", title);
  StopWatch sw;
  sw.start();
  foreach(n; 88 .. 91)
    writefln("fib(%s) = %s", n, f(n));
  sw.stop();
  writefln("--- took: %s ms. ", sw.peek.total!"msecs" );
}

int main() {
  test("loop", &fibLoop);
  test("memoized loop", &fibLoopMem);
  test("recurrence stream", &fibStream);
  test("static", &fibStatic);
  test("memoized recursive", &fibRecMem);
  //test("recursive", &fibRec);
  return 0;
}
