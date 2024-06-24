type complex = record
Re,Im : real
end;
procedure One(Var z : complex);
begin
z.Re := 1;
z.Im := 0;
end;
Var x,y,z:Complex;
Begin
read(x.Re);
read(x.Im);
One(x);
write(x.Re,' ',x.Im);
End.
