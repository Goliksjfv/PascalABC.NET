type Complex = record
Re,Im : real;
end;
procedure Add(u,v : Complex; Var w : Complex);
Begin
w.Re := u.Re + v.Re;
w.Im := u.Im + v.Im
end;
Var x,y,z:Complex;
Begin
read(x.Re);
read(x.Im);
read(y.Re);
read(y.Im);
Add(x,y,z);
write(z.Re,' ',z.Im);
End.
//1+3
//2+4