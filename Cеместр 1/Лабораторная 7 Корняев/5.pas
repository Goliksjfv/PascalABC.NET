type complex = record
Re,Im : real
end;
procedure Prod(a:real; z : complex; Var w : complex);
begin
w.Re := a*z.Re;
w.Im := a*z.Im;
end;
Var x,y,z:Complex;
a:real;
Begin
read(a);
read(x.Re);
read(x.Im);
Prod(a,x,z);
write(z.Re,' ',z.Im);
End.
