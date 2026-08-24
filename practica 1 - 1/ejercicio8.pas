{ Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta);
si se ingresa otro carácter, debe informar un error y finalizar. Una vez leído el carácter 
de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0. 
El programa deberá aplicar la operación leída con la secuencia de números, e imprimir 
el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , 
deberá imprimir: “2” // (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, 
deberá imprimir: “0” // (-10 + 5 + 6 + (-1)) }

Program ejercicio8;

Var 
  operacion: char;
  num, resultado: integer;
Begin
  writeln('Ingrese la operacion');
  readln(operacion);
  If (operacion = '+') Or (operacion = '-') Then
    Begin
      writeln('Ingrese el primer numero');
      readln(resultado);
      writeln('Ingrese el segundo numero');
      readln(num);
      While (num<>0) Do
        Begin
          If (operacion = '+') Then
            resultado := resultado+num
          Else
            resultado := resultado-num;
          writeln('Ingrese el siguiente numero');
          readln(num);
        End;
      writeln(resultado);
    End
  Else
    Begin
      writeln('Error. La operacion no es valida');
    End;
End.
