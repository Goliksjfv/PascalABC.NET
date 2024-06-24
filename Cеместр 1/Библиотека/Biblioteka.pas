unit Biblioteka;

interface

uses crt;

//7 лабораторная
type Complex = record
Re,Im : real;
end;

procedure Add(u,v : Complex; Var w : Complex);
procedure Mult(u,v : complex; Var w : complex);
procedure Inv(z : complex; Var w : complex);
procedure Divz(u,v : complex; Var w : complex);
procedure Prod(a:real; z : complex; Var w : complex);
function Modul(z:Complex):real;
procedure One(Var z : complex);
procedure Zero(Var z : complex);


//8 лабораторная
Const n = 2;

type 
  VectorC = array[1..n] of Complex;
  
procedure expC(Z: Complex; var S: Complex);
procedure CosC(Z: Complex; var S: Complex);
procedure SinC(Z: Complex; var S: Complex);

//9 лабораторная
type
  Matrix = array [1..n, 1..n] of Complex;
   
procedure Output(W: complex);
procedure addMatrix(a, b: Matrix; var c: Matrix);
procedure InputMatrixOne(var a: matrix);
procedure InputMatrixTwo(var a: matrix);
procedure OutputMatrix(a: matrix);
procedure MultMatrix(a, b: matrix; var c: matrix);
procedure ProdMatrix(a: real; B: Matrix; var C: Matrix);
procedure zeroMatrix(var A: Matrix);
procedure oneMatrix(var A: Matrix);
function NormMatrix(a: matrix): real;
procedure expMatrix(a: Matrix; var s: matrix);

//10 лабораторная
Const n10 = 3;
Type 
  Vector = array[1..n10] of real;
  
procedure AddVect(x, y : Vector; var z : Vector);
procedure InputVect(k : integer; var x : Vector);
procedure OutputVect(k : integer; x : Vector);
function ScalProd(x, y : Vector):real; 
procedure VectProd(x, y : Vector; var z : Vector); 
function MixProd(x, y, z : Vector):real;
procedure DivVect(x, y : Vector; var z : Vector);
function ModulVect(x : Vector): real;   
procedure MultRVect(a : real; x : Vector; var y : Vector); 

type
  CVector = array [1..n10] of complex;
  
procedure InputCVectorOne(var u: CVector);
procedure InputCVectorTwo(var u: CVector);
procedure OutputCVector(U: CVector);
procedure AddCVector(U, V: CVector; var W: CVector);
procedure Input(var U: complex);

implementation

//7 лабораторная
procedure Add(u,v : Complex; Var w : Complex);
Begin
w.Re := u.Re + v.Re;
w.Im := u.Im + v.Im
end;

procedure Mult(u,v : complex; Var w : complex);
begin
w.Re := u.Re * v.Re - u.Im * v.Im;
w.Im := u.Re * v.Im + u.Im * v.Re
end;

procedure Inv(z : complex; Var w : complex);
Var q:real;
begin
q:=sqr(z.Re)+sqr(z.Im);
w.Re := z.Re/q;
w.Im := z.Im/q;
end;

procedure Divz(u,v : complex; Var w : complex);
Var z:Complex;
begin
Inv(v,z);
Mult(u,z,w);
end;

procedure Prod(a:real; z : complex; Var w : complex);
begin
w.Re := a*z.Re;
w.Im := a*z.Im;
end;

function Modul(z:Complex):real;
begin
Modul:=sqrt(sqr(z.Re)+sqr(z.Im));
end;

procedure One(Var z : complex);
begin
z.Re := 1;
z.Im := 0;
end;

procedure Zero(Var z : complex);
begin
z.Re := 0;
z.Im := 0;
end;

//8 лабораторная
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

procedure CosC(Z: Complex; var S: Complex);
const
  eps = 0.001;
var
  K: integer; P, Z2: Complex;
