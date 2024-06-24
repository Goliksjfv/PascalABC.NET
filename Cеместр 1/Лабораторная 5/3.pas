Uses Crt;
Const n=10;
Var i,j,e:integer;
a:array[1..n,1..n] of integer;
Begin
e:=1;
for i:=1 to n do
for j:=1 to n do   
if i=j then 
begin
a[i,j]:=e;
e:=e+1;
end
else a[i,j]:=0;
for i:=1 to n do
for j:=1 to n do
   begin
     GoToXY(4*j,i+3);
     writeln(a[i,j]);
   end;
End.
