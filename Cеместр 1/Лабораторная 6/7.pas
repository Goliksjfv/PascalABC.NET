uses crt;
const n=10;
var i,m:integer;x:real;
a,b:array [1..n] of real;
Begin
  for i:=1 to n do
  begin
    GoToXY (4*i+5,3);
    readln(a[i]);
  end;
  m:=0;
  for i:=1 to n do 
    if a[i]< 0 then
    begin
     m:=m+1;
     b[m]:=a[i];
    end;
  for i:=1 to n do 
    if a[i]>= 0 then
    begin
     m:=m+1;
      b[m] := a[i]
    end;
   for i:=1 to n do
  begin
    GoToXY(4*i+5,8);
    write(b[i]);
  end;
  GoToXY(9,7);
end.