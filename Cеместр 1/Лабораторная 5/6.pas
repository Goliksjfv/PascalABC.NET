Uses Crt;
Const n=10;
Var a:array[1..n,1..n] of integer;
i,j,m:integer;
Begin
  for i:=1 to n do
    for j:=1 to n do   
      a[i,j]:=0;
  m:=trunc((n+1)/2);
  for i:=1 to m do
    for j:=i to n-i+1 do
      a[i,j]:=1;
  for i:=1 to n do
    for j:=1 to n do
   begin
     GoToXY(10+2*j,3+i);
     writeln(a[i,j]);
   end;
   GoToXY(20,5+n)
end.