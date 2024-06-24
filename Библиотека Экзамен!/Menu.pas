uses Crt, Compl, CompMatr, VectR, VectC, StackLib, QueueLib, DemoDecan, RecordFiles, MakeFiles, MyTree, BinTree, Exam;
var Mode: integer;
    Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          GoToXY(45, 3);writeln('1: Комплексные числа');
          GoToXY(45, 5);writeln('2: Комплексные матрицы');
          GoToXY(45, 7);writeln('3: Вектора');
          GoToXY(45, 9);writeln('4: Комплексные вектора');
          GoToXY(45, 11);writeln('5: Стэки');
          GoToXY(45, 13);writeln('6: Очереди');
          GoToXY(45, 15);writeln('7: Меню');
          GoToXY(45, 17);writeln('8: Файлы записи');
          GoToXY(45, 19);writeln('9: Текстовые файлы');
          GoToXY(45, 21);writeln('10: Деревья');
          GoToXY(45, 23);writeln('11: Бинарные Деревья');
          GoToXY(45, 25);writeln('12: Экзамен');
          GoToXY(45, 27);writeln('0 Выход');
          GoToXY(40, 29); readln(Mode);
          ClrScr;
            Case Mode of
              1: MenuComplex;
              2: MenuComplexMatrix;
              3: MenuVectR;
              4: MenuVectC;
              5: MenuStack;
              6: MenuQueue;
              7: LevelMenu;
              8: RecordMenu;
              9: StudentsMenu;
              10: MenuTree;
              11: MenuBinTree;
              12: ExamMenu;
              0: Ok:= false
              else
                begin
                  GoToXY(30, 24);
                  writeln('Ошибка! Повторите ввод!');
                  delay(1000);
                end;
            end;
        end;
    end.