package main

import (
	"fmt"
	"sync"
)

func fibonacci(n int) int {
	if n < 3 {
		return 1
	} else {
		return fibonacci(n-2) + fibonacci(n-1)
	}
}

func fibtest(n int) {
	fmt.Printf("%d : %d\n", n, fibonacci(n))
}

func fib(n int) int {
	switch {
	case n < 3:
		return 1
	case n < 33:
		return fib(n-2) + fib(n-1)
	default:
		b := make(chan int)
		go func() { b <- fib(n - 2) }()
		a := fib(n - 1)
		return a + <-b
	}
}

func main() {
	var wg sync.WaitGroup
	for n := 44; n <= 46; n++ {
		wg.Add(1)
		go func(n int) {
			fibtest(n)
			wg.Done()
		}(n)
	}
	wg.Wait()
}
