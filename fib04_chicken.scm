(define (fib n)
  (if [fx< n 3]
    1
    (fx+ (fib (fx- n 2)) (fib (fx- n 1)))))

(print (fib 44))
(print (fib 45))
(print (fib 46))

