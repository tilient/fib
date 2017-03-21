import threadpool
{.experimental.}

# compile with:
#   nim c --threads:on -d:release pfib.nim

proc fib(n: int): int {.noinit.} =
  if n < 3:
    1
  else:
    fib(n-1) + fib(n-2)

proc echofib(n :int) =
  echo "fib(", n, ") = ", fib(n)

parallel:
  for i in 44 .. 46:
    spawn echofib(i)

