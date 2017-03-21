
proc fib(n:int):int
{
  if n < 3 then
    return 1;
  else
    return fib(n-1) + fib(n-2);
}

begin writeln(fib(44));
begin writeln(fib(45));
writeln(fib(46));

// forall i in 44..46 {
//   writeln(fib(i));
// }
