type complex = record
Re,Im : real
end;

procedure Mult(u,v : complex; Var w : complex);
begin
w.Re := u.Re * v.Re - u.Im * v.Im;
w.Im := u.Re * v.Im + u.Im * v.Re
end;

procedure Add(u,v : Complex; Var w : Complex);
Begin
w.Re := u.Re + v.Re;
w.Im := u.Im + v.Im
end;

procedure One(Var z : complex);
begin
z.Re := 1;
z.Im := 0;
end;

var x,t,p,s:Complex; i:integer;

Begin
One(p);
read(t.Re);
read(t.Im);
for i:=1 to 20 do
begin
Mult(P,T,P);
Add(S,P,S);
end;
write(s.Re,' ',s.Im);
End.