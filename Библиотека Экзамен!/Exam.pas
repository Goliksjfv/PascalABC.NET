Unit Exam;

Interface

Uses Crt, Compl, VectC, VectR, CompMatr;
const eps = 0.001; n = 10;

procedure Task1;
procedure Task2;
procedure Wait;
procedure ExamMenu;

Implementation

procedure Task1;
  var i,j: integer;
      a: array[1..n,1..n] of Complex;
      z: Complex;
      max:real;
  begin
    max:= 0;
    for i:= 1 to n do begin
        for j:= 1 to n do begin
          a[i,j].Re:= sqr(sin(3*i+j));
          a[i,j].Im:= -cos(i*i+2*j);
          GoToXY(10+15*j, 3+i*3); write('(',a[i,j].Re:0:2,',',a[i,j].Im:0:2,')');
          GoToXY(45, 1);
          if Modul(a[i,j]) > max then max:= Modul(a[i,j])
        end;
    end;
    GoToXY(30, 70);writeln('MaxModul = ', max); writeln();
  end;
  
procedure Task2;
  var p, max, prevMax, s: real;
    k: integer;
    a: Vector;
  begin
    max:= -1000;
    prevMax:= -1000;
    for k:= 1 to n do a[k]:= random(21)-10;
    for k:=1 to n do begin
      if a[k] > max then max:= a[k]; 
    end;
    for k:=1 to n do begin
      if (a[k] > prevMax) and (a[k] <> max) then prevMax:= a[k]; 
    end;
    GoToXY(30, 5);OutputVector(a);
    GoToXY(35, 7);writeln('Max = ', max);
    GoToXY(35, 9);writeln('Previous Max = ', prevMax);
  end;

procedure Wait;
  begin
    repeat until KeyPressed;
      while KeyPressed do ReadKey
  end;
  
procedure ExamMenu;
var Mode: integer;
    Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          GoToXY(45, 3);writeln('1: Матрица');
          GoToXY(45, 5);writeln('2: Вектор');
          GoToXY(45, 25);writeln('0 Выход');
          GoToXY(40, 27); readln(Mode);
          ClrScr;
            Case Mode of
              1: 
                begin
                  GoToXY(40, 1); //writeln('n = 10');
                  //writeln('');
                  Task1;
                  Wait;
                end;
              2: 
                begin
                  GoToXY(40, 1); writeln('n = 10');
                  Task2;
                  Wait;
                end;
              0: Ok:= false
              else
                begin
                  GoToXY(30, 24);
                  writeln('Ошибка! Повторите ввод!');
                  delay(1000);
                end;
            end;
        end;
    end;
end.