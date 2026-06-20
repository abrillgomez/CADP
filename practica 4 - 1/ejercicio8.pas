{ Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.
}

Program ejercicio8;

Type 
  alumno = Record
    numInscripcion: integer;
    dni: integer;
    apellido: string;
    nombre: string;
    anioNac: integer;
  End;

  vectorAlumnos = array[1..400] Of alumno;

Procedure leerAlumno(Var alu:alumno);
Begin
  writeln('Ingrese el numero de inscripcion del alumno');
  read(alu.numInscripcion);
  writeln('Ingrese el dni del alumno');
  read(alu.dni);
  writeln('Ingrese el apellido del alumno');
  read(alu.apellido);
  writeln('Ingrese el nombre del alumno');
  read(alu.nombre);
  writeln('Ingrese el anio de nacimiento del alumno');
  read(alu.anioNac);
End;

Procedure cargarVector(Var vAlumnos:vectorAlumnos);
Var 
  i: integer;
Begin
  For i:=1 To 400 Do
    Begin
      leerAlumno(vAlumnos[i]);
    End;
End;

Function soloPares(dni: integer): boolean;
Var 
  digito: integer;
  cumple: boolean;
Begin
  digito := 0;
  cumple := true;
  While ((dni <> 0) And (cumple=true)) Do
    Begin
      digito := dni Mod 10;
      If ((digito Mod 2)<>0) Then
        Begin
          cumple := false;
        End;
      dni := dni Div 10;
    End;
  soloPares := cumple;
End;

Procedure procesarAlumnos(v: vectorAlumnos);
Var 
  i, cantPares, min1, min2: integer;
  ape1, nom1, ape2, nom2: string;
Begin
  cantPares := 0;
  min1 := 9999;
  min2 := 9999;
  ape1 := '';
  nom1 := '';
  ape2 := '';
  nom2 := '';

  For i:=1 To 400 Do
    Begin
      If (soloPares(v[i].dni) = true) Then
        cantPares := cantPares+1;

      If (v[i].anioNac < min1) Then
        Begin
          min2 := min1;
          nom2 := nom1;
          ape2 := ape1;
          min1 := v[i].anioNac;
          nom1 := v[i].nombre;
          ape1 := v[i].apellido;
        End
      Else If (v[i].anioNac < min2) Then
             Begin
               min2 := v[i].anioNac;
               nom2 := v[i].nombre;
               ape2 := v[i].apellido;
             End;
    End;
  writeln('El porcentaje de DNI pares es: ', (cantPares * 100) / 400
  : 0: 2,
       ' %'
       );
  writeln('El alumno de mayor edad es: ', nom1, ' ', ape1);
  writeln('El segundo almuno de mayor edad es: ', nom2, ' ', ape2);
End;

Var 
  ingresantes: vectorAlumnos;
Begin
  cargarVector(ingresantes);
  procesarAlumnos(ingresantes);
End.
