{ Dado el siguiente programa:
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe
también el nombre del alumno con mejor promedio. }

Program Registros;

Type 
  str20 = string[20];
  alumno = Record
    codigo: integer;
    nombre: str20;
    promedio: real;
  End;
Procedure leer(Var alu : alumno);
Begin
  writeln('Ingrese el codigo del alumno');
  readlnln(alu.codigo);
  If (alu.codigo <> 0) Then
    Begin
      writeln('Ingrese el nombre del alumno');
      readlnln(alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readlnln(alu.promedio);
    End;
End;

Var 
  a: alumno;
  cant: integer;
  mejorPromedio: real;
  alumnoMax: str20;
Begin
  cant := 0;
  mejorPromedio := -1;
  leer(a);
  While (a.codigo <> 0) Do
    Begin
      If (a.promedio > mejorPromedio) Then
        Begin
          mejorPromedio := a.promedio;
          alumnoMax := a.nombre;
        End;
      cant := cant+1;
      leer(a);
    End;
  writeln('Cantidad de alumnos leidos: ', cant);
  writeln('Alumno con mejor promedio: ', alumnoMax);
End.
