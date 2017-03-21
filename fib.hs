module Main( main ) where

fib :: Int -> Int
fib x = if x < 3 then 1
        else (fib(x - 1) + fib(x - 2))

main = do
  print("fib(44) = " ++ show (fib 44))
  print("fib(45) = " ++ show (fib 45))
  print("fib(46) = " ++ show (fib 46))
  putStr "\n"
