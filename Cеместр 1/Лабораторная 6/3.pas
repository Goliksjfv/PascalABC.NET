uses crt;
const n = 10;
var k,i,j,m:integer;
glass:real;
  a: array[1..n] of real;
begin
  for i := 1 to n do
  begin
    GoToXY (4 * i + 5, 3);
    readln(a[i]);
  end;
  m := trunc (n / 3);
  for k := 1 to m do
  begin
    j := 3 *k;
    glass := a[j - 2];
    a[j - 2] := a[j - 1];
    a[j - 1] := a[j];
    a[j] := glass;
  end;
  for i := 1 to n do
  begin
    GoToXY (4 * i + 5, 5);
    write(a[i]);
  end;
  GoToXY (9, 7);
end.
