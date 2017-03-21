(module-name par)
(module-compile-options main: #t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-syntax time
  (syntax-rules ()
    ((time exp)
     (let ((start-time (current-second))
           (value      exp))
       (format #t "time: ~6,3F seconds~%"
               (- (current-second) start-time))
       value))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-alias FT java.util.concurrent.RecursiveTask)

(define-simple-class Runner (FT)
  (proc type: procedure)
  (args type: list)
  ((compute) (apply proc args)))

(define-syntax spawn
  (syntax-rules ()
    ((spawn proc args ...)
     ((Runner proc: proc args: (list args ...)):fork))))

(define (join job :: FT)
  (job:join))

(define (join-all jobs)
  (map join jobs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fib n :: int) :: int
  (cond
    ((< n  3) 1)
    ((< n 36) (+ (fib (- n 1)) (fib (- n 2))))
    (else     (let ((a :: FT[int] (spawn fib (- n 1)))
                    (b :: int     (fib (- n 2))))
                (+ (a:join) b)))))

(define (fibber n :: int) :: void
  (format #t "fib(~A) = ~A~%" n (fib n)))

(define (test02)
  (join-all (map (lambda(n :: int) (spawn fibber n))
                 [44 <=: 46])))

(time (test02))
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
