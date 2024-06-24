Var x,t,n:integer;
s,p:real;
begin
  p:=1;
  s:=0;
  read(t);
  for n:=1 to 100 do
  begin
    p:=-p*t*t/(2*k-1)/(2*k);
    s:=s+p;
  end;
  write(s)
end.