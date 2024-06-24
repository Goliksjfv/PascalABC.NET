uses Crt,Biblioteka;

var
  a, b, c: CVector;

begin
  writeln('Введите вектор а: ');
  InputCVectorOne(a);
  writeln('Введите вектор b: ');
  InputCVectorTwo(b);
  AddCVector(a, b, c);
  writeln('Сумма векторов a и b:');
  OutputCVector(c);
end.