//rustc -O -C target-cpu=broadwell pfib.rs

use std::thread;

fn fib(n: u64) -> u64
{
  if n < 3 { 1 } else { fib(n-1) + fib(n-2) }
}

fn fib_test(n: u64)
{
  println!("fib({}) = {}", n, fib(n));
}

fn main()
{
  let mut thrds = Vec::new();
  for x in 44 .. 49
  {
    thrds.push(
      thread::spawn(move || fib_test(x) ));
  }
  for t in thrds
  {
    t.join().unwrap();
  }
}

