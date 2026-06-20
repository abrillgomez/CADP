{ Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número
X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero }

Program ejercicio2;

Var 
  num: real;

Begin
  write('Ingrese un numero real:');
  read(num);
  If (num < 0) Then
    write(-num:0:2)
  Else
    write(num:0:2);
End.
