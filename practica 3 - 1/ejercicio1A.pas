{ Dado el siguiente programa:
a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e
informe la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que
no debe procesarse. Nota: utilizar el módulo leer. }

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
  readln(alu.codigo);
  If (alu.codigo <> 0) Then
    Begin
      writeln('Ingrese el nombre del alumno');
      readln(alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readln(alu.promedio);
    End;
End;

Var 
  a: alumno;
  cant: integer;
Begin
  cant := 0;
  leer(a);
  While (a.codigo <> 0) Do
    Begin
      cant := cant+1;
      leer(a);
    End;
  writeln('Cantidad de alumnos leidos: ', cant);
End.
