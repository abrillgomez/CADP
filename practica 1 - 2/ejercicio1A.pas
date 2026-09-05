{ a.Modifique el ejercicio 1 para que además informe la cantidad de números
mayores a 5.}

Program ejercicio1A;
Var 
  i,num, resultado, cantMay: integer;

Begin
  resultado := 0;
  cantMay := 0;

  For i:=1 To 10 Do
    Begin
      writeln('Ingrese un numero');
      readln(num);
      resultado := resultado+num;
      If (num > 5) Then
        Begin
          cantMay := cantMay+1;
        End;
    End;

  writeln('Suma total de los numeros leidos: ', resultado);
  writeln('Cantidad de numeros leidos mayores a 5: ', cantMay);
End.
