Unit Compl;

Interface
  uses Crt;
  const eps = 0.00001;
  Type Complex = record Re, Im: real; end;
  
    procedure Add(u,v: Complex; var w: Complex);
    procedure Sub(u, v: Complex; var w: Complex);
    procedure Mult(u,v: Complex; var w: Complex);
    procedure Zero(var z:Complex);
    procedure Inv(z: Complex; var w: Complex);
    procedure Divide(u, v: Complex; var w: Complex);
    function Modul(x: Complex): real;
    procedure Input(var u: Complex);
    procedure Output(u: Complex);
    procedure Prod(a: real; z: Complex; var w: Complex);
    procedure Conj(z: Complex; var w: Complex);
    procedure One(var z: Complex);
    procedure ExpC(z: Complex; var w: Complex);
    procedure Wait;
    procedure MenuComplex;
    
Implementation

    procedure Add(u, v: Complex; var w: Complex);
      begin
        w.Re := u.Re + v.Re;
        w.Im := u.Im + v.Im
      end;
      
    procedure Sub(u, v: Complex; var w: Complex);
      begin
        w.Re := u.Re - v.Re;
        w.Im := u.Im - v.Im
      end;
      
    procedure Mult(u,v: Complex; var w: Complex);
      begin
        w.Re:= u.Re * v.Re - u.Im * v.Im;
        w.Im:= u.Re * v.Im + u.Im * v.Re;
      end;
      
    procedure Zero(var z:Complex);
      begin
        z.Re:= 0;
        z.Im:= 0;
      end;
   
    procedure Inv(z: Complex; var w: Complex);
      var q: real;
      begin
        q:= sqr(z.Re) + sqr(z.Im);
        w.Re:= z.Re / q;
        w.Im:= -z.Im / q;
      end;
    
    procedure Divide(u, v: Complex; var w: Complex);
      var z: Complex;
      begin
        Inv(v, z);
        Mult(u, z, w)
      end;
   
    function Modul(x: Complex): real;
      begin
        Modul:= sqrt(sqr(x.Re) + sqr(x.Im));
      end;
    
    procedure Input(var u: Complex);
      begin
        GoToXY(20, 20); write('Введите Действ. и Миним. часть');
        GoToXY(60, 20); write('Re: '); read(u.Re); GoToXY(63, 20); write('    ');
        GoToXY(75, 20); write('Im: '); read(u.Im); GoToXY(78, 20); write('    ');
      end;
    
    procedure Output(u: Complex);
      begin
        write(u.Re:0:2); if u.Im > 0 then begin write('+i*'); write(u.Im:0:2); end;
                     if u.Im < 0 then begin write('-i*'); write(- u.Im:0:2); end;
      end;
   
    procedure Prod(a: real; z: Complex; var w: Complex);
      begin
        w.Re:= a * z.Re;
        w.Im:= a * z.Im;
      end;
    
    procedure Conj(z: Complex; var w: Complex);
      begin
        w.Re:= z.Re;
        w.Im:= -z.Im;
      end;
    
    procedure One(var z: Complex);
      begin
        z.Re:= 1;
        z.Im:= 0;
      end;
      
    procedure ExpC(z: Complex; var w: Complex);
      var k: integer;
      var p, s: Complex;
      begin
        k:= 0;
        One(p); One(s);
        while Modul(p) >= eps do
        begin
          k:= k + 1;
          Mult(p, z, p);
          Prod(1 / k, p, p);
          Add(p, s, s);
        end;
        w:= s;
      end;
      
      
    procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;
      
    procedure MenuComplex;
      var Mode: integer; Ok: boolean; u, v, w, cs, sn, m, s: Complex; a: real; k: integer;
        begin
          Ok:= true;
          while Ok do
            begin
              ClrScr;
              GoToXY(50, 1);writeln('Выберетие пункт');
              GoToXY(45, 3);writeln('1:  Сложение комплексных чисел');
              GoToXY(45, 5);writeln('2:  Вычитание комплексных чисел');
              GoToXY(45, 7);writeln('3:  Умножение комплексных чисел');
              GoToXY(45, 9);writeln('4:  Умножение комплексного числа на скаляр');
              GoToXY(45, 11);writeln('5:  Комплексный ноль');
              GoToXY(45, 13);writeln('6:  Комплексная единица');
              GoToXY(45, 15);writeln('7:  Модуль комплексного числа');
              GoToXY(45, 17);writeln('8:  Инверсия комплексного числа');
              GoToXY(45, 19);writeln('9:  Деление комплексных чисел');
              GoToXY(45, 21);writeln('10: Комплексно-сопряжённое число');
              GoToXY(45, 23);writeln('11: Комплексная экспонента');
              GoToXY(45, 25);writeln('12: Комплексный косинус');
              GoToXY(45, 27);writeln('13: Комплексный синус');
              GoToXY(45, 29);writeln('0:  Выход');
              GoToXY(45, 30);readln(Mode);
              ClrScr;
              case Mode of
                1: begin
                    GoToXY(50, 1);write('Сложение комплексных чисел');
                    Input(u); Input(v);
                    Add(u, v, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                2: begin
                    GoToXY(50, 1);write('Вычитание комплексных чисел');
                    Input(u); Input(v);
                    Sub(u, v, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                3: begin
                    GoToXY(50, 1);write('Умножение комплексных чисел');
                    Input(u); Input(v);
                    Mult(u, v, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                4: begin
                    GoToXY(50, 1);write('Умножение комплексного числа на скаляр');
                    write('R: ');readln(a); Input(u);
                    Prod(a, u, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                5: begin
                    GoToXY(50, 1);write('Комплексный ноль');
                    Input(w);
                    Zero(w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                6: begin
                    GoToXY(50, 1);write('Комплексная единица');
                    Input(w);
                    One(w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                7: begin
                    GoToXY(50, 1);write('Модуль комплексного числа');
                    Input(w);
                    Modul(w);
                    GoToXY(50, 15);write('Module C: '); writeln(Modul(w));
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                8: begin
                    GoToXY(50, 1);write('Инверсия комплексного числа');
                    Input(u);
                    Inv(u, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                9: begin
                    GoToXY(50, 1);write('Деление комплексных чисел');
                    Input(u); Input(v);
                    Divide(u, v, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                10: begin
                    GoToXY(50, 1);write('Комплексно-сопряжённое число');
                    Input(u);
                    Conj(u, w);
                    GoToXY(50, 15);write('C = '); Output(w);
                    GoToXY(1, 20);clearline;
                    Wait;
                   end;
                   
                11: begin
                      GoToXY(50, 1);write('Комплексная экспонента');
                      Input(u);
                      ExpC(u, w);
                      GoToXY(50, 15);write('C = '); Output(w);
                      GoToXY(1, 20);clearline;
                      Wait;
                    end;
                   
                12: begin
                    GoToXY(50, 1);write('Комплексный косинус');
                    
                    Input(u);
                    One(v);
                    One(cs);
                    One(s);
                    Mult(u, u, m);
                    a:= 1;
                    k:= 0;
                    
                      while Modul(s) > eps do
                        begin
                          k:= k + 1;
                          a:= a * (-1) / (2 * k) / (2 * k - 1);
                          Mult(v, m, v);
                          Prod(a, v, s);
                          Add(cs, s, cs)
                        end;
                      GoToXY(35, 15);write('Cos(z) = ');    Output(cs);
                      writeln();
                      GoToXY(1, 20);clearline;
                  
                    Wait
                   end;
                   
                13: begin
                    GoToXY(50, 1);write('Комплексный синус');
                  
                    Input(u);
                    One(v);
                    One(s);
                    w:= u;
                    sn:= u;
                    Mult(u, u, m);
                    k:= 0;
                    a:= 1;
                    
                    while Modul(s) > eps do
                        begin
                          k:= k + 1;
                          a:= a * (-1) / (2 * k) / (2 * k + 1);
                          Mult(w, m, w);
                          Prod(a, w, s);
                          Add(sn, s, sn)
                        end;
                      GoToXY(35, 15);write('Sin(z) = ');    Output(sn);
                      writeln();
                      GoToXY(1, 20);clearline;
                      
                    Wait
                    end;
                   
                 0: Ok:= false;
                
              end;
            end;
        end;
end.