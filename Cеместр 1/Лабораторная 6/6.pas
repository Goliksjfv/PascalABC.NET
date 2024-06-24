uses crt;
const n=10;
var i,k:integer;x:real;
a:array [1..n] of real;
Begin
  for i:=1 to n do
  begin
    GoToXY (4*i+5,3);
    readln(a[i]);
  end;
  x:=a[1];
  k:=1;
  for i:=2 to n do 
    if a[i]<x then
    begin
      x:=a[i];
      k:=i;
    end;
  for i:=k downto 2 do
    a[i]:=a[i-1];
    a[1]:=x;
  for i:=1 to n do
  begin
    GoToXY(4*i+5,8);
    write(a[i]);
  end;
  GoToXY(9,7);
end.