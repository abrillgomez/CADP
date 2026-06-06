{ c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
de fecha.}

Program ejercicio2C;

Type 
  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;
  casamiento = Record
    fechaCas: fecha;
  End;

Procedure leerFecha (Var f: fecha);
Begin
  writeln('Ingrese el dia del casamiento: ');
  readln(f.dia);
  writeln('Ingrese el mes del casamiento: ');
  readln(f.mes);
  writeln('Ingrese el anio del casamiento: ');
  readln(f.anio);
End;

Var 
  fCasamiento: fecha;
  casVerano, cas10: integer;

Begin
  casVerano := 0;
  cas10 := 0;
  leerFecha(fCasamiento);
  While (fCasamiento.anio <> 2020) Do
    Begin
      If (fCasamiento.mes<=3) Then
        casVerano := casVerano+1;
      If (fCasamiento.dia<=10) Then
        cas10 := cas10+1;
      leerFecha(fCasamiento);
    End;
  writeln('Cantidad de casamientos realizados en verano: ', casVerano);
  writeln(

      'Cantidad de casamientos realizados en los primeros 10 dias de cada mes: '
          , cas10);
End.
