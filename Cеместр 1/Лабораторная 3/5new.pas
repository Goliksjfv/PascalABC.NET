const eps=0.001;
Var k:integer; 
    p,s,t:real;
  Begin
    read(t);
    p:=1;
    s:=1;
    k:=0;
    while abs(p)>=eps do
    begin
      k:=k+1;
      p:=-p*t*t/(2*k-1)/(2*k);
      s:=s+p;
    end;
    writeln(s);
    writeln(cos(t));
  end.