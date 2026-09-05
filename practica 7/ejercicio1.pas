{ Una productora nacional realiza un casting de personas para la selección de
actores extras de una nueva película, para ello se debe leer y almacenar la 
información de las personas que desean participar de dicho casting. De cada 
persona se lee: DNI, apellido y nombre, edad y el código de género de actuación 
que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que
impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI 
puede no existir. Invocar dicho módulo en el programa principal.}

Program ejercicio1;

Type 

  codigoGenero = 1..5;

  persona = Record
    dni: integer;
    apellido: string;
    nombre: string;
    edad: integer;
    codigo: codigoGenero;
  End;

  lista = ^nodo;

  nodo = Record
    dato: persona;
    sig: lista;
  End;

  vectorGeneros = array [1..5] Of integer;

Procedure leerPersona (Var p: persona);
Begin
  readln(p.dni, p.apellido, p.nombre, p.edad, p.codigo);
End;

Procedure agregarAdelante (Var l: lista; p: persona);

Var 
  nuevoNodo: lista;
Begin
  new(nuevoNodo);
  nuevoNodo^.dato := p;
  nuevoNodo^.sig := l;
  l := nuevoNodo;
End;


Procedure cargarLista (Var l: lista);

Var 
  p: persona;
Begin
  Repeat
    leerPersona(p);
    agregarAdelante(l, p);
  Until (p.dni = 33555444)
End;

Function digitosPares (dni: integer): boolean;

Var 
  digito, contPares, contImpares: integer;
Begin
  contPares := 0;
  contImpares := 0;
  While (dni <> 0) Do
    Begin
      digito := dni Mod 10;
      If (digito Mod 2 = 0) Then
        Begin
          contPares := contPares+1;
        End
      Else
        Begin
          contImpares := contImpares+1;
        End;
      dni := dni Div 10;
    End;

  If contPares > contImpares Then
    digitosPares := true
  Else
    digitosPares := false;
End;

Procedure procesarLista (l: lista);

Var 
  aux: lista;
  i, cont, max1, max2, codMax1, codMax2: integer;
  v: vectorGeneros;
Begin
  cont := 0;
  max1 := -1;
  max2 := -1;
  codMax1 := 0;
  codMax2 := 0;

  For i:=1 To 5 Do
    Begin
      v[i] := 0;
    End;

  aux := l;

  While (aux <> Nil) Do
    Begin
      If (digitosPares(aux^.dato.dni) = true) Then
        Begin
          cont := cont+1;
        End;

      v[aux^.dato.codigo] := v[aux^.dato.codigo]+1;
      aux := aux^.sig;
    End;

  For i:=1 To 5 Do
    Begin
      If (v[i] > max1) Then
        Begin
          codMax2 := codMax1;
          max2 := max1;
          max1 := v[i];
          codMax1 := i;
        End
      Else If (v[i]>max2) Then
             Begin
               max2 := v[i];
               codMax2 := i;
             End;

    End;

  writeln('Cantidad de personas que tienen mas digitos pares que impares: ',
          cont);
  writeln('Los dos codigos de generos mas elegidos son: ', codMax1,' y ',
          codMax2);

End;

Procedure eliminarDni (Var l: lista; dni: integer);

Var 
  act, ant: lista;
Begin
  act := l;
  While (act <> Nil) And (act^.dato.dni <> dni) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act <> Nil) Then
    Begin
      If (act = l) Then
        l := l^.sig
      Else
        ant^.sig := act^.sig;
      dispose(act);
    End;
End;

Var 
  l: lista;
  dniEliminado: integer;
Begin
  l := Nil;
  cargarLista(l);
  procesarLista(l);
  readln(dniEliminado);
  eliminarDni(l, dniEliminado);
End.
