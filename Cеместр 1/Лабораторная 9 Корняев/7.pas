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

procedure One(var Z: Complex);
begin
  Z.Re := 1;
  Z.Im := 0;
end;

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

procedure Prod(a: real; Z: Complex; var W: Complex);
begin
  W.Re := a * Z.Re;
  W.Im := a * Z.Im;
end;

function Modul(Z: Complex): real;
begin
  Modul := sqrt(sqr(Z.Re) + sqr(Z.Im))
end;

procedure Output(W: complex);
begin
  if W.Im >= 0 then
    write(W.Re, '+', W.Im, 'i')
  else
    write(W.Re, W.Im, 'i');
  writeln;
end;

procedure oneMatrix(var A: Matrix);
var
  i, j: integer;
begin
  for j := 1 to n do  
    for i := 1 to n do                              
      Zero(A[i, j]);
  for i := 1 to n do
    for j := 1 to n do
      if i = j then One(A[i, j])
end;

function NormMatrix(a: matrix): real; 
var
  i, j: Integer; p, s: real;
begin
  p := 0;
  for i := 1 to n do                            
  begin
    s := 0;
    for j := 1 to n do
    begin
      s := s + Modul(a[i, j]);
      if s >= p then p := s;
    end; 
  end;
  NormMatrix := p;
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

procedure ProdMatrix(a: real; B: Matrix; var C: Matrix);
var
  i, j: integer;
begin
  for i := 1 to n do  
    for j := 1 to n do
      Prod(a, B[i, j], c[i, j]);           
end;

procedure addMatrix(a, b: Matrix; var c: Matrix);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Add(a[i, j], b[i, j], c[i, j]);
end;

procedure expMatrix(a: Matrix; var s: matrix);
const
  eps = 0.001;
var
  k: integer; P: matrix;

begin
  OneMatrix(P);
  OneMatrix(S);
  K := 0;               
  while normMatrix(p) >= eps do 
  begin
    K := K + 1;
    MultMatrix(p, a, p);
    ProdMatrix(1 / k, p, p);
    AddMatrix(s, p, s);
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
      GotoXY(20 * j - 12, i + 4);
      Output(a[i, j]);
    end;
end;

var
  x, s: matrix;

begin
  InputMatrixOne(x);
  expMatrix(x, s);
  writeln();
  OutputMatrix(s);
end.