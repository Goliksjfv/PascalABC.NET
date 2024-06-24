Uses Crt;
Const n=10;
Var i,j:integer;
a:array[1..n,1..n] of integer;
Begin
for i:=1 to n do
for j:=1 to n do   
if i=j then a[i,j]:=1
else a[i,j]:=0;
for i:=1 to n do
for j:=1 to n do
   begin
     GoToXY(4*j,i+3);
     writeln(a[i,j]);
   end;
End.
