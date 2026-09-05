{ Una empresa de transporte de caudales desea optimizar el servicio que brinda a
sus clientes. Para ello, cuenta con información sobre todos los viajes realizados 
durante el mes de marzo. De cada viaje se cuenta con la siguiente información: 
día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida 
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo
200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, 
que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
  - El monto promedio transportado de los viajes realizados.
  - La distancia recorrida y el día del mes en que se realizó el viaje que
  transportó menos dinero.
  - La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los
viajes cuya distancia recorrida sea igual a 100 km. 
Nota: para realizar el inciso b, el vector debe recorrerse una única vez. }

Program ejercicio3;

Const 
  dimF = 200;

Type 
  diaDelMes = 1..31;

  viaje = Record
    dia: diaDelMes;
    monto: real;
    distancia: integer;
  End;

  vectorViajes = array [1..dimF] Of viaje;


// Inciso A 
Procedure leerUnViaje(Var v: viaje);
Begin
  writeln('Ingrese la distancia del viaje');
  readln(v.distancia);
  If (v.distancia <> 0) Then
    Begin
      writeln('Ingrese el dia del mes en el que se realizo el viaje');
      readln(v.dia);
      writeln('Ingrese el monto de dinero transportado');
      readln(v.monto);
    End;
End;

Procedure leerViajes(Var dimL: integer; Var v: vectorViajes);
Var 
  viajeActual: viaje;
Begin
  dimL := 0;
  leerUnViaje(viajeActual);
  While ((viajeActual.distancia <> 0) And (dimL<dimF)) Do
    Begin
      dimL := dimL+1;
      v[dimL] := viajeActual;
      leerUnViaje(viajeActual);
    End;
End;

// Inciso B
Procedure procesarViajes(dimL: integer; v: vectorViajes);
Var 
  promedio, sumaMontos, montoMin: real;
  i, distMin, diaMin: integer;
  vDias: array[diaDelMes] Of integer;

Begin
  sumaMontos := 0;
  montoMin := 9999;
  For i:=1 To 31 Do
    Begin
      vDias[i] := 0;
    End;

  For i:=1 To dimL Do
    Begin
      sumaMontos := sumaMontos+v[i].monto;
      If (v[i].monto < montoMin) Then
        Begin
          montoMin := v[i].monto;
          distMin := v[i].distancia;
          diaMin := v[i].dia;
        End;
      vDias[v[i].dia] := vDias[v[i].dia]+1;
    End;

  If (dimL > 0) Then
    Begin
      promedio := sumaMontos/dimL;
      writeln('El monto promedio transportado de los viajes realizados es: ',
              promedio: 0: 2);
    End
  Else
    Begin
      writeln('Error: no se registraron viajes para calcular el promedio.')

    End;
  writeln('El viaje con menos dinero fue el dia: ', diaMin,
          ' y la distancia fue de: ', distMin);
  For i:=1 To 31 Do
    Begin
      writeln('El dia ', i,' hubo ', vDias[i],' viajes');
    End;
End;

// Inciso C
Procedure eliminarViajes(Var dimL: integer; Var v:vectorViajes);
Var 
  i, j: integer;
Begin
  i := 1;
  While (i <= dimL ) Do
    Begin
      If (v[i].distancia = 100) Then
        Begin
          For j:=i To (dimL-1) Do
            Begin
              v[j] := v[j+1];
            End;
          dimL := dimL-1;
        End
      Else
        Begin
          i := i+1;
        End;
    End;
End;

Var 
  viajes: vectorViajes;
  dimL: integer;

Begin
  // Inciso A: Cargar los viajes
  leerViajes(dimL, viajes);

  // Verificamos que se haya cargado al menos un viaje válido
  If (dimL > 0) Then
    Begin
      // Inciso B: Procesar e informar promedios, mínimos y conteo por días
      procesarViajes(dimL, viajes);

      // Inciso C: Eliminar viajes de exactamente 100 km
      eliminarViajes(dimL, viajes);

      writeln('Limpieza finalizada con exito.');
      writeln('La nueva cantidad total de viajes almacenados es: ', dimL);
    End
  Else
    Begin
      // Si el primer ingreso fue 0
      writeln('No se registraron viajes validos en el sistema. Fin del programa.');
    End;
End.
