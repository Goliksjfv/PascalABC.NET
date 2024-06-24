Unit StackLib;
Interface
Uses Crt;
Type Ptr = ^Stak;
  Stak = record
    Inf: integer;
    Next: Ptr;
  end;
  var Top, Top2, Kon, Kon2: Ptr; value: integer;
  
  procedure MakeStack;
  procedure AddStack;
  procedure ViewStack;
  procedure DleteStackElem;
  procedure DleteStack;
  procedure ReverseStack;
  procedure LinkStack;
  procedure Wait;
  procedure MenuStack;
  
Implementation
  
  procedure MakeStack;
    var Ok: boolean;
      begin
        Ok:= true; Top:= Nil;
        while Ok do
          begin
            writeln('Введите число');
            readln(value);
            if value = 999 then Ok:= false else
              begin
                New(Kon);
                Kon^.Inf:= value;
                Kon^.Next:= Top;
                Top:= Kon
              end;
          end;
      end;
  
  procedure AddStack;
    var Ok: boolean;
      begin
        Ok:= true;
        while Ok do
          begin
            writeln('Добавьте число');
            readln(value);
            
            if value = 999 then Ok:= false else
              begin
                New(Kon);
                Kon^.Inf:= value;
                Kon^.Next:= Top;
                Top:= Kon;
              end;
          end;
      end;
   
  procedure ViewStack;
    begin
      Kon:= Top;
      while Kon <> Nil do
        begin
          writeln(Kon^.Inf);
          Kon:= Kon^.Next;
        end;
    end;

  procedure DleteStackElem;
    begin
      Top:= Top^.Next;
    end;
    
  procedure DleteStack;
    begin
      Top:= Nil;
    end;
  
  procedure ReverseStack;
   var
    Top2: Ptr;
      begin
        Kon:= Top;
        Top2:= Nil;
        while Kon <> Nil do
          begin
            Top:= Top2;
            New(Top2);
            Top2^.Next:= Top;
            Top2^.Inf:= Kon^.Inf;
            Kon:= Kon^.Next;
          end;
        Top:= Top2;
      end;
  
  procedure LinkStack;
    begin
      Top2:= Top;
      MakeStack;
      Kon:= Top;
      while Kon^.Next <> Nil do
        begin
          Kon:= Kon^.Next;
        end;
      Kon^.Next:= Top2;
    end;
    
  procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;
    
  Procedure MenuStack;
    var Mode:integer; Ok:boolean;
    Begin
      Ok:= true;
      while Ok do
        begin
          Clrscr;
          writeln('Стек');
          writeln('1: Создание');
          writeln('2: Добавление');
          writeln('3: Просмотр');
          writeln('4: Удаление элемента стэка');
          writeln('5: Удаление стэка');
          writeln('6: Совместить стеки');
          writeln('0: Выход');
          readln(Mode);
          Clrscr;
          case Mode of
            1: begin 
                Clrscr; MakeStack;
                write('Создано');
                Wait;
               end;
               
            2: begin
                Clrscr;
                AddStack;
                write('Добавлено');
                Wait;
               end;
               
            3: begin
                Clrscr;
                ViewStack;
                Wait; 
               end;
               
            4: begin
                Clrscr;
                DleteStackElem;
               end;
               
            5: begin
                ClrScr;
                DleteStack;
               end;
               
            6: begin
                ClrScr;
                LinkStack;
               end;
            0: Ok:= false;
            
          end
      end
  end;
end.