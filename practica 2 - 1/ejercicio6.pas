{ a. Realice un módulo que lea de teclado números enteros hasta que llegue un
valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a. }

Program ejercicio6_practica2;

// Inciso A
Procedure parMasAlto;

Var 
  num, maxPar: integer;
Begin
  maxPar := -1;
  writeln('Ingrese un numero entero (ingrese un negativo para finalizar):');
  readln(num);
  While (num >= 0) Do
    Begin
      If (num Mod 2 = 0) And (num > maxPar) Then
        maxPar := num;
      writeln('Ingrese otro numero entero (negativo para finalizar):');
      readln(num);
    End;
  If (maxPar <> -1) Then
    writeln('El numero par mas alto fue: ', maxPar)
  Else
    writeln('No se ingresaron numeros pares.');
End;

// Inciso B
Begin
  parMasAlto;
End.
