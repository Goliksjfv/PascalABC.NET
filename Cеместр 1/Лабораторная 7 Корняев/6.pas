type complex = record
Re,Im : real
end;
function Modul(z:Complex):real;
begin
Modul:=sqrt(sqr(z.Re)+sqr(z.Im));
end;
Var x,y,z:Complex;
Modd:real;
Begin
read(x.Re);
read(x.Im);
Modd:=Modul(x);
write(Modd);
End.
