uses crt;
const n = 10;
var k,i,t,m:integer;
glass:real;
  a: array[1..n] of real;
begin
  for i := 1 to n do
  begin
    GoToXY (4 * i + 5, 3);
    readln(a[i]);
  end;
  m := trunc (n / 2);
  for k := 1 to m do
  begin
    t := n + 1;
    glass := a[k];
    a[k] := a[t - k];
    a[t - k] := glass;
  end;
  for i := 1 to n do
  begin
    GoToXY (4 * i + 5, 5);
    write(a[i]);
  end;
  GoToXY (9, 7);
end.
