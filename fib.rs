// use std::thread;

fn fib(n: u64) -> u64
{
  return if n < 3 { 1 } else { fib(n-1) + fib(n-2) }
}

fn main() {
  // thread::spawn(|| { println!("fib(45) = {}", fib(45)); });
  // thread::spawn(|| { println!("fib(44) = {}", fib(44)); });
  println!("fib(44) = {}", fib(44));
  println!("fib(45) = {}", fib(45));
  println!("fib(46) = {}", fib(46));
}

