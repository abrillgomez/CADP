{ Modificar la solución del punto anterior considerando que el programa lea y almacene la información
de a lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}

Program ejercicio9;

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
  writeln('Ingrese el dni del alumno');
  readln(alu.dni);
  If (alu.dni <> -1 ) Then
    Begin
      writeln('Ingrese el numero de inscripcion del alumno');
      readln(alu.numInscripcion);
      writeln('Ingrese el apellido del alumno');
      readln(alu.apellido);
      writeln('Ingrese el nombre del alumno');
      readln(alu.nombre);
      writeln('Ingrese el anio de nacimiento del alumno');
      readln(alu.anioNac);
    End;
End;

Procedure cargarVector(Var vAlumnos:vectorAlumnos; Var dimL: integer);

Var 
  a: alumno;
Begin
  dimL := 0;
  leerAlumno(a);
  While ((a.dni <> -1 ) And (dimL<400)) Do
    Begin
      dimL := dimL+1;
      vAlumnos[dimL] := a;
      If (dimL<400 ) Then
        leerAlumno(a);
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

Procedure procesarAlumnos(v: vectorAlumnos, Var dimL: integer);

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

  For i:=1 To dimL Do
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

  If (dimL > 0) Then
    writeln('El porcentaje de DNI pares es: ', (cantPares * 100) / dimL
    : 0: 2,
         ' %'
         );
  writeln('El alumno de mayor edad es: ', nom1, ' ', ape1);
  writeln('El segundo almuno de mayor edad es: ', nom2, ' ', ape2);
End;

Var 
  ingresantes: vectorAlumnos;
  dimLogica: integer;
Begin
  cargarVector(ingresantes, dimLogica);
  If (dimLogica > 0) Then
    procesarAlumnos(ingresantes, dimLogica)
  Else
    writeln('No se ingresaron alumnos.');
End.
