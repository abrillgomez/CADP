{ Dado el siguiente programa, complete las líneas indicadas, considerando que:
  a.El módulo cargarVector debe leer números reales y almacenarlos en el vector
  que se pasa como
  parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La
  lectura finaliza cuando se
  ingresa el valor 0 (que no debe procesarse) o cuando el vector está completo.
  b. El módulo modificarVectorySumar debe devolver el vector con todos sus elementos
  incrementados
  con el valor n y también debe devolver la suma de todos los elementos del
  vector. }

Program Vectores;

Const 
  cant_datos = 150;

Type 
  vdatos = array[1..cant_datos] Of real;

Procedure cargarVector(Var v:vdatos; Var dimL : integer);

Var 
  num: real;
Begin
  readlnln(num);
  While ((num <> 0) And (dimL< cant_datos)) Do
    Begin
      dimL := dimL+1;
      v[dimL] := num;
      readlnln(num);
    End;
End;

Procedure modificarVectorySumar(Var v:vdatos; dimL : integer; n: real; Var suma:
                                real);
Var 
  i: integer;
Begin
  suma := 0;
  For i := 1 To dimL Do
    Begin
      v[i] := v[i]+n;
      suma := suma + v[i];
    End;
End;

{ programa principal }
Var 
  datos : vdatos;
  i, dim : integer;
  num, suma : real;
Begin
  dim := 0;
  suma := 0;
  cargarVector(datos, dim);
  writeln('Ingrese un valor a sumar');
  readlnln(num);
  modificarVectorySumar(datos, dim, num, suma);
  writeln('La suma de los valores es: ', suma);
  writeln('Se procesaron: ',dim, ' números')
End.
