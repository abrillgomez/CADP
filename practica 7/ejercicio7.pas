{ La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso y las
notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el alumno
con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a cada alumno
deben quedar ordenadas de forma descendente. 
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
    a. El promedio de notas obtenido por cada alumno.
    b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente
    por dígitos impares.
    c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se
    recibieron (o sea, que tardaron menos años).
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la
estructura generada en el inciso 1. El alumno puede no existir. }

Program ejercicio7;

Type 

  vectorNotas = array [1..24] Of integer;

  alumno = Record
    numAlumno: integer;
    apellido: string;
    nombres: string;
    correo: string;
    anioIngreso: integer;
    anioEgreso: integer;
    notas: vectorNotas;
  End;

  lista = ^nodo;

  nodo = Record
    dato: alumno;
    sig: lista;
  End;

  // Inciso 1
Procedure insertarOrdenado (Var v: vectorNotas; Var dimL: integer; nota: integer
);

Var 
  pos, j: integer;
Begin
  pos := 1;
  While ((pos <= dimL) And (v[pos] > nota)) Do
    Begin
      pos := pos + 1;
    End;

  For j:=dimL Downto pos Do
    Begin
      v[j+1] := v[j];
    End;

  v[pos] := nota;
  dimL := dimL+1;
End;

Procedure leerAlumno (Var a: alumno);

Var 
  i, nota, dimL: integer;
Begin
  readln(a.numAlumno);
  If (a.numAlumno <> -1) Then
    Begin
      readln(a.apellido, a.nombres, a.correo, a.anioIngreso, a.anioEgreso);
      dimL := 0;
      For i := 1 To 24 Do
        Begin
          readln(nota);
          insertarOrdenado(a.notas, dimL, nota);
        End;
    End;
End;

Procedure agregarAdelante(Var l: lista; a: alumno);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := a;
  nue^.sig := l;
  l := nue;
End;

Procedure cargarLista(Var l: lista);

Var 
  a: alumno;
Begin
  leerAlumno(a);
  While (a.numAlumno <> -1) Do
    Begin
      agregarAdelante(l, a);
      leerAlumno(a);
    End;
End;

// Inciso 2
Function soloImpares(num: integer): boolean;

Var 
  digito: integer;
  cumple: boolean;
Begin
  cumple := true;

  While ((num <> 0) And (cumple = true)) Do
    Begin
      digito := num Mod 10;

      If ((digito Mod 2) = 0) Then
        Begin
          cumple := false;
        End
      Else
        Begin
          num := num Div 10;
        End;
    End;
  soloImpares := cumple;
End;

Procedure procesarLista(l: lista);

Var 
  i, suma, cont, tiempo, min1, min2: integer;
  ape1, ape2, nom1, nom2, correo1, correo2: string;
Begin
  cont := 0;
  min1 := 9999;
  min2 := 9999;
  While (l <> Nil) Do
    Begin
      suma := 0;
      For i:= 1 To 24 Do
        Begin
          suma := suma + l^.dato.notas[i];
        End;
      writeln('El promedio del alumno es de: ', suma/24:0:2);
      If ((l^.dato.anioIngreso = 2012) And (soloImpares(l^.dato.numAlumno)))
        Then
        Begin
          cont := cont + 1;
        End;
      tiempo := l^.dato.anioEgreso - l^.dato.anioIngreso;
      If (tiempo < min1) Then
        Begin
          min2 := min1;
          ape2 := ape1;
          nom2 := nom1;
          correo2 := correo1;
          min1 := tiempo;
          ape1 := l^.dato.apellido;
          nom1 := l^.dato.nombres;
          correo1 := l^.dato.correo;
        End
      Else If (tiempo < min2) Then
             Begin
               min2 := tiempo;
               ape2 := l^.dato.apellido;
               nom2 := l^.dato.nombres;
               correo2 := l^.dato.correo;
             End;

      l := l^.sig;
    End;
  writeln('Alumnos del 2012 con legajo impar: ', cont);
  writeln('1er puesto: ', ape1, ' ', nom1, ' - ', correo1);
  writeln('2do puesto: ', ape2, ' ', nom2, ' - ', correo2);
End;

// Inciso 3
Procedure eliminarAlumno(Var l: lista; numEliminar: integer);

Var 
  act, ant: lista;
Begin
  act := l;
  While (act <> Nil) And (act^.dato.numAlumno <> numEliminar) Do
    Begin
      ant := act;
      act := act^.sig;
    End;

  If (act <> Nil) Then
    Begin
      If (act = l) Then
        Begin
          l := l^.sig;
        End
      Else
        Begin
          ant^.sig := act^.sig;
        End;
      dispose(act);
    End;
End;

Var 
  l: lista;
  numAEliminar: integer;
Begin
  l := Nil;

  // Inciso 1
  cargarLista(l);

  // Inciso 2
  procesarLista(l);

  // Inciso 3
  writeln('Ingrese el numero de alumno que desea eliminar');
  readln(numAEliminar);
  eliminarAlumno(l, numAEliminar);
End.
