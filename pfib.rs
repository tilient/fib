use std::thread;

fn fib(n: u64) -> u64 {
  return if n < 3 { 1 } else { fib(n-1) + fib(n-2) }
}

fn fib_test(n: u64) {
  println!("fib({}) = {}", n, fib(n));
}

fn main() {
  thread::spawn(|| { fib_test(44); });
  thread::spawn(|| { fib_test(45); });
  fib_test(46);
}

