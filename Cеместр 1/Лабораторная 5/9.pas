﻿Uses Crt;
Const n=10;
var a:array[1..n,1..n] of integer;
i,j,m:integer;
Begin
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=0; 
  m:=1+trunc(n/2);
  for j:=m to n do
    for i:= n+1-j to j do
      a[i,j]:=1;
  for i:=1 to n do
    for j:=1 to n do
    begin
      GotoXY(10+2*j,3+i); write(a[i,j])
    end;
  GoToXY(20,5+n)
End.