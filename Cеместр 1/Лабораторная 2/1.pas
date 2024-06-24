Var n:integer;
s:real;
begin
  s:=0;
  for n:=1 to 100 do
    s:=s+1/n/n;
  write(s)
end.