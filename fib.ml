
let rec fib n =
  if n < 3 then 1 else fib (n-2) + fib (n-1)

let testfib n =
  Printf.printf "fib(%d) = %d\n" n (fib n)

let _ =
  testfib(44);
  testfib(45);
  testfib(46)
