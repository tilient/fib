
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; to compile:
;;   kawa -C pfib_kawa.scm
;; to run:
;;   kawa pfib_kawa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(module-name pfib_kawa)
(module-compile-options main: #t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-alias FT java.util.concurrent.RecursiveTask)

(define-simple-class Runner (FT)
  (proc type: procedure)
  (args type: list)
  ((compute) (apply proc args)))

(define-syntax spawn
  (syntax-rules ()
    ((spawn proc args ...)
     ((Runner proc: proc args: (list args ...)):fork))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fib n :: int) :: int
  (cond
    ((< n  2) n)
    ((< n 36) (+ (fib (- n 1)) (fib (- n 2))))
    (else     (let ((a :: FT[int] (spawn fib (- n 1)))
                    (b :: int     (fib (- n 2))))
                (+ (a:join) b)))))

(for-each (lambda (r :: int) (display r) (newline))
          (map (lambda(r :: FT[int]) (r:join))
               (map (lambda(n :: int) (spawn fib n))
                    '(44 45 46 48 49 50))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
