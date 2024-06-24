type complex = record
Re,Im : real
end;
procedure Mult(u,v : complex; Var w : complex);
begin
w.Re := u.Re * v.Re - u.Im * v.Im;
w.Im := u.Re * v.Im + u.Im * v.Re
end;
Var x,y,z:Complex;
Begin
read(x.Re);
read(x.Im);
read(y.Re);
read(y.Im);
Mult(x,y,z);
write(z.Re,' ',z.Im);
End.
//1*3-2*4
//1*4+2*3