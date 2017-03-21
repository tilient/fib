(set! *unchecked-math* true)

(defn fib ^long [^long n]
  (if (< n 3)
    1
    (+ (fib (dec n)) (fib (- n 2)))))

(defn fibTest []
  (println (fib 44))
  (println (fib 45))
  (println (fib 46)))

(time (fibTest))
