package main

import (
  "fmt"
)

func fib(n int) int {
  switch {
    case n < 3:
      return 1
    case n < 33:
      return fib(n-2) + fib(n-1)
    default:
      b := make(chan int)
      go func () { b <- fib(n-2) }()
      a := fib(n-1)
      return a + <-b
  }
}

func fibtest(n int) {
  fmt.Printf("%d : %d\n", n, fib(n))
}

func main() {
  for n := 44; n < 46; n++ {
    go fibtest(n)
  }
  fibtest(46)
}
