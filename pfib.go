package main

import (
	"fmt"
	"sync"
)

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
	for n := 44; n <= 48; n++ {
		wg.Add(1)
		go func(n int) {
			fmt.Printf("%d : %d\n", n, fib(n))
			wg.Done()
		}(n)
	}
	wg.Wait()
}
