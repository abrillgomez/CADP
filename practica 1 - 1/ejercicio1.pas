{ Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos
números es el mayor. Si son iguales debe informar en pantalla lo siguiente: "Los números leídos son iguales" }

Program ejercicio1;

Var 
  num1, num2: integer;

Begin

  write('Ingrese el primer numero:');
  readln(num1);
  write('Ingrese el segundo numero:');
  readln(num2);
  If (num1 > num2) Then
    write('El numero mayor es: ', num1)
  Else If (num2 > num1) Then
         write('El numero mayor es: ', num2)
  Else
    write('Los numeros leidos son iguales');
End.
