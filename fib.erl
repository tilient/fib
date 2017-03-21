-module(fib).
-export([start/0]).

fib(0) -> 1;
fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N - 2) + fib(N - 1).

start() ->
  io:fwrite("~p~n~p~n~p~n", [fib(44), fib(45), fib(46)]).
