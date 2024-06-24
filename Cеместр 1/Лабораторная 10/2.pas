{скалярное произведение}
Uses Crt;
Const n = 3;
Type Vector = array[1..n] of real;

function ScalProd(x, y : Vector):real; 
var i : integer; S:real;
begin
  S := 0;
  
  for i := 1 to n do 
    S := S + x[i]*y[i];
    
  ScalProd := S
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

var x,y : Vector;

begin
  InputVect(1,x);
  InputVect(3,y);
  GoToXY(13,5);writeln(ScalProd(x,y));
  GoToXY(20,20);
end.