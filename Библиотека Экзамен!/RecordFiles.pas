Unit RecordFiles;

Interface

uses Crt;

Type Student = record
    name: string[10];
    mark: string[3];
  end;

procedure MakeFile;
procedure AddFile;
procedure ViewFile;
procedure Wait;
procedure RecordMenu;
  
Implementation

  procedure MakeFile;
    var ch: char;
        Ok: boolean;
        FileName: string[12];
        StudentFile: File of Student;
        FlowStudent: Student;
    begin
      Ok:= true;
      writeln('Имя файла');
      readln(FileName);
      assign(StudentFile, FileName);
      rewrite(StudentFile);
        with FlowStudent do 
          while Ok do
            begin
              GoToXY(30, 10); writeln('Будете еще выводить? y/n');
              GoToXY(30, 11); readln(ch);
              GoToXY(30, 11); ClearLine;
              if ch = 'n' then
                begin
                  Ok:= false;
                  close(StudentFile);
                end
              else
                begin
                  GoToXY(30, 20); writeln('Введите фамилию');
                  GoToXY(30, 21); readln(Name);
                  GoToXY(30, 21); ClearLine;
                  GoToXY(30, 22); writeln('Введите оценки');
                  GoToXY(30, 23); readln(Mark);
                  GoToXY(30, 23);ClearLine;
                  write(StudentFile, FlowStudent);
                end;
            end;
    end;
    
   procedure AddFile;
    var ch: char;
    Ok: boolean;
    FileName, NewName: string[12];
    StudentFile, NewFile: file of Student;
    FlowStudent: Student;
      begin
        Ok:= true;
        writeln('Введите имя файла');
        readln(FileName);
        assign(StudentFile, FileName);
        reset(StudentFile);
        NewName:= 'AddStud';
        assign(NewFile, NewName);
        rewrite(NewFile);
          while not EOF(StudentFile) do
            begin
              read(StudentFile, FlowStudent);
              write(NewFile, FlowStudent);
            end;
          with FlowStudent do
            while Ok do
              begin
                GoToXy(30, 10); writeln('Будете вводить? y/n');
                GoToXy(30, 11); readln(ch);
                GoToXy(30, 11); ClearLine;
                if ch = 'n' then
                  begin
                    Ok:= false; close(NewFile);
                  end
                  else
                    begin
                      Clrscr;
                      GoToXY(1,1);
                      writeln('Введите фамилию студента');
                      GoToXY(1,2);
                      Readln(Name); Clrscr;
                      GoToXY(1,1);
                      Writeln('Введите его оценки');
                      GoToXY(1,2);
                      Readln(Mark); Clrscr;
                      Write(NewFile, FlowStudent);
                    end;
                    close(StudentFile);
                    erase(StudentFile);
                    rename(NewFile, FileName);
              end;
      end;
      
    procedure ViewFile;
      var k: integer;
          ch: char;
          FileName: string[12];
          StudentFile: file of Student;
          FlowStudent: Student;
      begin
        k:= 1;
        writeln('Введите имя файла');
        readln(FileName);
        assign(StudentFile, FileName);
        reset(StudentFile);
        with FlowStudent do
          while not EOF (StudentFile) do
          begin
            k:= k + 1;
            read(StudentFile, FlowStudent);
            GoToXY(1,k); write(Name);
            GoToXY(11,k); write(Mark);
          end;
          close(StudentFile);
      end;
      
      procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;
      
      procedure RecordMenu;
  var Mode: integer; Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          GoToXY(50, 1);writeln('Выберетие пункт');
          GoToXY(45, 3);writeln('1:  Создать файл');
          GoToXY(45, 5);writeln('2:  Добавить в файл');
          GoToXY(45, 7);writeln('3:  Просмотр файла');
          GoToXY(45, 18);writeln('0:  Выход');
          GoToXY(45, 25);readln(Mode);
          ClrScr;
          case Mode of
            1: begin
                ClrScr;
                MakeFile;
               end;
            2: begin
                ClrScr;
                AddFile;
                Wait;
               end;
            3: begin
                ClrScr;
                ViewFile;
                Wait;
               end;
            0: Ok:= false;
          end
       end
    end;
    
 end.