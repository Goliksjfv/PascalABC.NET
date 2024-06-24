Unit MakeFiles;

//ТЕКСТОВЫЕ ФАЙЛЫ

Interface
uses Crt;

procedure MakeAndAddText;
procedure MyWrite(stroke: string);
procedure ViewText;
procedure BadBoys(Exam: byte);
procedure Heroes;
procedure Veterans;
procedure StudentsMenu;
procedure Wait;

Implementation

procedure MakeAndAddText;
  var ch: char;
      Ok: boolean;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: text;
  
  begin
    writeln('Введите имя файла');
    readln(TextName); Ok:= true;
    GoToXY(1,2); ClearLine;
    assign(StudentText, TextName);
    {$I-} append(StudentText);{$I+}
    if not FileExists(TextName) then rewrite(StudentText);
    while Ok do
      begin
        GoToXY(1,1); writeln('Будете вводить? y/n');
        GoToXY(1,2); readln(ch);
        ClrScr;
        if (ch ='n') or (ch ='т') then
          begin Ok:= false; close(StudentText) end
        else
          begin
            GoToXY(1,1); writeln('Введите фамилию студента');
            GoToXY(1,2); readln(Name);
            GoToXY(1,3); writeln('Введите его оценки');
            GoToXY(1,4); readln(Mark);
            ClrScr;
            write(StudentText, Name: 10, Mark: 3);
          end;
      end;
  end;

procedure MyWrite(stroke: string);
  var result: string;
      i, n: byte;
  begin
    result:= stroke; n:= length(stroke);
    i:= 1;
    while (result[i] = ' ') and (i <= n) do
      i:= i + 1;
    delete(result, 1, i - 1);
    write(result);
  end;
  
procedure ViewText;
  var k: byte;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: text;
  begin
    k:= 3;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-}reset(StudentText);{$I+}
    if not FileExists(TextName) then
      writeln('Файл ', TextName, ' не найден :(')
    else
      begin
        while not EOF(StudentText) do
          begin
            k:= k + 1;
            read(StudentText, Name, Mark);
            GoToXY(1, k); MyWrite(Name);
            GoToXY(12, k); write(Mark);
            writeln();
          end;
          close(StudentText);
      end;
  end;
    
procedure BadBoys(Exam: byte);
  var k: byte;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: text;
  begin
    k:= 3;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-}reset(StudentText);{$I+}
    if not FileExists(TextName) then
      writeln('Файл ', TextName, ' не найден :(')
    else
      begin
        if(Exam = 1) then 
          begin
            GoToXY(1, 2); writeln('Двоечники по матанализу:')
          end;
        if(Exam = 2) then 
          begin
            GoToXY(1, 2); writeln('Двоечники по АиГ:')
          end;
        if(Exam = 3) then 
          begin
            GoToXY(1, 2); writeln('Двоечники по ОП:')
          end;
        while not EOF(StudentText) do
          begin
            k:= k + 1;
            read(StudentText, Name, Mark);
            if Mark[Exam] = '2' then
              begin
                GoToXY(1, k); MyWrite(Name);
              end;
            writeln();
          end;
          close(StudentText);
      end;
  end;
  
procedure Heroes;
  var k: byte;
      i, n: integer;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: text;
  begin
    k:= 3;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-}reset(StudentText);{$I+}
    if not FileExists(TextName) then
      writeln('Файл ', TextName, ' не найден :(')
    else
      while not EOF(StudentText) do
        begin
          k:= k + 1;
          n:= 0;
          read(StudentText, Name, Mark);
          for i:= 0 to length(Mark) do
            begin
              if Mark[i] = '2' then n:= n + 1
            end;
            if n = 2 then
              begin
                GoToXY(1, k); MyWrite(Name)
              end;
          writeln();
        end;
        close(StudentText);
  end;
  
procedure Veterans;
  var k: byte;
      i, n: integer;
      TextName: string[12];
      Name: string[10];
      Mark: string[3];
      StudentText: text;
  begin
    k:= 3;
    writeln('Введите имя файла');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-}reset(StudentText);{$I+}
    if not FileExists(TextName) then
      writeln('Файл ', TextName, ' не найден :(')
    else
      while not EOF(StudentText) do
        begin
          k:= k + 1;
          n:= 0;
          read(StudentText, Name, Mark);
          for i:= 0 to length(Mark) do
            begin
              if Mark[i] = '2' then n:= n + 1
            end;
            if n = 3 then
              begin
                GoToXY(1, k); MyWrite(Name)
              end;
          writeln();
        end;
        close(StudentText);
  end;
  
procedure Wait;
  begin
    repeat until KeyPressed;
      while KeyPressed do ReadKey
  end;
  
procedure StudentsMenu;
  var Mode: integer; Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          GoToXY(50, 1);writeln('Выберетие пункт');
          GoToXY(45, 3);writeln('1:  Создать файл');
          GoToXY(45, 5);writeln('2:  Просмотр файла');
          GoToXY(45, 7);writeln('3:  Двоечнкики по матану');
          GoToXY(45, 9);writeln('4:  Двоечнкики по АиГ');
          GoToXY(45, 11);writeln('5:  Двоечнкики по ОП');
          GoToXY(45, 13);writeln('6:  Герои');
          GoToXY(45, 15);writeln('7:  Ветераны');
          GoToXY(45, 18);writeln('0:  Выход');
          GoToXY(45, 25);readln(Mode);
          ClrScr;
          case Mode of
            1: begin
                ClrScr;
                MakeAndAddText;
               end;
            2: begin
                ClrScr;
                ViewText;
                Wait;
               end;
            3: begin
                ClrScr;
                BadBoys(1);
                Wait;
               end;
            4: begin
                ClrScr;
                BadBoys(2);
                Wait;
               end;
            5: begin
                ClrScr;
                BadBoys(3);
                Wait;
               end;
            6: begin
                ClrScr;
                Heroes;
                Wait;
               end;
            7: begin
                ClrScr;
                Veterans;
                Wait;
               end;
            0: Ok:= false;
          end
       end
    end;
end.