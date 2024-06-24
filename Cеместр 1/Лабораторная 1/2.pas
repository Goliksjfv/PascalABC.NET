var x,y: real;
Begin
read(x);
if (x>0.5) then y:=1/x else
if (x<-0.5) then y:=1/x else 
y:=4*x;
write(y);
End.