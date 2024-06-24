Var m,n:integer;
s:real;
begin
  s:=0;
  for n:=1 to 33 do
  begin
    m:=3*n;
    s:=s+1/(m-2)/(m+1);
    end;
  write(s)
end.