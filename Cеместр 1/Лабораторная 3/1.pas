Var n,t:integer; 
    s,p:real;
Begin
  p:=1; 
  s:=1;
  read(t); 
  for n:=1 to 100 do
  begin
    p:=-p*t*t/(2*n-1)/(2*n);
    s:=s+p;
  end;
  writeln(s);
  writeln(cos(t));
End.
