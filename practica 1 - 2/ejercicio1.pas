{ Realizar un programa que lea 10 números enteros e informe la suma total de los
números leídos.}

Program ejercicio1;

Var 
  i, num, resultado: integer;
Begin
  resultado := 0;
  For i:=1 To 10 Do
    Begin
      writeln('Ingrese un numero entero');
      readln(num);
      resultado := resultado+num;
    End;
  writeln('La suma total de los numeros leidos es: ', resultado);
End.
