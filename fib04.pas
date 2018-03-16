program fibber;

function fibonacci(n: longint): longint;
begin
	if (n < 3) then
		fibonacci := 1
	else
		fibonacci := fibonacci(n-1) + fibonacci(n-2);
end;

procedure fibtest(n: longint);
begin
	writeln('fib(', n, ') = ', fibonacci(n))
end;

begin
	fibtest(44);
	fibtest(45);
	fibtest(46);
end.
