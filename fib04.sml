fun fibb 0 = 0 
  | fibb 1 = 1 
  | fibb n = fibb (n-1) + fibb (n-2);

val rec fib = 
     fn 0 => 0 
      | 1 => 1 
      | n => fib (n - 1) + fib (n - 2);

print(Int.toString(fib(46)));
print(Int.toString(fib(46)));
print(Int.toString(fib(46)));

