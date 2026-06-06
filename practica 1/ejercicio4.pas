{ Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales.
La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, en cuyo
caso deberá informarse: No se ha ingresado el doble de X }

Program ejercicio4;

Var 
  num1, num2, aux: real;
  cant: integer;

Begin
  write('Ingrese un numero real:');
  read(num1);
  aux := num1 * 2;
  cant := 1;
  write('Ingrese otro numero real:');
  read(num2);

  While (num2 <> aux) And (cant<10) Do
    Begin
      read(num2);
      cant := cant + 1;
    End;

  If (num2 <> aux) Then
    write('No se ha ingresado el doble de X');
End.
