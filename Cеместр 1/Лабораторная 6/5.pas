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
  k:=10;
  readln(x);
  for i:=2 to k do
    a[i-1]:=a[i];
  a[k]:=x;
  for i:=1 to n do
  begin
    GoToXY(4*i+5,8);
    write(a[i]);
  end;
  GoToXY(9,7);
end.