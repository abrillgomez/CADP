{ Un local de ropa desea analizar las ventas realizadas en el último mes. Para
ello se lee por cada día del mes, los montos de las ventas realizadas. La lectura de montos para cada día
finaliza cuando se lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el
monto total acumulado en ventas de todo el mes. }

Program ejercicio8;

Var 
  dia, cantVentasDia: integer;
  monto, montoTotalMes: real;
Begin
  montoTotalMes := 0;

  For dia := 1 To 31 Do
    Begin
      cantVentasDia := 0;
      writeln('Ingrese el monto de la venta (0 para terminar):');
      readln(monto);

      While (monto <> 0) Do
        Begin
          cantVentasDia := cantVentasDia + 1;
          montoTotalMes := montoTotalMes + monto;

          writeln('Ingrese el monto de otra venta (0 para terminar):');
          readln(monto);
        End;

      writeln('Cantidad de ventas del dia ', dia, ': ', cantVentasDia);
    End;
  writeln('El monto total acumulado en ventas de todo el mes es: $',
          montoTotalMes:0:2);
End.
