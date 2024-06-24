Uses Crt;
Const n=10;
var a:array[1..n,1..n] of integer;
i,j:integer;
Begin
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=0; 
  for j:=2 to n do
    a[1,j]:=1;
  for i:=2 to n do
    a[i,n]:=1;
  for j:= n-1 downto 1 do
    a[n,j]:=1;
  for i:= n-1 downto 1 do
    a[i,1]:=1;
  for i:=1 to n do
    for j:=1 to n do
    begin
      GotoXY(10+2*j,3+i); write(a[i,j])
    end;
  GoToXY(20,5+n)
End.