package main

import (
	"fmt"
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

func main() {
	fibtest(44)
	fibtest(45)
	fibtest(46)
}
