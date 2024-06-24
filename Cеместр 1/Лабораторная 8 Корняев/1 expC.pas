type
  Complex = record
    Re, Im: real;
  end;

procedure Mult(U, V: Complex; var W: Complex);
begin
  W.Re := U.Re * V.Re - U.Im * V.Im;
  W.Im := U.Re * V.Im + U.Im * V.Re;
end;

procedure Prod(a: real; Z: Complex; var W: Complex);
begin
  W.Re := a * Z.Re;
  W.Im := a * Z.Im;
end;

procedure Add(U, V: Complex; var W: Complex);
begin
  W.Re := U.Re + V.Re;
  W.Im := U.Im + V.Im;
end;

procedure One(var Z: Complex);
begin
  Z.Re := 1;
  Z.Im := 0;
end;

function Modul(Z: Complex): real;
begin
  Modul := sqrt(sqr(Z.Re) + sqr(Z.Im))
end;

procedure expC(Z: Complex; var S: Complex);
const
  eps = 0.001;
var
  K: integer; P: Complex;
begin
  One(P);
  One(S);
  k := 0;
  while (Modul(p) >= eps) do
  begin
    k := k + 1;
    Mult(P, Z, P);
    Prod(1 / K, P, P);
    Add(S, P, S);
  end;
end;

var
  x, z: Complex;

begin
  write('Вещественная часть '); read(x.Re);
  write('Мниманая часть '); read(x.Im);
  expC(x, z);
  write(z.Re, ',', z.Im);
end.