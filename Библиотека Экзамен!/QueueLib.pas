Unit QueueLib;
Interface
Uses Crt;
Type Ptr = ^Queu;
  Queu = record
    Inf: integer;
    Next: Ptr;
  end;
  
  var Left, Right, Top: Ptr; value: integer;
  
  Procedure MenuQueue;
  procedure MakeQueue;
  procedure AddQueue;
  procedure ViewQueue;
  procedure DeleteElem;
  procedure DeleteQueue;
  procedure Wait;
  
Implementation

  procedure MakeQueue;
    var Ok: boolean;
      begin
        Ok:= true;
        writeln('Введите число');
        readln(value);
        New(Top);
          if value = 999 then 
            begin
              Ok:= false;
              Top^.Next:= Nil;
            end;
            
            Top^.Inf:= value;
            Right:= Top;
            Left:= Top;
            while Ok do
              begin
                writeln('Введите число');
                readln(value);
                if value = 999 then
                  begin
                    Ok:= false; Top^.Next:= Nil;
                  end
                  else
                    begin
                      New(Top);
                      Right^.Next:= Top;
                      Top^.Inf:= value;
                      Right:= Top;
                    end;
              end;
      end;
  
  procedure AddQueue;
    var Ok: boolean;
      begin
        Ok := true;
        while Ok do
          begin
            writeln('Добавить элемент');
            readln(value);
            if value = 999 then 
              begin
                Ok := false;
                Top^.Next := Nil;
              end
            else
              begin
                New(Top);
                Right^.Next := Top;
                Top^.Inf := value;
                Right := Top;
              end;
          end;
      end;
  
  procedure ViewQueue;
    begin
      Right:= Left;
      while Right <> Nil do
        begin
          writeln(Right^.Inf);
          Right:= Right^.Next;
        end;
    end;
    
  procedure DeleteElem;
    begin
      Left := Left^.Next;
    end;
 
  procedure DeleteQueue;
    begin
      Left := Nil;
    end;
      
  procedure Wait;
        begin
          repeat until KeyPressed;
            while KeyPressed do ReadKey
        end;
        
        
  Procedure MenuQueue;
    var Mode:integer; Ok:boolean;
    Begin
      Ok:= true;
      while Ok do
        begin
          Clrscr;
          writeln('Стек');
          writeln('1: Создание');
          writeln('2: Добавить элементы в очередь');
          writeln('3: Просмотр очереди');
          writeln('4: Удаление элемента');
          writeln('5: Удаление Очереди');
          writeln('0: Выход');
          readln(Mode);
          Clrscr;
          case Mode of
            1: begin 
                Clrscr; MakeQueue;
                writeln('Создано');
                Wait;
               end;
               
            2: begin 
                Clrscr; AddQueue;
                writeln('Добавленно');
                Wait;
               end;
               
            3: begin 
                Clrscr;
                writeln('Очередь:');
                ViewQueue;
                Wait;
               end;
            
            4: begin 
                Clrscr;
                DeleteElem;
               end;
               
            5: begin 
                Clrscr;
                DeleteQueue;
               end;
               
            0: Ok:= false;
            
          end
      end
  end;
end.