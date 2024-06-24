Unit VectC;

Interface
  uses Crt, Compl, VectR;
  const eps = 0.000001; CompVectLen = 3;
  Type VectorC = array[1..CompVectLen] of Complex;
  
  
  procedure AddVectC(a, b: VectorC; var c: VectorC);
  procedure SubVectC(a, b: VectorC; var c: VectorC);
  procedure ScalProdC(a, b: VectorC; var c: Complex);
  procedure VectProdC(a, b: VectorC; var c: VectorC);
  {function MixProdC(a, b, c: VectorC): Complex;
  function LengthVectorC(a: VectorC): real;}
  procedure InputVectC(var a: VectorC);
  procedure OutputVectC(a: VectorC);
  procedure Wait;
  procedure MenuVectC;
  
  
Implementation

     procedure AddVectC(a, b: VectorC; var c: VectorC);
        var i: integer;
        begin
          for i:= 1 to CompVectLen do 
            Add(a[i], b[i], c[i]);
        end;
        
     procedure SubVectC(a, b: VectorC; var c: VectorC);
        var i: integer;
        begin
          for i:= 1 to CompVectLen do 
            Sub(a[i], b[i], c[i]);
        end;
        
     procedure ScalProdC(a, b: VectorC; var c: Complex);
        var i: integer; z, w: Complex;
        begin
          Zero(c);
          for i:= 1 to CompVectLen do
            begin
              Conj(b[i], z);
              Mult(a[i], z, w);
              Add(c, w, c);
            end;
        end;
        
     procedure VectProdC(a, b: VectorC; var c: VectorC);
        var d, e: Complex;
        begin
            begin
              Mult(a[2], b[3], d); Mult(a[3], b[2], e); Sub(d, e, c[1]);
              Mult(a[3], b[1], d); Mult(a[1], b[3], e); Sub(d, e, c[2]);
              Mult(a[1], b[2], d); Mult(a[2], b[1], e); Sub(d, e, c[3]);
            end;
        end;
        
     procedure MixProdC(a, b, c: VectorC; var f: Complex);
        var d: VectorC;
        begin
          VectProdC(a, b, d);
          ScalProdC(d, c, f);
        end;

     procedure InputVectC(var a: VectorC);
        var i:integer;
          begin
            for i:= 1 to CompVectLen do
              begin
                GoToXY(55, 15);write('('); GoToXY(85, 15);write(')');
                Input(a[i]);GoToXY(53 + i*7, 15);write(a[i]);
              end;
              delay(300);
              clearline;
          end;
          
     procedure OutputVectC(a: VectorC);
      var i: integer;
      begin
        for i:= 1 to CompVectLen do
          begin
            write('   ');Output(a[i]);write('   ');
          end;
      end;
      
     procedure Wait;
        begin
          repeat until KeyPressed;
            while KeyPressed do ReadKey
        end;
        
    procedure MenuVectC;
        var Mode: integer; Ok: boolean; a, b, c: VectorC; z: Complex;
        begin
          Ok:= true;
          while Ok do
            begin
              ClrScr;
              GoToXY(50, 1);writeln('Выберетие пункт');
              GoToXY(45, 3);writeln('1:  Сложение комплексных векторов');
              GoToXY(45, 5);writeln('2:  Вычитание комплексных векторов');
              GoToXY(45, 7);writeln('3:  Скалярное произведение комплексных векторов');
              GoToXY(45, 9);writeln('4:  Векторное произведение комплексных векторов');
              GoToXY(45, 11);writeln('5:  Смешанное произведение комплексных векторов');
              GoToXY(45, 15);writeln('0:  Выход');
              GoToXY(45, 22);readln(Mode);
              ClrScr;
              case Mode of
                1: begin
                    GoToXY(51, 1);write('Сложение комплексных векторов');
                    InputVectC(a); InputVectC(b);
                    AddVectC(a, b, c);
                    clearline;GoToXY(50, 15);write('Вектор: ');GoToXY(58, 15);write('(');OutputVectC(c);write(')');writeln();
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                2: begin
                    GoToXY(51, 1);write('Вычитание комплексных векторов');
                    InputVectC(a); InputVectC(b);
                    SubVectC(a, b, c);
                    clearline;GoToXY(50, 15);write('Вектор: ');GoToXY(58, 15);write('(');OutputVectC(c);write(')');writeln();
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                3: begin
                    GoToXY(45, 1);write('Скалярное произведение комплексных векторов');
                    InputVectC(a); InputVectC(b);
                    ScalProdC(a, b, z);
                    clearline;GoToXY(54, 15);write('C = ');GoToXY(58, 15);Output(z);writeln();
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                4: begin
                    GoToXY(49, 1);write('Векторное произведение комплексных векторов');
                    InputVectC(a); InputVectC(b);
                    VectProdC(a, b, c);
                    clearline;GoToXY(50, 15);write('Вектор: ');GoToXY(58, 15);write('(');OutputVectC(c);write(')');writeln();
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                5: begin
                    GoToXY(49, 1);write('Векторное произведение комплексных векторов');
                    InputVectC(a); InputVectC(b); InputVectC(c);
                    MixProdC(a, b, c, z);
                    clearline;GoToXY(54, 15);write('C = ');GoToXY(58, 15);Output(z);writeln();
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                
                0: Ok:= false;
              end;
          end;
      end;
end.