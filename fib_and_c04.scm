
;;; scheme part ;;;

(define (fib n)
  (if (fx< n 3)
    1
    (fx+ (fib (fx- n 1)) (fib (fx- n 2)))))

(define (pisum)
  (let loop ((k 1) (sum 0.0))
    (if (fx= k 10000)
      sum
      (loop (fx+ 1 k) (fp+ sum (/ 1.0 (fx* k k)))))))

(define (s-test)
  (display "scheme - fib(46) >> ")
  (display (fib 44)) (newline)
  (display (fib 45)) (newline)
  (display (fib 46)) (newline)
; (newline)
; (display "scheme - pisum() >> ")
; (do ((i 1 (fx+ 1 i))) ((fx= i 100000)) (pisum))
; (display (pisum)) 
  (newline))

;;; C part ;;;

(foreign-declare "

  unsigned long cfib (unsigned long n) 
  { 
    return n < 3 ? 1  : cfib(n-1) + cfib(n-2); 
  }; 

  double one_cpisum()
  {
    double       sum = 0.0;
    unsigned int k;
    for (k = 1; k < 10000; ++k) 
      sum += 1.0 / (k*k);
    return sum;
  }
  
  double cpisum()
  {
    double       sum = 0.0;
    unsigned int i;
    for (i = 1; i < 100000; ++i)
      sum = one_cpisum();
    return sum;
  }
")

(define c-fib
  (foreign-lambda unsigned-int cfib unsigned-int))

(define c-pisum
  (foreign-lambda double cpisum))

(define (c-test)
  (display "c - fib(46)   >> ")
  (display (c-fib 44)) (newline)
  (display (c-fib 45)) (newline)
  (display (c-fib 46)) (newline)
; (newline)
; (display "c - pisum()   >> ")
; (display (c-pisum)) 
  (newline))

;;;

(time (c-test))
(time (s-test))

;;;

