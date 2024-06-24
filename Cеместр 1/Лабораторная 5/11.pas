Uses Crt;
Const n=10;k=1;
var a:array[1..n,1..n] of integer;
i,j:integer;
Begin
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=0; 
  for i:=1+k to n do
    a[i-k,i]:=1;
  for i:=1 to n do
    for j:=1 to n do
    begin
      GotoXY(10+2*j,3+i); write(a[i,j])
    end;
  GoToXY(20,5+n)
End.