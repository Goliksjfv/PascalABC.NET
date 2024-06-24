{произведение вектора на число}
Uses Crt;
Const n = 3;
Type Vector = array[1..n] of real;

procedure MultRVect(a : real; x : Vector; var y : Vector); 
var i : integer;
begin
  for i := 1 to n do
    y[i] := a * x[i];   
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

var x,w : Vector; a : real;

begin
  InputVect(1,x);
  GoToXY(9,3);readln(a);
  MultRVect(a,x,w);
  OutputVect(5,w);
end.