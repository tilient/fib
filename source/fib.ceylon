Integer fib(Integer n) =>
  if (n < 3) then 1 else fib(n-1) + fib(n-2);

shared void run()
{
  value start = system.milliseconds;
  print(fib(44));
  print(fib(45));
  print(fib(46));
  print("in ``system.milliseconds - start`` ms");
}
