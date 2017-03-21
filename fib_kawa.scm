(module-name fibber)
(module-compile-options main: #t)

; kawa -C fib_kawa.scm
; jar ufe fibber.jar fibber *.class
; time java -jar fibber.jar
;   -Xmx8m -Xms8m -XX:+AggressiveOpts

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

(define (fib n :: int) :: int
  (if (< n 3)
    1
    (+ (fib (- n 2)) (fib (- n 1)))))

(define (fibtest n :: int)
  (format #t "fib(~A) = ~A~%" n (fib n)))

(define (test)
  (map (lambda(n :: int) (fibtest n))
       [44 <=: 46]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(time (test))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
