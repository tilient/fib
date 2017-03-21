/*
 * javac fib.java
 * java fib
 */

public class fib
{
  private static long fib(long n)
  {
    if (n < 3)
      return 1;
    return fib(n-1) + fib(n-2);
  }

  public static void main(String[] args)
  {
    System.out.println(fib(44));
    System.out.println(fib(45));
    System.out.println(fib(46));
  }
}
