{ El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs.
As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO
para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único
de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se
pide implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por
UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
cantidad de alumnos y la cantidad de docentes). }

Program ejercicio3;

Type 
  escuela = Record
    cue: integer;
    nombre: string;
    cantDocentes: integer;
    cantAlumnos: integer;
    localidad: string;
  End;

  // Inciso A
Procedure leerEscuela (Var e: escuela);
Begin
  writeln('Ingrese el CUE: ');
  readln(e.cue);
  writeln('Ingrese el nombre del establecimiento: ');
  readln(e.nombre);
  writeln('Ingrese la cantidad de docentes: ');
  readln(e.cantDocentes);
  writeln('Ingrese la cantidad de alumnos: ');
  readln(e.cantAlumnos);
  writeln('Ingrese la localidad: ');
  readln(e.localidad);
End;

// Inciso B
Function relacion(docente, alumno: integer): real;
Begin
  relacion := alumno / docente;
End;

Var 
  i, cantLaPlata: integer;
  e: escuela;
  min1, min2, relActual: real;
  cueMin1, cueMin2: integer;
  estMin1, estMin2: string;

Begin
  min1 := 9999.0;
  min2 := 9999.0;
  cantLaPlata := 0;
  cueMin1 := 0;
  estMin1 := '';

  For i:= 1 To 2400 Do
    Begin
      leerEscuela(e);
      relActual := relacion(e.cantDocentes, e.cantAlumnos);

      If (e.localidad = 'La Plata') And (relActual > 23.435) Then
        cantLaPlata := cantLaPlata + 1;

      If (relActual < min1) Then
        Begin
          min2 := min1;
          cueMin2 := cueMin1;
          estMin2 := estMin1;

          min1 := relActual;
          cueMin1 := e.cue;
          estMin1 := e.nombre;
        End
      Else If (relActual < min2) Then
             Begin
               min2 := relActual;
               cueMin2 := e.cue;
               estMin2 := e.nombre;
             End;

    End;

  writeln('Cantidad de escuelas de La Plata que superan a UNESCO: ', cantLaPlata
  );
  writeln('Mejor relacion 1 - CUE: ', cueMin1, ' establecimiento: ', estMin1);
  writeln('Mejor relacion 2 - CUE: ', cueMin2, ' establecimiento: ', estMin2);
End.
