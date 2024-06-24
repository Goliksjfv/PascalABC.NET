Unit CompMatr;

Interface
  Uses Compl, Crt;
  const MatLen = 2;
  const eps = 0.000001;

  Type Matrix = array[1..MatLen,1..MatLen] of Complex;
  
    procedure AddMatrix(a,b: Matrix; Var c: Matrix);
    procedure SubMatrix(a,b: Matrix; Var c: Matrix);
    procedure MultMatrix(a,b: Matrix; Var c: Matrix);
    function NormMatrix(a: Matrix): real;
    procedure ZeroMatrix(var a: Matrix);
    procedure OneMatrix(var a: Matrix);
    procedure ProdMatrix(p: real; a: Matrix; Var b: Matrix);
    procedure ExpMatrix(a: Matrix; var b: Matrix);
    procedure InputMatrix(var a: Matrix);
    procedure OutputMatrix(var a: Matrix);
    procedure Wait;
    procedure MenuComplexMatrix;
    
Implementation

    procedure AddMatrix(a,b: Matrix; Var c: Matrix);
      var i, j: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            Add(a[i,j], b[i,j], c[i,j])
      end;
      
      
    procedure SubMatrix(a,b: Matrix; Var c: Matrix);
      var i, j: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            Sub(a[i,j], b[i,j], c[i,j])
      end;
      
    procedure MultMatrix(a,b: Matrix; Var c: Matrix);
      var p, s: Complex;
      var i, j, k: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            begin
              Zero(s);
              for k:= 1 to MatLen do
                begin
                  Mult(a[i,k], b[k,j], p);
                  Add(s, p, s)
                end;
                c[i,j]:= s;
            end;
      end;
      
    function NormMatrix(a: Matrix): real;
      var i, j: integer;
      var z, s: real;
      begin
        z:= 0;
        for i:= 1 to MatLen do
        begin
          s:= 0;
          for j:= 1 to MatLen do
            s:= s + Modul(a[i,j]);
            if s > z then z:= s;
        end;
        NormMatrix:= z;
      end;
      
      
    procedure ZeroMatrix(var a: Matrix);
      var i, j: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            Zero(a[i,j])
      end;
    
    procedure OneMatrix(var a: Matrix);
      var k: integer;
      begin
        ZeroMatrix(a);
        for k:= 1 to MatLen do
          One(a[k,k])
      end;
      
    procedure ProdMatrix(p: real; a: Matrix; Var b: Matrix);
    var i, j: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            Prod(p, a[i,j], b[i,j])
      end;
      
    procedure ExpMatrix(a: Matrix; var b: Matrix);
      var k: integer; p: Matrix;
      begin
        k:= 0;
        OneMatrix(p); OneMatrix(b);
        while NormMatrix(p) >= eps do
          begin
            k:= k + 1;
            MultMatrix(p, a, p);
            ProdMatrix(1 / k, p, p);
            AddMatrix(b, p, b);
          end;
      end;
      
    procedure InputMatrix(var a: Matrix);
      var i, j: integer;
      begin
        for i:=1 to MatLen do
          for j:= 1to MatLen do
            begin
              Input(a[i, j]);GoToXY(30 + 15 * j, 5 + i * 3);write(a[i,j]);
            end;
            delay(400);
            GoToXY(1, 8);clearline;
            GoToXY(1, 11);clearline;
      end;
    
    procedure OutputMatrix(var a: Matrix);
      var i, j: integer;
      begin
        for i:= 1 to MatLen do
          for j:= 1 to MatLen do
            begin
              GoToXY(30 + 30 * j, 5 + i * 3); Output(a[i, j]);
            end;
      end;
      
    procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;
      
    procedure MenuComplexMatrix;
      var Mode: integer; Ok: boolean; a, b, c: Matrix; p: real;
      begin
          Ok:= true;
          while Ok do
            begin
              ClrScr;
              GoToXY(55, 1);writeln('Выберетие пункт');
              GoToXY(45, 3);writeln('1:  Сложение матриц');
              GoToXY(45, 5);writeln('2:  Вычитание матриц');
              GoToXY(45, 7);writeln('3:  Умножение матриц');
              GoToXY(45, 9);writeln('4:  Умножение матрицы на скаляр');
              GoToXY(45, 11);writeln('5:  Матричный ноль');
              GoToXY(45, 13);writeln('6:  Матричная единица');
              GoToXY(45, 15);writeln('7:  NormMatrix');
              GoToXY(45, 17);writeln('8:  ExpMatrix');
              GoToXY(45, 19);writeln('0:  Выход');
              GoToXY(45, 21);readln(Mode);ClrScr;
              case Mode of
                1: begin
                    GoToXY(50, 1);write('Сложение матриц');
                    InputMatrix(a); InputMatrix(b);
                    AddMatrix(a, b, c);
                    OutputMatrix(c);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                2:  begin
                    GoToXY(50, 1);write('Вычитание матриц');
                    InputMatrix(a); InputMatrix(b);
                    SubMatrix(a, b, c);
                    OutputMatrix(c);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                3: begin
                    GoToXY(50, 1);write('Умножение матриц');
                    InputMatrix(a); InputMatrix(b);
                    MultMatrix(a, b, c);
                    OutputMatrix(c);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                4: begin
                    GoToXY(50, 1);write('Умножение матрицы на скаляр');
                    readln(p); InputMatrix(a);
                    ProdMatrix(p, a, c);
                    OutputMatrix(c);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                5: begin
                    GoToXY(50, 1);write('Матричный ноль');
                    ZeroMatrix(a);
                    OutputMatrix(a);
                    Wait;
                   end;
                
                6: begin
                    GoToXY(50, 1);write('Матричная единица');
                    OneMatrix(a);
                    OutputMatrix(a);
                    Wait;
                   end;
                   
                7: begin
                    GoToXY(50, 1);write('NormMatrix');
                    InputMatrix(a);
                    NormMatrix(a);
                    writeln(NormMatrix(a));
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                8: begin
                    GoToXY(50, 1);write('ExpMatrix');
                    InputMatrix(a);
                    ExpMatrix(a, b);
                    OutputMatrix(b);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                0: Ok:= false;
              end;
          end;
      end;
end. 