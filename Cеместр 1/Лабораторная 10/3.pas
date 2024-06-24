{векторное произведение}
Uses Crt;
Const n = 3;
Type Vector = array[1..n] of real;

procedure VectProd(x, y : Vector; var z : Vector); 
begin
  z[1] := x[2]*y[3] - x[3]*y[3];
  z[2] := x[3]*y[1] - x[1]*y[3];
  z[3] := x[1]*y[2] - y[1]*x[2]; 
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

var x,y,w : Vector;

begin
  InputVect(1,x);
  InputVect(3,y);
  VectProd(x,y,w);
  OutputVect(5,w);
end.