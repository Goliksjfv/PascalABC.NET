type complex = record
Re,Im : real
end;

procedure Mult(u,v : complex; Var w : complex);
begin
w.Re := u.Re * v.Re - u.Im * v.Im;
w.Im := u.Re * v.Im + u.Im * v.Re
end;

procedure Inv(z : complex; Var w : complex);
Var q:real;
begin
q:=sqr(z.Re)+sqr(z.Im);
w.Re := z.Re/q;
w.Im := z.Im/q;
end;

procedure Divz(u,v : complex; Var w : complex);
Var z:Complex;
begin
Inv(v,z);
Mult(u,z,w);
end;

Var x,y,z:Complex;

Begin
read(x.Re);
read(x.Im);
read(y.Re);
read(y.Im);
Divz(x,y,z);
write(z.Re,' ',z.Im);
End.