begin
  k := 0;
  One(p);
  One(s);
  Mult(Z, Z, Z2);
  while (Modul(P) >= eps) do
  begin
    k := k + 2;
    Mult(P, Z2, P);
    Prod(-1 / k / (k - 1), P, P);
    Add(S, P, S);
  end;
end;

procedure SinC(Z: Complex; var S: Complex);
  const eps = 0.001;
  var K: integer; P, Z2: Complex;
  begin
    k := 0;
    One(p);
    One(s);
    Mult(Z, Z, Z2);
    while (Modul(P) >= eps) do
      begin
      k := k + 2;
      Mult(P, Z2, P);
      Prod(-1 / k / (k + 1), P, P);
      Add(S, P, S);
      end;
  end;
  
//9 лабораторная
procedure Output(W: complex);
begin
  if W.Im >= 0 then
    write(W.Re, '+', W.Im, 'i')
  else
    write(W.Re, W.Im, 'i');
  writeln;
end;

procedure addMatrix(a, b: Matrix; var c: Matrix);
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Add(a[i, j], b[i, j], c[i, j]);
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

procedure zeroMatrix(var A: Matrix);
var
  i, j: integer;
begin
  for i := 1 to n do  
    for j := 1 to n do
      zero(a[i, j]);           
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

//10 лабораторная
procedure AddVect(x, y : Vector; var z : Vector); 
var i : integer;
begin
  for i := 1 to n10 do 
    z[i] := x[i] + y[i];
end;

procedure InputVect(k : integer; var x : Vector); 
var i : integer;
begin
  for i := 1 to n10 do
  begin
    GoToXY(40,20);readln(x[i]);
    GoToXY(40,20);writeln('                  ');
    GoToXY(5+i*4,k);writeln(x[i]);
  end;
end;

procedure OutputVect(k : integer; x : Vector);
var i : integer;
begin
  for i := 1 to n10 do
  begin
    GoToXY(5+i*4,k);writeln(x[i]);
  end;
end;

function ScalProd(x, y : Vector):real; 
var i : integer; S:real;
begin
  S := 0;
  
  for i := 1 to n10 do 
    S := S + x[i]*y[i];
    
  ScalProd := S
end;

procedure VectProd(x, y : Vector; var z : Vector); 
begin
  z[1] := x[2]*y[3] - x[3]*y[3];
  z[2] := x[3]*y[1] - x[1]*y[3];
  z[3] := x[1]*y[2] - y[1]*x[2]; 
end;

function MixProd(x, y, z : Vector):real;  
begin
  VectProd(x,y,y);
  MixProd := ScalProd(y,z);
end;

procedure DivVect(x, y : Vector; var z : Vector);
var i : integer;
begin
  for i := 1 to n10 do 
    z[i] := x[i] - y[i];
end;

function ModulVect(x : Vector): real; 
var i : integer; s : real;
begin
  s := 0;
  
  for i := 1 to n10 do
    s := s + sqr(x[i]);
  
  ModulVect := sqrt(s);
end;

procedure MultRVect(a : real; x : Vector; var y : Vector); 
var i : integer;
begin
  for i := 1 to n10 do
    y[i] := a * x[i];   
end;

//1111

procedure InputCVectorTwo(var u: CVector);
var
  i: integer;
begin
  for i := 1 to n10 do
    input(U[i]);
end;

procedure InputCVectorOne(var u: CVector);
var
  i: integer;
begin
  for i := 1 to n10 do
    input(U[i]);
end;

procedure OutputCVector(U: CVector);//Вывод
var
  i: integer;
begin
  for i := 1 to n10 do
    output(U[i]); write(' '); 
end;

procedure AddCVector(U, V: CVector; var W: CVector);
var
  i: integer;
begin
  for i := 1 to n10 do
    Add(U[i], V[i], W[i]);
end;

procedure Input(var U: complex);
begin
  read(U.Re);
  read(U.Im);
end;
end.