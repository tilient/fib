(declaim (optimize (speed 3) (safety 0) (space 0) (debug 0)))

(declaim (ftype (function (fixnum) fixnum) fib))

(defun fib (n)
  (declare (fixnum n))
  (the fixnum
    (if (< n 3)
      1
      (+ (fib (1- n )) (fib (- n 2))))))

(print (fib 44))
(print (fib 45))
(print (fib 46))
(quit)
