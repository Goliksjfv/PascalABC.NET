Uses Crt;
Const n=3;m=4;
Var i,j:integer;
max,min:real;
a:array[1..n,1..m] of real;
begin
  max:=integer.MinValue;
  min:=integer.MaxValue;
  for i:=1 to n do
    for j:=1 to m do
    begin
      goToXY(4*j,i+3);
      readln(a[i,j]);
    end;
    for i:=1 to n do
    begin
      for j:=1 to m do
        if a[i,j]>max then max:=a[i,j];
      if max<min then min:=max;
      goToXY(4*n+16,i+n);
      write(max);
    end;
    goToXY(4*n+16,n*n);
    write(min);
    goToXY(4,30);
end.