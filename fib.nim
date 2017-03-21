#[##############################################

nim c -d:release fib.nim
time ./fib

##############################################]#

proc fib(n: int): int {.noinit.} =
  if n < 3 : 1
  else     : fib(n-1) + fib(n-2)

for n in 44 .. 46:
  echo "fib(", n, ") = ", fib(n)

