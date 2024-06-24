uses
  crt;

const
  n = 2;

type
  Complex = record
    Re, Im: real;
  end;

type
  Matrix = array [1..n, 1..n] of Complex;

procedure Mult(U, V: Complex; var W: Complex);
begin
  W.Re := U.Re * V.Re - U.Im * V.Im;
  W.Im := U.Re * V.Im + U.Im * V.Re;
end;

procedure Add(U, V: Complex; var W: Complex);
begin
  W.Re := U.Re + V.Re;
  W.Im := U.Im + V.Im;
end;

procedure Zero(var Z: Complex);
begin
  Z.Re := 0;
  Z.Im := 0;
end;

procedure Output(W: complex);
begin
  if W.Im >= 0 then
    write(W.Re, '+', W.Im, 'i')
  else
    write(W.Re, W.Im, 'i');
  writeln;
end;

procedure MultMatrix(a, b: matrix; var c: matrix);
var
  i, j, k: integer; P, S: Complex;
begin
  for i := 1 to n do 
    for j := 1 to n do 
    begin
      Zero(S);
      for k := 1 to n do
      begin
        Mult(a[i, k], b[k, j], P);
        add(S, P, S);
      end;
      c[i, j] := S;
    end;
end;

procedure InputMatrixOne(var a: matrix);
var
  i, j: integer; u: Complex;
begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      GotoXY(7 * j + 1, i + 1);
      read(U.Re);
      GotoXY(7 * j + 4, i + 1);
      read(U.Im);
      a[i, j] := U;
    end;
end;

procedure InputMatrixTwo(var a: matrix);
var
  i, j: integer; u: Complex;
begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      GotoXY(7 * j + 1, i + 4);
      read(U.Re);
      GotoXY(7 * j + 4, i + 4);
      read(U.Im);
      a[i, j] := U;
    end;
end;

procedure OutputMatrix(a: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      GotoXY(8 * j, i + 7);
      Output(a[i, j]);
    end;
end;

var
  x, y, s: matrix;

begin
  InputMatrixOne(x);
  InputMatrixTwo(y);
  multMatrix(x, y, s);
  OutputMatrix(s);
end.