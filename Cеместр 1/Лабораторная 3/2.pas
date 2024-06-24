Var mu,t,k:integer; 
    s,p,q:real;
  Begin
  read(t,mu);
  p:=1;
  s:=1;
  q:=1;
  for k:=1 to 100 do
    begin
    p:=p*t*q/k;
    q:=q*mu;
    s:=s+p;
    end;
  writeln(s);
  writeln(exp(t));
  End.