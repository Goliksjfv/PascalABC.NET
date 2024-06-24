uses Crt;
Const n=10;
var i,nom:integer;
var min:real;
a:array [1..n] of real;
Begin
  min:=1000000;
  for i:=1 to n do
  begin
    GoToXY(4*i+5,3);
    readln(a[i]);
    if min>a[i] then 
    begin
      min:=a[i];
      nom:=i;
     end;
  end;
  writeln(min);
  writeln(nom);
end.
  