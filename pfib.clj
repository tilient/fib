(set! *unchecked-math* true)

(defn fib ^long [^long n]
  (cond
    (< n 3)  1
    (< n 36) (+ (fib (dec n)) (fib (- n 2)))
    :else    (let [b (future (fib (- n 2)))
                   a (fib (dec n))]
               (+ a @b))))

(defn fibtest [^long n]
  (println n " : " (fib n)))

(time
  (doseq [n (range 36 47)] (fibtest n)))
(shutdown-agents)
