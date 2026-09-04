{ Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
Por ejemplo: si se lee la secuencia: 3 5 6 2 3 10 98 8 -12 9, deberá informar:
El mayor número leído fue el 98 }

Program ejercicio2;

Var 
  i, num, mayor: integer;
Begin
  writeln('Ingrese un numero');
  readln(num);
  mayor := num;
  For i:=2 To 10 Do
    Begin
      writeln('Ingrese un numero');
      readln(num);
      If (num > mayor) Then
        Begin
          mayor := num;
        End;
    End;
  writeln('El mayor numero leido fue el ', mayor);
End.
