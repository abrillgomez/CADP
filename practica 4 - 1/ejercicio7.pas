{ Realizar un programa que lea números enteros desde teclado hasta que se ingrese
el valor -1 (que no debe procesarse) e informe:
a. La cantidad de ocurrencias de cada dígito procesado.
b. El dígito más leído.
c. Los dígitos que no tuvieron ocurrencias.
Por ejemplo: si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
  - Número 3: 2 veces
  - Número 4: 2 veces
  - Número 6: 2 veces
  - Número 9: 4 veces
  - El dígito más leído fue el 9.
  - Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8 }

Program ejercicio7;

Type 
  vectorContador = array[0..9] Of integer;

Procedure contador(Var v: vectorContador);

Var 
  i, num, digito: integer;
Begin
  For i := 0 To 9 Do
    Begin
      v[i] := 0;
    End;

  readln(num);

  While (num <> -1) Do
    Begin
      While (num <> 0) Do
        Begin
          digito := num Mod 10;
          // Atrapo el último dígito suelto (Ej: de 63, saca el 3)
          v[digito] := v[digito] + 1;
          num := num Div 10;
          // Recorto el número para la próxima vuelta (Ej: el 63 pasa a ser 6)
        End;
      readln(num);
    End;

End;

Procedure informarResultados(v: vectorContador);

Var 
  i, max, digitoMax: integer;
Begin
  max := -1;
  digitoMax := 0;

  For i:= 0 To 9 Do
    Begin
      If v[i] > 0 Then
        Begin
          // Imprimimos la cantidad (Inciso A)
          writeln('Número ', i, ': ', v[i], ' veces');

          // Evaluamos si es el nuevo máximo (Inciso B)
          If v[i] > max Then
            Begin
              max := v[i];
              digitoMax := i;
            End;
        End
      Else
        Begin
          // Imprimimos los que nunca aparecieron (Inciso C)
          writeln('El dígito ', i, ' no tuvo ocurrencias');
        End;
    End;

  // Informamos el ganador afuera del bucle
  writeln('El digito mas leido fue el ', digitoMax);
End;

Var 
Begin
End.
