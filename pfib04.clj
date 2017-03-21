(set! *unchecked-math* true)

(defn fib ^long [^long n]
  (if (< n 2)
    n
    (+ (fib (dec n)) (fib (- n 2)))))

(time
  (let [f1 (future(fib 46))
        f2 (future(fib 45))
        f3 (future(fib 44))]
  (println @f1)
  (println @f2)
  (println @f3)))
(shutdown-agents)
