
local C = terralib.includecstring [[
  #include <stdio.h>
  #include <stdlib.h>
]]

terra fib(n: int): int
  if n < 3 then
    return 1
  else
    return fib(n-1) + fib(n-2)
  end
end

terra main(argc: int, argv: &rawstring): int
  C.printf("%lld\n", fib(44))
  C.printf("%lld\n", fib(45))
  C.printf("%lld\n", fib(46))
end

terralib.saveobj("fibterra", {main = main})
--main(0, nil)

