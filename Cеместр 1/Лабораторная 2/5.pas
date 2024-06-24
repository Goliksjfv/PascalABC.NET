Var n:integer;
s,p:real;
begin
  p:=1;
  s:=0;
  for n:=1 to 14 do
  begin
    p:=p/n;
    s:=s + (n + 1) * p;
    end;
  write(s)
end.