use "collections"

actor Fibber

  var _p: (Fibber | Main)
  var _a: U64 = 0

  new create(p: (Fibber | Main), n: U64) =>
    _p = p
    this.calc(n)

  fun sendResult(n: U64) =>
    match _p
    | let p: Main   => p.result(n)
    | let p: Fibber => p.result(n)
    end

  fun fib(n: U64): U64 =>
    if n < 3 then
      1
    else
      fib(n-1) + fib(n-2)
    end

  be calc(n: U64) =>
    if n < 33 then
      sendResult(fib(n))
    else
      Fibber(this, n-1)
      Fibber(this, n-2)
    end

  be result(n: U64) =>
    if _a == 0 then
      _a = n
    else
      sendResult(n + _a)
    end

actor Main

  let _env: Env

  new create(env: Env) =>
    _env = env
    for n in Range[U64](44, 47) do
      Fibber(this, n)
    end

  be result(n: U64) =>
    _env.out.print(n.string())

