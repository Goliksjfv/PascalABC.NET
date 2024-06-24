{разность векторов}
Uses Crt;
Const n = 3;
Type Vector = array[1..n] of real;

procedure DivVect(x, y : Vector; var z : Vector);
var i : integer;
begin
  for i := 1 to n do 
    z[i] := x[i] - y[i];
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
  DivVect(x,y,w);
  OutputVect(5,w);
end.