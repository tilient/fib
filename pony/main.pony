use "time"

actor Fibber

  new create(m: Main, n: U64) =>
    this.calc(m, n)

  be calc(m: Main, n: U64) =>
    let st = Time.millis()
    m.result(fib(n), st)

  fun fib(n: U64): U64 =>
    if n < 3 then
      1
    else
      fib(n-1) + fib(n-2)
    end

  be ping() =>
    """
    """

actor Main

  let _env: Env

  new create(env: Env) =>
    _env = env
    this.doFib()
    this.doParFib()

  be doFib() =>
    let st = Time.millis()
    this.result(fib(44), st)
    this.result(fib(45), st)
    this.result(fib(46), st)

  be doParFib() =>
    Fibber(this, 44)
    Fibber(this, 45)
    Fibber(this, 46)

  be result(r: U64, st: U64) =>
    let t = Time.millis() - st
    _env.out.print(r.string() + " - took " + t.string() + " ms.")

  fun fib(n: U64): U64 =>
    if n < 3 then
      1
    else
      fib(n-1) + fib(n-2)
    end
