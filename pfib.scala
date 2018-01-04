import scala.concurrent._
import scala.concurrent.duration._
import ExecutionContext.Implicits.global

object PFibber {

  def fib(n : Long) : Long =
    if (n < 3)
      1
    else if (n < 34)
      fib(n-1) + fib(n-2)
    else {
     val f = Future { fib(n-2) }
     fib(n-1) + Await.result(f, 60.seconds)
    }

  def main(args : Array[String]) {
    val now = System.nanoTime
    for (n <- 44 to 48) {
      println("fib(" + n + ") = " + fib(n))
    }
    val t = (System.nanoTime - now) / 1000000000.0
    println("%f seconds".format(t))
  }
}

