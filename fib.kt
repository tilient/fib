fun fib(n: Int): Int =
  if (n < 3) 1 else fib(n-1) + fib(n-2);

fun main(args: Array<String> = arrayOf<String>())
{
  (44..46).forEach { println(fib(it)) }
}

