{ Realice un programa que resuelva los siguientes incisos:
  a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
  cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
  b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
  c. Lea un nombre y lo inserte en la posición 4 del vector.
  d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

Program ejercicio2;

Const 
  dimF = 500;

Type 
  alumno = string;
  vectorAlumnos = array[1..dimF] Of alumno;

  // Inciso A
Procedure cargarVector(Var v:vectorAlumnos; Var dimL:integer);
Var 
  nombre: string;
Begin
  dimL := 0;
  writeln('Ingrese el nombre del alumno');
  readln(nombre);
  While ((nombre <> 'ZZZ') And (dimL < dimF)) Do
    Begin
      dimL := dimL+1;
      v[dimL] := nombre;
      writeln('Ingrese el nombre del alumno');
      readln(nombre);
    End;
End;

// Inciso B
Procedure eliminarNombre(Var v:vectorAlumnos; Var dimL: integer; nomBuscado:
                         String);

Var 
  pos, i: integer;
Begin
  pos := 1;
  While ((pos <= dimL) And (v[pos] <> nomBuscado)) Do
    Begin
      pos := pos+1;
    End;

  If (pos<=dimL) Then
    Begin
      For i:=pos To (dimL-1) Do
        Begin
          v[i] := v[i+1];
        End;
      dimL := dimL-1;
    End;
End;

// Inciso C
Procedure insertarNombre(Var v: vectorAlumnos; Var dimL: integer; nombreNuevo:
                         String);

Var 
  i: integer;
Begin
  If (dimL < dimF) Then
    Begin
      For i:=dimL Downto 4 Do
        Begin
          v[i+1] := v[i];
        End;
      v[4] := nombreNuevo;
      dimL := dimL+1;
      writeln('Alumno insertado con éxito en la posición 4.');
    End
  Else
    Begin
      writeln('Error: El vector está lleno...');
    End;

End;

// Inciso D
Procedure agregarNombre(Var v: vectorAlumnos; Var dimL: integer; nombreNuevo:
                        String);
Begin
  If (dimL < dimF) Then
    Begin
      dimL := dimL+1;
      v[dimL] := nombreNuevo;
    End
  Else
    Begin
      writeln('Error: no hay espacio para agregar mas alumnos.')
    End;
End;


Var 
  v: vectorAlumnos;
  dimL: integer;
  nombreBuscado, nombreInsertar, nombreAgregar: string;

Begin
  // Inciso A: Cargar el vector
  cargarVector(v, dimL);

  // Verificamos que se hayan cargado datos antes de procesar el resto
  If (dimL > 0) Then
    Begin
      // Inciso B: Eliminar nombre
      writeln('Ingrese el nombre del alumno que desea eliminar:');
      readln(nombreBuscado);
      eliminarNombre(v, dimL, nombreBuscado);

      // Inciso C: Insertar nombre en pos 4
      writeln('Ingrese el nombre del alumno a insertar:');
      readln(nombreInsertar);
      insertarNombre(v, dimL, nombreInsertar);

      // Inciso D: Agregar nombre al final
      writeln('Ingrese el nombre del alumno a agregar:');
      readln(nombreAgregar);
      agregarNombre(v, dimL, nombreAgregar);

      writeln('Programa finalizado. La cantidad final de alumnos es: ', dimL);
    End
  Else
    Begin
      writeln('No se ingresaron alumnos. Fin del programa.');
    End;
End.
