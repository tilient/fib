@micropython.viper
def fib(n: int) -> int:
  if n < 3:
    return 1
  return int(fib(n-2)) + int(fib(n-1))

print(fib(34))
print(fib(35))
print(fib(36))

