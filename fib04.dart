int fib(int n) 
{
   if (n < 2) 
     return n;
   return fib(n - 1) + fib(n - 2);
}

main() 
{
  for (int i = 1; i <= 3; i++) 
  {
    var f = fib(46);
    print("$i = $f");
  }
}
