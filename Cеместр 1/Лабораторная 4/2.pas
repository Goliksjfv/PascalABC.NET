uses Crt;
const m=3;n=5;
var i,j:integer;
a,b,c:array [1..m,1..n] of real;
Begin
  for i:=1 to m do
    for j:=1 to n do
    begin
      GoToXY(4*j,i+3);
      readln(a[i,j]);
    end;
  for i:=1 to m do
    for j:=1 to n do
    begin
      GoToXY(4*j+22,i+3);
      readln(b[i,j]);
    end;
  for i:=1 to m do
    for j:=1 to n do c[i,j]:=a[i,j]+b[i,j];
  for i:=1 to m do
    for j:=1 to n do
    begin
      GoToXY(4*j+44,i+3);
      writeln(c[i,j]);
       
    end;
end.