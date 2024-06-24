Uses Crt;
Const n=10;
Var i,j,e:integer;
a:array[1..n,1..n] of integer;
Begin
e:=10;
for i:=1 to n do
for j:=1 to n do   
a[i,j]:=0;
for i:=1 to n do 
begin
a[i,n+1-i]:=e;
e:=e-1;
end;
for i:=1 to n do
for j:=1 to n do
   begin
     GoToXY(4*j,i+3);
     writeln(a[i,j]);
   end;
End.
