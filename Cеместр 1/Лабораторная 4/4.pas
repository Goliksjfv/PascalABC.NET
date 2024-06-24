uses Crt;
const m=3;n=5;
var i,j:integer;
var z,s:real;
a,b,c:array [1..m,1..n] of real;
Begin
  for i:=1 to m do
    for j:=1 to n do
    begin
      GoToXY(4*j,i+3);
      readln(a[i,j]);
    end;
    z:=0;
    for i:=1 to m do
    begin
      s:=0;
      for j:=1 to n do
        s:=s+abs(a[i,j]);
        if s>z then z:=s
    end;
    write(s)
End.