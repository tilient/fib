(declare (standard-bindings)
         (block)
         (not safe)
         (fixnum))

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 2)) (fib (- n 1)))))

(display (fib 46))
(newline)
(display (fib 45))
(newline)
(display (fib 44))
(newline)



