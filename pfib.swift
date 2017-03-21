// swiftc -Ounchecked -Xcc -fblocks pfib.swift

import Dispatch

func fib(_ n: Int) -> Int
{
  return (n < 3) ? 1 : fib(n-1) + fib(n-2)
}

DispatchQueue.concurrentPerform(iterations: 3) { i in
  print(46-i, fib(46-i)); };
