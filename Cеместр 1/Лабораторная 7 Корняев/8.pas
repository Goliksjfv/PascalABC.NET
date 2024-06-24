type complex = record
Re,Im : real
end;
procedure Zero(Var z : complex);
begin
z.Re := 0;
z.Im := 0;
end;
Var x,y,z:Complex;
Begin
read(x.Re);
read(x.Im);
Zero(x);
write(x.Re,' ',x.Im);
End.
