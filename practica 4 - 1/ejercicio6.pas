{ Dado que en la solución anterior se recorre dos veces el vector (una para calcular el
elemento máximo y otra para el mínimo), implementar un único módulo que recorra 
una única vez el vector y devuelva ambas posiciones. }

Program ejercicio6;

Procedure recorrer(vNumeros: vectorNumeros; dimL: integer; Var posMax, posMin:
                   integer);

Var 
  i, min, max: integer;
Begin
  min := 9999;
  max := -1;

  For i := 1 To dimL Do
    Begin
      If vNumeros[i] > max Then
        Begin
          max := vNumeros[i];
          posMax := i;
        End;

      If vNumeros[i] < min Then
        Begin
          min := vNumeros[i];
          posMin := i;
        End;
    End;
End;

Var 
Begin

End.
