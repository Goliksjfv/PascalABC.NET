Var x,y:real;
n:integer;
begin
  read(x,y);
  n:=0;
  if sqr(x)+sqr(y)<=1 then
    if (x>=0) and (y>=0) then n:=1;
    if (x<=0) and (y<=0) then n:=2;
    write(n)
end.