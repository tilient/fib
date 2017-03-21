import java.util.stream.*

//-------------------------------------------------//

fun <T> Collection<T>.parallelStream(): Stream<T> =
  @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN",
            "UNCHECKED_CAST")
  (this as java.util.Collection<T>).parallelStream()

fun <T> Iterable<T>.parallelStream(): Stream<T> =
  this.toList().parallelStream()

fun <T> Stream<T>.toList(): List<T> =
  this.collect(Collectors.toList()) as List<T>

//-------------------------------------------------//

fun fib(n: Int): Int =
  if (n < 3) 1 else fib(n-1) + fib(n-2);

fun fibTest(n: Int)
{
  println("fib($n) = ${fib(n)}")
}

fun main(args: Array<String>)
{
  (44 .. 46).parallelStream().forEach { fibTest(it) }
}

//-------------------------------------------------//
