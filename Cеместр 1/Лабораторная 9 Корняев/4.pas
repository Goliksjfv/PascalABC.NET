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

procedure zeroMatrix(var A: Matrix);
var
  i, j: integer;
begin
  for i := 1 to n do  
    for j := 1 to n do
      zero(a[i, j]);           
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
      GotoXY(8 * j, i + 1);
      Output(a[i, j]);
    end;
end;

var
  x: matrix;

begin
  zeroMatrix(x);
  OutputMatrix(x);
end.