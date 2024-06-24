type complex = record
Re,Im : real
end;
procedure Inv(z : complex; Var w : complex);
Var q:real;
begin
q:=sqr(z.Re)+sqr(z.Im);
w.Re := z.Re/q;
w.Im := z.Im/q;
end;
Var x,y,z:Complex;
Begin
read(x.Re);
read(x.Im);
Inv(x,z);
write(z.Re,' ',z.Im);
End.