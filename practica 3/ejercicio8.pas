{ La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el
programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el
docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el
nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La
información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar
un programa que lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no
debe procesarse), e informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada
localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e
impares. }

Program ejercicio8;

Type 
  docenteCoordinador = Record
    dni: string;
    nombre: string;
    apellido: string;
    email: string;
  End;
  proyecto = Record
    codigo: integer;
    titulo: string;
    docente: docenteCoordinador;
    cantAlumnos: integer;
    escuela: string;
    localidad: string;
  End;

Function igualParesImpares(num: integer): boolean;

Var 
  digito, pares, impares: integer;
Begin
  pares := 0;
  impares := 0;

  While (num<>0) Do
    Begin
      digito := num Mod 10;
      If (digito Mod 2 = 0) Then
        pares := pares+1
      Else
        impares := impares+1;
      num := num Div 10;
    End;

  igualParesImpares := (pares = impares);
End;

Function textoEscuela(cant: integer): string;
Begin
  If (cant = 1) Then
    textoEscuela := 'escuela'
  Else
    textoEscuela := 'escuelas';
End;

Procedure leerProyecto (Var p: proyecto);
Begin
  writeln('Ingrese el codigo del proyecto');
  readln(p.codigo);
  If (p.codigo <> -1) Then
    Begin
      writeln('Ingrese el titulo del proyecto');
      readln(p.titulo);
      writeln('Ingrese el dni del docente a cargo');
      readln(p.docente.dni);
      writeln('Ingrese el nombre del docente a cargo');
      readln(p.docente.nombre);
      writeln('Ingrese el apellido del docente a cargo');
      readln(p.docente.apellido);
      writeln('Ingrese el email del docente a cargo');
      readln(p.docente.email);
      writeln('Ingrese la cantidad de alumnos');
      readln(p.cantAlumnos);
      writeln('Ingrese el nombre de la escuela');
      readln(p.escuela);
      writeln('Ingrese la localidad de la escuela');
      readln(p.localidad);
    End;
End;

Var 
  p: proyecto;
  locActual, escActual, maxEsc1, maxEsc2: string;
  cantTotalEsc, cantEscLoc, cantAluEsc, max1, max2: integer;

Begin
  cantTotalEsc := 0;
  max1 := -1;
  max2 := -1;
  maxEsc1 := '';
  maxEsc2 := '';

  leerProyecto(p);

  While (p.codigo <> -1) Do
    Begin
      locActual := p.localidad;
      cantEscLoc := 0;
      // se resetea por cada localidad nueva

      // --- Localidad ---
      While (p.codigo <> -1) And (p.localidad = locActual) Do
        Begin
          escActual := p.escuela;
          cantAluEsc := 0;
          // se resetea por cada escuela nueva

          // --- Escuela ---
          While (p.codigo <> -1) And (p.localidad = locActual) And (p.escuela =
                escActual) Do
            Begin
              cantAluEsc := cantAluEsc+p.cantAlumnos;
              If (p.localidad = 'Daireaux') And (igualParesImpares(p.codigo))
                Then
                writeln('Proyecto destacado de Daireaux: ', p.titulo);

              leerProyecto(p);
            End;

          cantEscLoc := cantEscLoc+1;
          cantTotalEsc := cantTotalEsc+1;

          If (cantAluEsc>max1) Then
            Begin
              max2 := max1;
              maxEsc2 := maxEsc1;
              max1 := cantAluEsc;
              maxEsc1 := escActual;
            End
          Else If (cantAluEsc>max2) Then
                 Begin
                   max2 := cantAluEsc;
                   maxEsc2 := escActual;
                 End;
        End;

      // --- Termino de leer todas las escuelas de ESA localidad
      writeln('En ', locActual,' hay ', cantEscLoc, ' ', textoEscuela(cantEscLoc
      ), '.');

    End;

  writeln('Cantidad total de escuelas: ', cantTotalEsc);
  writeln('Las dos escuelas con mas alumnos son: ', maxEsc1,' y ', maxEsc2);

End.
