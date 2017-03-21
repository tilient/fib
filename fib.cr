def fib(n : Int): Int
  if n < 2
    return n
  else
    return fib(n-1) + fib(n-2)
  end
end

puts fib(46)
puts fib(45)
puts fib(44)
