{ a. Modifique el programa anterior para que, además de informar el mayor número
leí Do, se informe el
número de orden, dentro de la secuencia, en el que fue leí Do.
Por ejemplo: si se lee la misma secuencia: 3 5 6 2 3 10 98 8 -12 9, deberá informar:
 - El mayor número leído fue el 98, en la posición 7}

Program ejercicio2A;

Var 
  i, num, mayor, pos: integer;
Begin
  writeln('Ingrese un numero');
  readln(num);
  mayor := num;
  pos := 1;
  For i:=2 To 10 Do
    Begin
      writeln('Ingrese un numero');
      readln(num);
      If (num > mayor) Then

        Begin
          mayor := num;
          pos := i;

        End;
    End;
  writeln('El mayor numero leido fue el ', mayor, ', en la posicion ', pos);
End.
