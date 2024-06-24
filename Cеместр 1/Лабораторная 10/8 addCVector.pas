uses
  crt;

const
  n = 3;

type
  Complex = record
    Re, Im: real;
  end;
  
type
  CVector = array [1..n] of complex;
  
procedure Input(var U: complex);
begin
  read(U.Re);
  read(U.Im);
end;

procedure Output(W: complex);// Ввод к.ч.
begin
  if W.Im >= 0 then
    write(W.Re, '+', W.Im, 'i')
  else
    write(W.Re, W.Im, 'i');
  writeln;
end;

procedure InputCVectorOne(var u: CVector);
var
  i: integer;
begin
  for i := 1 to n do
    input(U[i]);
end;

procedure InputCVectorTwo(var u: CVector);
var
  i: integer;
begin
  for i := 1 to n do
    input(U[i]);
end;

procedure OutputCVector(U: CVector);//Вывод
var
  i: integer;
begin
  for i := 1 to n do
    output(U[i]); write(' '); 
end;

procedure Add(U, V: Complex; var W: Complex);
  begin
    W.Re := U.Re + V.Re;
    W.Im := U.Im + V.Im;
  end;

procedure AddCVector(U, V: CVector; var W: CVector);
var
  i: integer;
begin
  for i := 1 to n do
    Add(U[i], V[i], W[i]);
end;

var
  a, b, c: CVector;

begin
  writeln('Введите вектор а: ');
  InputCVectorOne(a);
  writeln('Введите вектор b: ');
  InputCVectorTwo(b);
  AddCVector(a, b, c);
  writeln('Сумма векторов a и b:');
  OutputCVector(c);
end.