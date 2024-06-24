Unit MyTree;

Interface
uses Crt;

Type NodePtr = ^Node;
     Node = record
     Name: char;
     Left, Right: NodePtr
     end;
     
var Symbol, key: char;
    Ok: boolean;
    Top, Leaf: NodePtr;
    
procedure MenuTree;
procedure Wait;
procedure WayUpDown(Top: NodePtr);
procedure WayDownUp(Top: NodePtr);
procedure WayHoriz(Top: NodePtr; Level: byte);
function High(Top: NodePtr): byte;
procedure ViewTree(Top: NodePtr);
procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
procedure MakeSubTrees(Leaf: NodePtr);
procedure MakeTree(var Top: NodePtr);
procedure AddSubTree(Top: NodePtr);
procedure DeleteSubTree(Top: NodePtr);

Implementation

procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
end;

procedure WayUpDown(Top: NodePtr);
  begin
    if Top <> Nil then
      begin
        write(Top^.Name, ' ');
        WayUpDown(Top^.Left);
        WayUpDown(Top^.Right);
      end;
  end;

procedure WayDownUp(Top: NodePtr);
  begin
    if Top <> Nil then
      begin
        WayDownUp(Top^.Left);
        WayDownUp(Top^.Right);
        write(Top^.Name, ' ');
      end;
  end;
  
procedure WayHoriz(Top: NodePtr; Level: byte);
  begin
    if Top <> Nil then
      if Level = 1 then write(Top^.Name)
      else begin
        WayHoriz(Top^.Left, Level - 1);
        WayHoriz(Top^.Right, Level - 1);
      end;
  end;

function High(Top: NodePtr): byte;
var HighLeft, HighRight: byte;
  begin
    if Top = Nil then High:= 0
    else begin
      HighLeft:= High(Top^.Left);
      HighRight:= High(Top^.Right);
      if HighLeft > HighRight then 
        High:= HighLeft + 1
      else High:= HighRight + 1;
    end;
  end;

procedure ViewTree(Top: NodePtr);
var i, HighTree: byte;
  begin
    HighTree:= High(Top);
    for i:= 1 to HighTree do
      begin
        writeln(' ');
        WayHoriz(Top, i);
      end;
  end;
  
procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
  begin
    if(Top <> Nil) and (Ok = true) then
      begin
        if Symbol = Top^.Name then
          begin
            Ok:= false; Leaf:= Top;
          end
        else begin
          SearchNode(Top^.Left, Leaf);
          SearchNode(Top^.Right, Leaf);
        end;
      end;
  end;

procedure MakeSubTrees(Leaf: NodePtr);
  var Top: NodePtr;
  
  begin
    GoToXY(40, 15); writeln('Введите текущий узел');
    GoToXY(65, 15); readln(Leaf^.Name);
    ClrScr;
    //left SubTree
    GoToXY(40, 15); writeln(Leaf^.Name, '  имеет левое поддерево?');
    GoToXY(55, 17); readln(key);
    ClrScr;
    if key in ['y', 'Y', 'н', 'Н'] then
      begin
        new(Top); Leaf^.Left:= Top;
        MakeSubTrees(Top);
      end
    else Leaf^.Left:= Nil;
    //right subTree
    GoToXY(40, 15); writeln(Leaf^.Name, '  имеет правое поддерево?');
    GoToXY(55, 17); readln(key);
    ClrScr;
    if key in ['y', 'Y', 'н', 'Н'] then
      begin
        new(Top); Leaf^.Right:= Top;
        MakeSubTrees(Top);
      end
    else Leaf^.Right:= Nil;
  end;

procedure MakeTree(var Top: NodePtr);
  begin
    new(Top); MakeSubTrees(Top)
  end;
  
