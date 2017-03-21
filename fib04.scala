
import scala.math.BigInt

object Fibber
{
  val fibs: Stream[BigInt] =
    0 #:: fibs.scanLeft(BigInt(1))(_ + _)

  def fib2(n: Int): BigInt =
    (fibs drop n).head

  def fib(n: Long): Long =
    if (n < 3) 1 else fib(n-1) + fib(n-2)

  def main(args : Array[String])
  {
    println(fib(44))
    println(fib(45))
    println(fib(46))
  }
}




