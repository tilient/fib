with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure fib is

 function fib(n: Positive) return Positive is
 begin
  if n < 3 then
    return 1;
  else
    return fib(n-1) + fib(n-2);
  end if;
 end fib;

 procedure fibTest(n: Positive) is
 begin
   Put("fib(");
   Put(Item => n, Width => 1);
   Put(") = ");
   Put(Item => fib(n), Width => 1);
   New_Line;
 end fibTest;

begin
  for n in 44 .. 46 loop
    fibTest(n);
  end loop;
end fib;
