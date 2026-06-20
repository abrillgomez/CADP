

{ Se dispone de un vector con números enteros, de dimensión física dimF y
dimensión lógica dimL.
a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b. Realizar un módulo que imprima el vector desde la última posición hasta la
primera.
c. Realizar un módulo que imprima el vector desde la mitad (dimL Div 2) hacia la
primera posición, y desde la mitad más uno hacia la última posición.
d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e
imprima el vector desde la posición X hasta la Y. Asuma que tanto X como Y son menores o 
iguales a la dimensión lógica. Y considere que, dependiendo de los valores de X e Y, 
podría ser necesario recorrer hacia adelante o hacia atrás.
e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los
incisos a, b y c. }

Program ejercicio3;

{ inciso A }
Procedure imprimirVector (vNumeros: vectorNumeros; dimL: integer);
Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln(vNumeros[i]);
    End;
End;

{ inciso B }
Procedure imprimirVectorUlt (vNumeros: vectorNumeros; dimL: integer);
Var 
  i: integer;
Begin
  For i:=dimL Downto 1 Do
    Begin
      writeln(vNumeros[i]);
    End;
End;

{ inciso C }
Procedure mitad(vNumeros: vectorNumeros; dimL: integer);
Var 
  i, resultado, masUno: integer;
Begin
  resultado := dimL Div 2;
  masUno := resultado + 1;

  For i := resultado Downto 1 Do
    Begin
      writeln(vNumeros[i]);
    End;

  For i := masUno To dimL Do
    Begin
      writeln(vNumeros[i]);
    End;
End;

{ inciso D }
Procedure posiciones(vNumeros: vectorNumeros; dimL, x, y: integer);

Var 
  i: integer;
Begin
  If x <= y Then
    Begin
      For i :=x To y Do
        Begin
          writeln(vNumeros[i]);
        End;
    End
  Else
    Begin
      For i :=x Downto y Do
        Begin
          writeln(vNumeros[i]);
        End;
    End;
End;

{ inciso E }
Procedure imprimirVectorE (vNumeros: vectorNumeros; dimL: integer);
Begin
  posiciones(vNumeros, dimL, 1, dimL);
End;

Procedure imprimirVectorUltE (vNumeros: vectorNumeros; dimL: integer);
Begin
  posiciones(vNumeros, dimL, dimL, 1);
End;

Procedure mitadE(vNumeros: vectorNumeros; dimL: integer);
Var 
  resultado, masUno: integer;
Begin
  resultado := dimL Div 2;
  masUno := resultado + 1;

  posiciones(vNumeros, dimL, resultado, 1);
  posiciones(vNumeros, dimL, masUno, dimL);
End;

{ programa principal }
var
Begin
End.
