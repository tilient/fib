fib <- function(n)
{
  if ( n < 3 ) 1
  else Recall(n-1) + Recall(n-2)
}

print(fib(44))
print(fib(45))
print(fib(46))
