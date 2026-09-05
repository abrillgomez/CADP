{ Realizar un programa que lea números enteros desde teclado. La lectura debe
finalizar cuando se ingrese el
número 100, el cual debe procesarse. Informar en pantalla:
● El número máximo leído.
● El número mínimo leído.
● La suma total de los números leídos.}

Program ejercicio5;

Var 
  num, max, min, suma: integer;
Begin
  suma := 0;
  max := -9999;
  min := 9999;

  Repeat
    writeln('Ingrese un numero:');
    readln(num);
    suma := suma + num;
    If (num > max) Then
      max := num;

    If (num < min) Then
      min := num;

  Until (num = 100);

  writeln('El numero maximo leido fue: ', max);
  writeln('El numero minimo leido fue: ', min);
  writeln('La suma total de los numeros leidos es: ', suma);
End.
