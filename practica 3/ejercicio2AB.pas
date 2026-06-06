{ El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el
año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese
año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada
casamiento. 
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
definido en el inciso a. }

Program ejercicio2AB;
// Inciso A

Type 
  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;
  casamiento = Record
    fechaCas: fecha;
  End;
  // Inciso B 
Procedure leerFecha (Var f: fecha);
Begin
  writeln('Ingrese el dia del casamiento: ');
  read(f.dia);
  writeln('Ingrese el mes del casamiento: ');
  read(f.mes);
  writeln('Ingrese el anio del casamiento: ');
  read(f.anio);
End;
