Unit VectR;

Interface
  Uses Crt, Compl;
  const vectorLength = 10;
  Type Vector = array[1..vectorLength] of real;
    
    procedure AddVector(a, b: Vector; var c: Vector);
    procedure SubVector(a, b: Vector; var c: Vector);
    function ScalProd(a, b: Vector): real;
    procedure VectProd(a, b: Vector; var c: Vector);
    function MixProd(a, b, c: Vector): real;
    procedure InputVector(var a: Vector);
    procedure OutputVector(a: Vector);
    function LengthVector(a: Vector): real;
    function VectCos(a, b: Vector): real;
    procedure Wait;
    procedure MenuVectR;

Implementation

    procedure AddVector(a, b: Vector; var c: Vector);
      var i: integer;
        begin
          for i:= 1 to vectorLength do 
            c[i]:= a[i] + b[i]
        end;
        
    procedure SubVector(a, b: Vector; var c: Vector);
      var i: integer;
        begin
          for i:= 1 to vectorLength do 
            c[i]:= a[i] - b[i]
        end;
      
      
    function ScalProd(a, b: Vector): real;
      var i: integer; s: real;
        begin
          s:= 0;
          for i:= 1 to vectorLength do
            s:= s + a[i] * b[i];
            ScalProd:= s
        end;
      
     procedure VectProd(a, b: Vector; var c: Vector);
       begin
          c[1]:= a[2] * b[3] - a[3] * b[2];
          c[2]:= a[3] * b[1] - a[1] * b[3];
          c[3]:= a[1] * b[2] - a[2] * b[1]
       end;
      
      
     function MixProd(a, b, c: Vector): real;
       var d: Vector;
         begin
           VectProd(a, b, d);
           MixProd:= ScalProd(d, c);
         end;
       
     procedure InputVector(var a: Vector);
        var i: integer;
        begin
          GoToXY(40, 10);write('Вектор:');
          GoToXY(50, 10);write('(');write('        ');
          GoToXY(60, 10);write(')');
          for i:= 1 to vectorLength do
            begin
             GoToXY(49 + i * 3, 10);read(a[i]);
            end;
        end;
      
      
      procedure OutputVector(a: Vector);
          var i: integer;
          begin
            for i:= 1 to vectorLength do
              begin
                write('   ');write(a[i]:0:2);write('   ');
              end;
          end;
      
      function LengthVector(a: Vector): real;
        begin
          LengthVector:= sqrt(ScalProd(a, a));
        end;
        
      
      function VectCos(a, b: Vector): real;
        begin
          VectCos:= ScalProd(a, b) / (LengthVector(a) * LengthVector(b));
        end;
        
      procedure Wait;
        begin
          repeat until KeyPressed;
            while KeyPressed do ReadKey
        end;
      
      procedure MenuVectR;
        var Mode: integer; Ok: boolean; a, b, c: Vector;
        begin
          Ok:= true;
          while Ok do
            begin
              ClrScr;
              GoToXY(50, 1);writeln('Выберетие пункт');
              GoToXY(45, 3);writeln('1:  Сложение векторов');
              GoToXY(45, 5);writeln('2:  Вычитание векторов');
              GoToXY(45, 7);writeln('3:  Скалярное произведение векторов');
              GoToXY(45, 9);writeln('4:  Векторное произведение векторов');
              GoToXY(45, 11);writeln('5:  Смешанное произведение векторов');
              GoToXY(45, 13);writeln('6:  Длина вектора');
              GoToXY(45, 15);writeln('7:  Косинус угла между векторами');
              GoToXY(45, 17);writeln('0:  Выход');
              GoToXY(45, 22);readln(Mode);
              ClrScr;
              case Mode of
                1: begin
                    GoToXY(50, 1);write('Сложение векторов');
                    InputVector(a); InputVector(b);
                    AddVector(a, b, c);
                    GoToXY(50, 15);write('(');OutputVector(c);write(')');
                    Wait;
                   end;
                   
                2: begin
                    GoToXY(50, 1);write('Вычитание векторов');
                    InputVector(a);InputVector(b);
                    SubVector(a, b, c);
                    GoToXY(50, 15);write('(');OutputVector(c);write(')');
                    Wait;
                   end;
                   
                3: begin
                    GoToXY(46, 1);write('Скалярное произведение векторов');
                    InputVector(a); InputVector(b);
                    ScalProd(a, b);
                    GoToXY(50, 15);write('a * b = ');write(ScalProd(a, b));
                    Wait;
                   end;
                   
                4: begin
                    GoToXY(46, 1);write('Векторное произведение векторов');
                    InputVector(a); InputVector(b);
                    VectProd(a, b, c);
                    GoToXY(50, 15);write('a X b = ');write('(');OutputVector(c);write(')');
                    Wait;
                   end;
                   
                5: begin
                    GoToXY(46, 1);write('Смешанное произведение векторов');
                    InputVector(a); InputVector(b); InputVector(c);
                    MixProd(a, b, c);
                    GoToXY(50, 15);write('abc = ');write(MixProd(a, b, c));
                    Wait;
                   end;
                   
                6: begin
                    GoToXY(55, 1);write('Длина вектора');
                    InputVector(a);
                    LengthVector(a);
                    GoToXY(50, 15);write('|a| = ');write(LengthVector(a));
                    Wait;
                   end;
                   
                7: begin
                    GoToXY(43, 1);write('Косинус угла между векторами');
                    InputVector(a); InputVector(b);
                    VectCos(a, b);
                    GoToXY(50, 15);write('cos a^b = ');write(VectCos(a, b));
                    Wait;
                   end;
                
                0: Ok:= false;
              end;
          end;
      end;
      
end.      