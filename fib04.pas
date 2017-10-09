program fibber;

function fibonacci(n: integer): longint;
begin
	if (n < 3) then
		fibonacci := 1
	else
		fibonacci := fibonacci(n-2) + fibonacci(n-1);
end;

procedure fibtest(n: integer);
begin
	writeln(n, ' : ', fibonacci(n))
end;

begin
	fibtest(44);
	fibtest(45);
	fibtest(46);
end.
