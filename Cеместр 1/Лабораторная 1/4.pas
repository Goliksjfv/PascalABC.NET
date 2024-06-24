Var x,y:real;
n:integer;
begin
  read(x,y);
  if sqr(x)+sqr(y)<=1 then
    if y>=0 then n:=2 else n:=1;
  write(n)
End.