{ La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda
financiera que se brinda a alumnos de la UNLP. Para ello, esta oficina cuenta con un 
registro detallado de todos los viajes realizados por una muestra de 1300 alumnos 
durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 y 1300), 
día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 
2. colectivo interurbano; 3. tren universitario;  4. tren Roca; 5. bicicleta). Tener 
en cuenta que un alumno puede utilizar más de un medio de transporte en un mismo 
día.
Además, esta oficina cuenta con una tabla con información sobre el precio de
cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los
almacene en una estructura de datos apropiada. La lectura finaliza al ingresarse 
el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día.
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que utilizan bicicleta y colectivo urbano en un mismo día. }

Program ejercicio14;

Type 
  rangoDias = 1..31;
  rangoTransporte = 1..5;

  vectorPrecios = array [rangoTransporte] Of real;

  // Los datos de UN viaje
  viaje = Record
    dia: rangoDias;
    facultad: string;
    medioTransporte: rangoTransporte;
  End;

  // La lista clásica, guarda "viajes"
  lista = ^nodo;
  nodo = Record
    dato : viaje;
    sig : lista;
  End;

  // Vector gigante: nuestra bd. Cada casillero es una lista de viajes.
  vectorViajes = array [1..1300] Of lista;

  vectorDias = array[1..31] Of integer;

  vectorGastos = array[1..31] Of real;

  vectorTransportes = array [1..5] Of integer;

Procedure inicializarVector (Var v: vectorViajes);

Var 
  i: integer;
Begin
  For i:=1 To 1300 Do
    v[i] := Nil;
End;

Procedure cargarPrecios (Var p: vectorPrecios);
Begin
  // Se dispone
End;

Procedure agregarAdelante(Var l: lista; v: viaje);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := v;
  nue^.sig := l;
  l := nue;
End;

Procedure cargarViaje(Var v: vectorViajes);

Var 
  codigo: integer;
  vi: viaje;
Begin
  Readln(codigo);
  While (codigo <> -1) Do
    Begin
      Readln(vi.dia, vi.facultad, vi.medioTransporte);
      agregarAdelante(v[codigo], vi);
      Readln(codigo);
    End;
End;

Procedure procesarViajes (v: vectorViajes; p:vectorPrecios);

Var 
  i, j, alumnos, alumnosSupGastos, max1, max2, transpo1, transpo2, alumnosD: integer;
  dias: vectorDias;
  aux: lista;
  supero, superoGastos, usoBici, usoOtro: boolean;
  gastos: vectorGastos;
  contTransportes: vectorTransportes;

Begin
  alumnos := 0;
  alumnosSupGastos := 0;
  supero := false;
  superoGastos := false;
  max1 := -1;
  max2 := -1;
  alumnosD := 0;

  For j := 1 To 5 Do
    Begin
      contTransportes[j] := 0;
    End;

  For i:=1 To 1300 Do
    Begin
      supero := false;
      superoGastos := false;
      usoBici := false;
      usoOtro := false;

      For j:=1 To 31 Do
        Begin
          dias[j] := 0;
          gastos[j] := 0;
        End;
      aux := v[i];

      While (aux <> Nil) Do
        Begin
          dias[aux^.dato.dia] := dias[aux^.dato.dia] + 1;
          gastos[aux^.dato.dia] := gastos[aux^.dato.dia]+p[aux^.dato.
                                   medioTransporte];
          contTransportes[aux^.dato.medioTransporte] := contTransportes[aux^
                                                        .dato.
                                                        medioTransporte] + 1
          ;

          If (aux^.dato.medioTransporte = 5) Then
            Begin
              usoBici := true;
            End
          Else
            Begin
              usoOtro := true;
            End;

          aux := aux^.sig;
        End;

      For j:=1 To 31 Do
        Begin

          If (dias[j] > 6) Then
            Begin
              supero := true;
            End;

          If (gastos[j] > 80) Then
            Begin
              superoGastos := true;
            End;

        End;

      If (supero = true) Then
        Begin
          alumnos := alumnos + 1;
        End;

      If (superoGastos = true) Then
        Begin
          alumnosSupGastos := alumnosSupGastos + 1;
        End;

      If (usoBici = true) And (usoOtro = true) Then
        Begin
          alumnosD := alumnosD + 1;
        End;

    End;

  For j := 1 To 5 Do
    Begin
      If (contTransportes[j]>max1) Then
        Begin
          max2 := max1;
          transpo2 := transpo1;
          max1 := contTransportes[j];
          transpo1 := j;
        End
      Else If (contTransportes[j]>max2) Then
             Begin
               max2 := contTransportes[j];
               transpo2 := j;
             End;
    End;

  writeln('Alumnos con mas de 6 viajes: ', alumnos);
  writeln('Alumnos que gastan mas de $80: ', alumnosSupGastos);
  writeln('El 1er medio de transporte mas utilizado es: ', transpo1,
          'y el 2ndo es: ', transpo2);
  writeln('Alumnos que combinan bici con otro transporte: ', alumnosD);
End;

Var 
  vViajes: vectorViajes;
  vPrecios: vectorPrecios;
Begin
  cargarPrecios(vPrecios);
  inicializarVector(vViajes);
  cargarViaje(vViajes);
  procesarViajes(vViajes, vPrecios);
End.
