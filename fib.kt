fun fib(n: Int): Int =
  if (n < 3) 1 else fib(n-1) + fib(n-2);

fun main(args: Array<String> = arrayOf<String>())
{
  println(fib(44));
  println(fib(45));
  println(fib(46));
}

