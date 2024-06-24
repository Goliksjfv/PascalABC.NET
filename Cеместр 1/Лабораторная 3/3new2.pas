Var u,t,k:integer; 
    s,p,q:real;
  Begin
  read(t,u);
  p:=1;
  s:=1;
  q:=1;
  for k:=1 to 100 do
    begin
    p:= -p*t*t*q/(2*k-1)/(2*k);
    q:=q*u;
    s:=s+p;
    end;
  writeln(s);
  writeln(cos(t));
  End.