const
  n = 2;

type
  Complex = record
    Re, Im: real;
  end;
  
  VectorC = array[1..n] of Complex;

var
  x, y, z: VectorC; i: integer;

procedure Add(U, V: Complex; var W: Complex);
begin
  W.Re := U.Re + V.Re;
  W.Im := U.Im + V.Im;
end;

begin
  
  for i := 1 to n do
  begin
    write('1 ������������ ����� '); readln(x[i].Re);
    write('1 �������� ����� '); readln(x[i].Im);
  end;
  
  for i := 1 to n do
  begin
    write('2 ������������ ����� '); readln(y[i].Re);
    write('2 �������� ����� '); readln(y[i].Im);
  end;
  
  writeln('������ ������������ �����');
  for i := 1 to n do
  begin
    Add(x[i], y[i], z[i]);
    writeln(z[i].Re, ',', z[i].Im);
  end;
end.