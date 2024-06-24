unit BinTree;

interface

Uses Crt;

type
  NodePtr = ^Node;
  Node = record
    Key: byte;
    Left, Right: NodePtr;
  end;

var
  Top, Root: NodePtr; Level: byte;

procedure MakeNode(NewKey: byte; var Top: NodePtr);
procedure MakeBTree(var Top: NodePtr);
procedure BUpDown(Top: NodePtr);
procedure BDownUp(Top: NodePtr);
function BHigh(Top: NodePtr): byte;
procedure BHoriz(Top: NodePtr; level: byte); 
procedure ViewBTree(Top: NodePtr);
procedure BeautifulViewBT(Top: NodePtr; x, y: byte);
function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
procedure DeleteSubTree(Top: NodePtr);
procedure MenuBinTree;

implementation

procedure Wait;
begin
  repeat until Keypressed;
  while Keypressed do readKey;
end;

procedure MenuBinTree;
  var
    Ok: boolean;
    Mode: integer;
    x, y: byte;
begin
  Ok := True;
  while Ok do
  begin
    Clrscr;
    GoToXY(55, 1);writeln('Бинарные деревья');
    GoToXY(55, 2);writeln('Выберите пункт');
    GoToXY(50, 5);writeln('1: Создание дерева');
    GoToXY(50, 7);writeln('2: Просмотр дерева');
    GoToXY(50, 9);writeln('3: Красивый просмотр дерева');
    GoToXY(50, 11);writeln('4: Обход сверху-вниз');
    GoToXY(50, 13);writeln('5: Обход снизу-вверх');
    GoToXY(50, 15);writeln('6: Просмотр этажа');
    GoToXY(50, 17);writeln('7: Удаление');
    GoToXY(50, 19);writeln('0: Выход');
    GoToXY(40, 25);readln(Mode);
    ClrScr;
    case Mode of
      1:begin
          Clrscr; 
          MakeBTree(Root); 
          Wait
        end;
      2:begin
          Clrscr; 
          ViewBTree(Root);
          Wait
        end;
      3:begin
          Clrscr;
          y := 1; x := 30;
          BeautifulViewBT(Root, x, y);
          Wait
        end;
      4:begin
          Clrscr;
          BUpDown(Root);
          Wait
        end;
      5:begin
          Clrscr;
          BDownUp(Root);
          Wait
        end;
      6:begin
          Clrscr; 
          GoToXY(30, 5);
          writeln('Введите этаж:');
          GoToXY(43, 5); 
          readln(Level);
          BHoriz(Root, Level);
          Wait
        end;
      7:begin
          Clrscr; 
          DeleteSubTree(Root); 
          Wait
        end;
      0: ok := False;
    else
      begin
        GoToXY(30, 21);
        writeln('Ошибка!Повторите Ввод');
        Wait
      end
    end
  end
end;


procedure MakeNode(NewKey: byte; var Top: NodePtr);
  begin
    if Top = nil then 
      begin
        New(Top); Top^.Key := NewKey;
        Top^.Left := nil; Top^.Right := nil;
      end
    else
      if NewKey < Top^.Key then
        MakeNode(NewKey, Top^.Left)
      else
        MakeNode(NewKey, Top^.Right);
  end;

procedure MakeBTree(var Top: NodePtr);
  var
      i, n, InputKey: byte;
      Key: char;
  begin
    GoToXY(30, 2); writeln('Авто ввод? (Y/N)');
    GoToXY(35, 3); readln(Key); ClrScr;
    if Key in ['y', 'Y', 'н', 'Н'] then 
      begin
        GoToXY(30, 2); writeln('Количество ветвей:');
        GoToXY(48, 2); readln(n); ClrScr; Top := nil;
        for i := 1 to n do
          begin
            InputKey := random(2 * n);
            MakeNode(InputKey, Top);
          end
      end
   else 
     begin
      GoToXY(30, 2); writeln('Количество ветвей:');
      GoToXY(48, 2); readln(n); ClrScr; Top := nil;
      for i := 1 to n do
        begin
          GoToXY(30, 2); writeln('Значение (', i, '/', n, ') ветки:');
          GoToXY(51, 2); readln(InputKey); ClrScr;
          MakeNode(InputKey, Top);
        end
     end
end;

procedure BUpDown(Top: NodePtr);
  begin
    if Top <> nil then 
      begin
        write(Top^.Key:4);
        BUpDown(Top^.Right);
        BUpDown(Top^.Left);
      end
  end;

procedure BDownUp(Top: NodePtr);
  begin
    if Top <> nil then 
      begin
        BDownUp(Top^.Right);
        BDownUp(Top^.Left);
        write(Top^.Key:4);
      end
  end;

function BHigh(Top: NodePtr): byte;
var
  HighLeft, HighRight: byte;
  begin
    if Top = Nil then BHigh := 0
    else 
      begin
        HighLeft := BHigh(Top^.left);
        HighRight := BHigh(Top^.Right);
        if HighLeft > HighRight then
          BHigh := HighLeft + 1
        else
          BHigh := HighRight + 1;
      end
  end;

procedure BHoriz(Top: NodePtr; Level: byte);
  begin
    if Top <> Nil then
      if Level = 1 then write(Top^.Key)
      else 
        begin
          BHoriz(Top^.Left, Level - 1);
          BHoriz(Top^.Right, Level - 1);
        end
end;

procedure BeautifulViewBT(Top: NodePtr; x, y: byte);
  begin
    GoToXY(x, y); inc(y, 2);
    write(Top^.Key);
    if Top^.Left <> nil then
      begin
        GoToXY(x - 1, y - 1); write('/');
        BeautifulViewBT(Top^.Left, x - 2, y);
      end;
    if Top^.Right <> nil then
      begin
        GoToXY(x + 1, y - 1); write('\');
        BeautifulViewBT(Top^.Right, x + 2, y);
      end
end;

procedure ViewBTree(Top: NodePtr);
var i, HighTree: byte;
  begin
    HighTree := BHigh(Top);
    for i := 1 to HighTree do
      begin
        writeln;
        BHoriz(Top, i);
      end
end;

function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
  begin
    if Top = Nil then 
      SearchNode := Nil
    else if Top^.Key = SearchKey then SearchNode := Top
    else if SearchKey < Top^.Key then
      SearchNode := SearchNode(Top^.Left, SearchKey)
    else SearchNode := SearchNode(Top^.Right, SearchKey);
end;

procedure DeleteSubTree(Top: NodePtr);
var Tmp: NodePtr; DeleteKey: byte;
  begin
    GoToXY(30, 2); writeln('Удаляемая ветка:');
    GoToXY(46, 2); readln(DeleteKey); ClrScr;
    Tmp := SearchNode(Top, DeleteKey);
    if Tmp <> nil then 
      begin
        Tmp^.Left := nil;
        Tmp^.Right := nil;
      end;
  end;
End.
