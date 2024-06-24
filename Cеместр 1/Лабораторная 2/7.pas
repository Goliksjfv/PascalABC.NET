Var n,t:integer;
s,p:real;
begin
  read(t);
  p:=1;
  s:=1;
  for n:=1 to 100 do
  begin
    p:=p*t/n;
    s:=s + p;
    end;
  write(s)
end.