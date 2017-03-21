
#lang racket

(require racket/unsafe/ops)

(define + unsafe-fx+)
(define - unsafe-fx-)
(define < unsafe-fx<)

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(fib 44)
(fib 45)
(fib 46)

