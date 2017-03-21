// swiftc -Ounchecked fib.swift

func fib(_ n: Int) -> Int
{
  return (n < 3) ? 1 : fib(n-1) + fib(n-2)
}

print(fib(44))
print(fib(45))
print(fib(46))

