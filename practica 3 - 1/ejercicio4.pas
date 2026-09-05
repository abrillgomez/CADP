
{ Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de
cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando
el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a
facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta
$1,35. }

Program ejercicio4A;
const
  CANT_CLIENTES = 9300;
  TOTAL_MINUTOS_COSTO = 3.40;
  TOTAL_MB_COSTO = 1.35;

Type 
  linea = Record
    numero: string;
    minConsumidos: real;
    mbConsumidos: real;
  End;

  // Inciso A 
Procedure leerLinea (Var l: linea);
Begin
  writeln('Ingrese el numero de la linea: ');
  readln(l.numero);
  writeln('Ingrese la cantidad de minutos consumidos de la linea: ');
  readln(l.minConsumidos);
  writeln('Ingrese la cantidad de mb consumidos de la linea: ');
  readln(l.mbConsumidos);
End;

// Inciso B
Procedure leerCliente (Var codigo: integer; Var cantLineas: integer; Var totalMinutos, totalMB: real);
Var 
  i: integer;
  l: linea;
Begin
  writeln('Ingrese el codigo del cliente: ');
  readln(codigo);
  writeln('Ingrese la cantidad de lineas a su nombre: ');
  readln(cantLineas);
  totalMinutos := 0.0;
  totalMB := 0.0;
  For i:= 1 To cantLineas Do
    Begin
      leerLinea(l);
      totalMinutos := totalMinutos + l.minConsumidos;
      totalMB := totalMB + l.mbConsumidos;
    End;
End;

Var 
  i: integer;
  codigo: integer;
  cantLineas: integer;
  totalMinutos, totalMB: real;

Begin
  For i:= 1 To CANT_CLIENTES Do
    Begin
      leerCliente(codigo, cantLineas, totalMinutos, totalMB);
      writeln('El monto total a facturar del cliente ', codigo, ' es de $', (
              totalMinutos * TOTAL_MINUTOS_COSTO) + (totalMB * TOTAL_MB_COSTO): 0: 2);
    End;

End.
