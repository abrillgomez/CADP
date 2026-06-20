{ Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se ingrese
uno cuyo valor sea exactamente el doble de X (el primer número leído). }

Program ejercicio3;

Var 
  num1, num2, aux: real;

Begin
  write('Ingrese un numero real:');
  read(num1);
  aux := num1 * 2;
  write('Ingrese otro numero real:');
  read(num2);

  While (num2 <> aux) Do
    read(num2);
End.