procedure AddSubTree(Top: NodePtr);
  begin
    GoToXY(40, 15); writeln('Введите искомый узел');
    GoToXY(65, 15); readln(Symbol);
    Ok := True; SearchNode(Top, Leaf); ClrScr;
    if Ok = True then
      begin
        GoToXY(45, 15);write('Узел ', Symbol, ' не найден'); Wait
      end
    else
      begin
        GoToXY(35, 15);
        writeln('Желаете построить левое поддерево у ', Leaf^.Name, ' ?');
        GoToXY(40, 17); readln(key);
        ClrScr;
        if key in ['y', 'Y', 'н', 'Н'] then
          if Leaf^.Left <> nil then
            begin
              GoToXY(35, 15);
              writeln('Левое поддерево у ', Leaf^.Name, ' уже есть');
              GoToXY(35, 17); writeln('Все-таки желаете?');
              GoToXY(40, 19); readln(Key);
              ClrScr;
              if Key in ['y', 'Y', 'н', 'Н'] then
                begin
                  MakeTree(Top); Leaf^.Left := Top
                end
            end
          else
            begin
              MakeTree(Top); Leaf^.Left := Top
            end;
          GoToXY(35, 15);
          writeln('Желаете построить правое поддерево у ', Leaf^.Name, ' ?');
          GoToXY(35, 17); readln(Key);
          ClrScr;
          if Key in ['y', 'Y', 'н', 'Н'] then
            if Leaf^.Right <> Nil then
              begin
                GoToXY(35, 15);
                writeln('Правое поддерево у ', Leaf^.Name, ' уже есть');
                GoToXY(35, 17); writeln('Все-таки желаете?');
                GoToXY(30, 19); readln(Key);
                ClrScr;
                if Key in ['y', 'Y', 'н', 'Н'] then
                  begin
                    MakeTree(Top); Leaf^.Right := Top
                  end
              end
            else
              begin
                MakeTree(Top); Leaf^.Right := Top
              end
     end
end;

procedure DeleteSubTree(Top: NodePtr);
  begin
    GoToXY(40, 15); writeln('Введите искомый узел');
    GoToXY(65, 15); readln(Symbol);
    Ok := True; SearchNode(Top, Leaf); ClrScr;
    if Ok = True then
      begin
        GoToXY(40, 15);write('Узел ', Symbol, ' не найден'); Wait; ClrScr;
      end
    else
      begin
        GoToXY(35, 15);
        writeln('Желаете удалить левое поддерево ', Leaf^.Name, ' ?');
        GoToXY(40, 17); readln(Key);
        clrScr;
        if Key in ['y', 'Y', 'н', 'Н'] then
          begin
            GoToXY(35, 15);
            writeln('Действительно желаете удалить левое поддерево?');
            GoToXY(40, 17); readln(Key);
            ClrScr;
            if Key in ['y', 'Y', 'н', 'Н'] then Leaf^.Left := nil
          end;
        GoToXY(35, 15);
        writeln(' Желаете удалить правое поддерево ', Leaf^.Name, ' ?');
        GoToXY(40, 17); readln(Key);
        ClrScr;
        if Key in ['y', 'Y', 'н', 'Н'] then
          begin
            GoToXY(35, 15);
            writeln(' Действительно желаете удалить правое поддерево?');
            GoToXY(40, 17); readln(Key);
            ClrScr;
            if Key in ['y', 'Y', 'н', 'н'] then Leaf^.Right := nil
          end
      end
end;

procedure MenuTree;
var
  Mode: integer;
  Ok: boolean;
  Level: byte;
begin
  Ok := True;
  while Ok do
  begin
    ClrScr;
    GoToXY(50, 1);writeln('Деревья');
    GoToXY(47, 2);writeln('Выбери пункт');
    GoToXY(45, 5);writeln('1: Создать дерево');
    GoToXY(45, 7);writeln('2: Обход сверху вниз');
    GoToXY(45, 9);writeln('3: Обход снизу вверх');
    GoToXY(45, 11);writeln('4: Обход вершин одного уровня');
    GoToXY(45, 13);writeln('5: Высота дерева');
    GoToXY(45, 15);writeln('6: Просмотр дерева');
    GoToXY(45, 17);writeln('7: Добавить поддерево');
    GoToXY(45, 19);writeln('8: Удалить поддерево');
    GoToXY(45, 21);writeln('0: Выход');
    GoToXY(40, 23); readln(Mode);
    ClrScr;
    case Mode of 
      1: MakeTree(Top);
      2:begin
          WayUpDown(Top); 
          Wait
        end;
      3:begin
          WayDownUp(Top);
          Wait
        end;
      4:begin
          GoToXY(30, 18); writeln('Введите уровень');
          GoToXY(40, 19); readln(Level); ClrScr;
          WayHoriz(Top, Level); Wait
        end;
      5:begin
          writeln(High(Top): 2); 
          Wait
        end;
      6:begin
          ViewTree(Top);
          Wait
        end;
      7: AddSubTree(Top);
      8: DeleteSubTree(Top);
      0: Ok := False;
    else
      begin
        GoToXY(2, 22);
        Writeln('Ошибка! Повторите ввод...');
        delay(2000);
      end;
    end;
  end;
end;
end.