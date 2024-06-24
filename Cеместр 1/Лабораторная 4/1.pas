uses Crt;
Const n=10;
var i:integer;
a,b,c:array [1..n] of real;
Begin
  for i:=1 to n do
  begin
    GoToXY(4*i+5,3);
    readln(a[i]);
  end;
  for i:=1 to n do 
  begin
    GoToXY(4*i+5,4);
    readln(b[i]);
  end;
  for i:=1 to n do c[i]:=a[i]+b[i];
  for i:=1 to n do 
  begin
    GoToXY(4*i+5,5);
    writeln(c[i]:4);
  end;
end.