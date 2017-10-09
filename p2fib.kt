import kotlinx.coroutines.experimental.*

// to  build
//   kotlinc -cp kotlinx-coroutines-core.jar \
//     p2fib.kt -include-runtime -d tmp.jar
//   zipmerge kotlinp2fib.jar \
//     kotlinx-coroutines-core.jar tmp.jar
//   rm tmp.jar
// to run
//   time java -jar kotlinp2fib.jar

fun fib(n: Int): Int =
  if (n < 3) 1 else fib(n-1) + fib(n-2);

fun test(n: Int) {
  println("fib($n) = ${fib(n)}")
}

fun main(args: Array<String>) = runBlocking<Unit> {
  (44..46).map { launch { test(it) } }
          .forEach { it.join() }
}

