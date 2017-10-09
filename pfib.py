from multiprocessing import Process

#@micropython.viper
#def fib(n: int) -> int:
def fib(n):
  if n < 3:
    return 1
  return int(fib(n-2)) + int(fib(n-1))

def fibTest(n):
  print(n, ":", fib(n))

procs = [Process(target=fibTest, args=(n,))
         for n in range(34, 44)]
for p in procs:
  p.start()
for p in procs:
  p.join()
