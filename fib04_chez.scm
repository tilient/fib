(import (chezscheme))
(eval-when (compile) (optimize-level 3))

(define (fib n)
  (if (fx< n 3)
    1
    (fx+ (fib (fx- n 2)) (fib (fx1- n)))))

(define (fibtest n)
  (display (fib n))
  (newline))

(fibtest 46)
(fibtest 45)
(fibtest 44)
;(exit)

