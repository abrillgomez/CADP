{ Realizar un programa que lea tres caracteres, e informe si los tres eran letras
vocales o si al menos uno de ellos no lo era.
Por ejemplo:
○ Si se leen los caracteres “a e o”, deberá informar: Los tres son vocales
○ Si se leen los caracteres “z a g”, deberá informar: Al menos un carácter no era vocal }

Program ejercicio7;

Var 
  letra: char;
  i, cantVocales: integer;
Begin
  cantVocales := 0;

  For i:=1 To 3 Do
    Begin
      writeln('Ingrese la letra');
      readln(letra);

      If (letra = 'a') Or (letra = 'e') Or (letra = 'i') Or (letra = 'o') Or (
         letra = 'u') Or
         (letra = 'A') Or (letra = 'E') Or (letra = 'I') Or (letra = 'O') Or (
         letra = 'U') Then
        Begin
          cantVocales := cantVocales + 1;
        End;
    End;

  If (cantVocales = 3) Then
    writeln('Los tres son vocales')
  Else
    writeln('Al menos un caracter no era vocal');
End.
