{ Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce 
nro de alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información 
se encuentra ordenada por nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por
parámetro. El alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo
elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector.
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias
en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en
los incisos previos con datos leídos de teclado. }

Program ejercicio4;

Const 
  dimF = 1000;

Type 
  alumno = Record
    numAlumno: integer;
    apellido: string;
    nombre: string;
    asistencias: integer;
  End;

  vectorAlumnos = array [1..dimF] Of alumno;

  // Inciso A
Function buscarAlumno(dimL: integer; v: vectorAlumnos; nroBuscado: integer):integer;

Var 
  pri, ult, medio: integer;
Begin
  pri := 1;
  ult := dimL;
  medio := (pri+ult) Div 2;
  While ((pri<=ult) And (nroBuscado<>v[medio].numAlumno)) Do
    Begin
      If (nroBuscado < v[medio].numAlumno) Then
        Begin
          ult := medio-1;
        End
      Else
        Begin
          pri := medio+1;
        End;
      medio := (pri+ult) Div 2;
    End;
  buscarAlumno := medio;
End;

// Inciso B
Procedure insertarAlumno(Var dimL: integer; Var v: vectorAlumnos; alumnoNuevo:
                         alumno);

Var 
  i, j: integer;
Begin
  i := 1;
  While ((i <= dimL) And (v[i].numAlumno < alumnoNuevo.numAlumno)) Do
    Begin
      i := i+1;
    End;

  For j:=dimL Downto i Do
    Begin
      v[j+1] := v[j];
    End;

  v[i] := alumnoNuevo;
  dimL := dimL+1;

End;

// Inciso C
Procedure eliminarAlumno(Var dimL: integer; Var v: vectorAlumnos;
                         posAlumno: integer);

Var 
  i: integer;
Begin
  For i:=posAlumno To (dimL - 1) Do
    Begin
      v[i] := v[i+1];
    End;
  dimL := dimL-1;
End;

// Inciso D
Procedure eliminarAlumnoPorNro(Var dimL: integer; Var v: vectorAlumnos;
                               nroAlumno: integer);

Var 
  pos: integer;
Begin
  pos := buscarAlumno(dimL, v, nroAlumno);
  eliminarAlumno(dimL, v, pos);
End;

// Inciso E
Procedure eliminarAsistenciasCero(Var dimL: integer; Var v: vectorAlumnos);
Var 
  i: integer;
Begin
  i := 1;
  While (i <= dimL) Do
    Begin
      If (v[i].asistencias = 0) Then
        Begin
          eliminarAlumno(dimL, v, i);
        End
      Else
        Begin
          i := i + 1;
        End;
    End;
End;

Var 
  v: vectorAlumnos;
  dimL, posBuscada, posEliminar, nroBuscado, nroEliminar: integer;
  nuevoAlu: alumno;

Begin
  dimL := 0;

  writeln('Ingrese numero de alumno:');
  readln(nuevoAlu.numAlumno);
  writeln('Ingrese apellido:');
  readln(nuevoAlu.apellido);
  writeln('Ingrese nombre:');
  readln(nuevoAlu.nombre);
  writeln('Ingrese cantidad de asistencias:');
  readln(nuevoAlu.asistencias);

  insertarAlumno(dimL, v, nuevoAlu);
  writeln('Alumno insertado correctamente.');

  If (dimL > 0) Then
    Begin
      writeln('Ingrese el nro de alumno a buscar (asegurese de que exista):');
      readln(nroBuscado);
      posBuscada := buscarAlumno(dimL, v, nroBuscado);
      writeln('El alumno se encuentra en la posicion: ', posBuscada);

      writeln('Ingrese la posicion del vector a eliminar (ej: 1):');
      readln(posEliminar);
      eliminarAlumno(dimL, v, posEliminar);
      writeln('Alumno en posicion ', posEliminar, ' eliminado. Quedan ', dimL,
              ' alumnos.');

      If (dimL = 0) Then
        Begin
          writeln('(El vector quedo vacio, por favor cargue un nro de alumno para probar la eliminacion)'
          );
          readln(nuevoAlu.numAlumno);
          insertarAlumno(dimL, v, nuevoAlu);
        End;

      writeln('Ingrese un Nro de Alumno para eliminar:');
      readln(nroEliminar);
      eliminarAlumnoPorNro(dimL, v, nroEliminar);
      writeln('Alumno con nro ', nroEliminar, ' eliminado.');

      eliminarAsistenciasCero(dimL, v);
      writeln('Se eliminaron todos los alumnos con 0 asistencias.');
      writeln('Cantidad final de alumnos en el sistema: ', dimL);
    End
  Else
    Begin
      writeln('No hay alumnos cargados en el sistema.');
    End;

End.
