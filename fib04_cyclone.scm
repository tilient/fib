(import (scheme base)
        (scheme write))

(define (fib n)
  (if (< n 3)
    1
    (+ (fib (- n 2)) (fib (- n 1)))))

(write (fib 40))

