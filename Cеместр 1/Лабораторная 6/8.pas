Uses Crt;
Const m=2; n=3;
Var i,j:integer; s:real;
a:array [1..m,1..n] of real;
y:array [1..m] of real;
x:array [1..n] of real;
Begin
  
  for i:=1 to m do
for j:=1 to n do
   begin
     GoToXY(4*j,i+3);
     readln(a[i,j]);
   end;
   
for i:=1 to n do
  begin
    GoToXY(4+22,i+3);
    readln(x[i]);
  end;
  
  for i:=1 to m do
  begin
    s := 0;
  for j:=1 to n do
    s:=s+a[i,j]*x[j];
    y[i]:=s;
  end;
  
  for i:=1 to m do
  begin
    GoToXY(4,i+7);
    writeln(y[i]);
  end;
  GoToXY(9,17);
end.