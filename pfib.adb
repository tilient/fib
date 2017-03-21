with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure pfib is

  function fib(n: Positive) return Positive;

  function pfib(n: Positive) return Positive is

    a : Positive;
    b : Positive;

    task fibber is
      entry fetch;
    end fibber;

    task body fibber is
    begin
      b := fib(n-2);
      accept fetch;
    end fibber;

  begin
    a := fib(n-1);
    fibber.fetch;
    return a + b;
  end pfib;

  function fib(n: Positive) return Positive is
  begin
    if n < 3 then
      return 1;
    elsif n < 45 then
      return fib(n-1) + fib(n-2);
    else
      return pfib(n);
    end if;
  end fib;

  procedure fibTest(n: Positive) is
  begin
    Put("fib(");
    Put(Item => n, Width => 1);
    Put(") = ");
    Put(Item => fib(n), Width => 1);
    Put_Line("");
  end fibTest;

begin
  For_Loop :
    for n in Integer range 44 .. 46 loop
      fibTest(n);
  end loop For_Loop;
end pfib;
