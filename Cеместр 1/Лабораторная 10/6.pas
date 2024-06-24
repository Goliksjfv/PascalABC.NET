{Модуль вектора}
Uses Crt;
Const n = 3;
Type Vector = array[1..n] of real;

function ModulVect(x : Vector): real; 
var i : integer; s : real;
begin
  s := 0;
  
  for i := 1 to n do
    s := s + sqr(x[i]);
  
  ModulVect := sqrt(s);
end;

procedure InputVect(k : integer; var x : Vector); 
var i : integer;
begin
  for i := 1 to n do
  begin
    GoToXY(40,20);readln(x[i]);
    GoToXY(40,20);writeln('                  ');
    GoToXY(5+i*4,k);writeln(x[i]);
  end;
end;

procedure OutputVect(k : integer; x : Vector); 
var i : integer;
begin
  for i := 1 to n do
  begin
    GoToXY(5+i*4,k);writeln(x[i]);
  end;
end;

var x : Vector;

begin
  InputVect(1,x);
  GoToXY(9,3);writeln(ModulVect(x));
end.