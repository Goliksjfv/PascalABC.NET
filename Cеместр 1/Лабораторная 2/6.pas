Var n,m:integer;
s,p:real;
begin
  s:=0;
  p:=1;
  for n:=1 to 50 do
  begin
    m:=2*n;
    p:=p/(m-1);
    s:=s+m*p;
    end;
  write(s)
end.