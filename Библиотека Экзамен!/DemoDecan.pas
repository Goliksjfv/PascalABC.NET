Unit DemoDecan;

//2-УРОВНЕВОЕ МЕНЮ(ЛИНЕЙНЫЕ СПИСКИ)

Interface

uses Crt;

Type 
  PtrVertic = ^StackVertic;
    StackVertic = record
      Number: integer;
      Name: string[30];
      Next: PtrVertic;
    end;
    
  PtrHorizon = ^StackHorizon;
    StackHorizon = record
      Number: integer;
      Group: string[10];
      Head: PtrVertic;
      Next:PtrHorizon;
    end;
  
  var Horizon: PtrHorizon;
  
  procedure MakeMenuVertic(var Vertic: PtrVertic);
  procedure MakeMenuHorizon;
  procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
  procedure ChoiceMenuHorizon;
  procedure LevelMenu;

Implementation

  procedure MakeMenuVertic(var Vertic: PtrVertic);
    var Top: PtrVertic;
        Ok: boolean;
        NameValue: string[30];
        k: integer;
    begin
      Ok:= true; Vertic:= Nil; k:= 0;
      while Ok do
        begin
          writeln('Введите фамилию');
          readln(NameValue); k:= k + 1;
          if (NameValue = 'n') or (NameValue = 'т') then Ok:= false
          else
            begin
              New(Top);
              Top^.Next:= Vertic;
              Top^.Number:= k;
              Top^.Name:= NameValue;
              Vertic:= Top;
            end;
        end;
    end;
  
  procedure MakeMenuHorizon;
    var Vertic: PtrVertic;
        Top: PtrHorizon;
        GroupValue: string[10];
        Ok: boolean;
        k: integer;
    begin
      Ok:= true; Horizon:= Nil; k:= 0;
      while Ok do
        begin
          writeln('"n" для отмены');
          writeln('Введите номер группы');
          readln(GroupValue); k:= k + 1;
          if (GroupValue = 'n') or (GroupValue = 'т') then Ok:= false
          else
            begin
              New(Top);
              Top^.Next:= Horizon;
              Top^.Number:= k;
              Top^.Group:= GroupValue;
              MakeMenuVertic(Vertic);
              Top^.Head:= Vertic;
              Horizon:= Top;
            end;
        end;
    end;
    
    
  procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
    var Top: PtrVertic;
        PosX, PosY: integer;
    begin
      Top:= Vertic; PosY:= 2; PosY:= 12 * n - 7;
      while Top <> Nil do
        begin
          PosY:= PosY + 1;
          GoToXY(PosX, PosY); writeln(Top^.Name);
          Top:= Top^.Next;
        end;
    end;


  
  procedure ChoiceMenuHorizon;
    var Top: PtrHorizon;
        n, k: integer;
    begin
      Top:= Horizon; n:= 0;
      while Top <> Nil do
        begin
          n:= n + 1;
          writeln(n: 5, '.', Top^.Group: 6);
          Top:= Top^.Next;
        end;
        GoToXY(20, 42); writeln('Выберите пункт меню');
        GoToXY(45, 42); read(n);
        Top:= Horizon; k:= 1 + Horizon^.Number;
        while(Top^.Number + n <> k) do Top:= Top^.Next;
        PutMenuVertic(Top^.Head, n);
    end;
    
  procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;  
    
  procedure LevelMenu;
      var Mode:integer; Ok:boolean;
    Begin
      Ok:= true;
      while Ok do
        begin
          Clrscr;
          writeln('1: Создать меню');
          writeln('2: Просмотр');
          writeln('0: Выход');
          readln(Mode);
          Clrscr;
          case Mode of
            1: begin 
                Clrscr;
                MakeMenuHorizon;
               end;
               
            2: begin
                Clrscr;
                ChoiceMenuHorizon;
                Wait;
               end;
            0: Ok:= false;
          end
      end
  end;
  
end.
