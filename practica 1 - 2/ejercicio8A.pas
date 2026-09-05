{ a. Modifique el ejercicio anterior para que además informe el día en el que se
realizó la mayor cantidad de ventas}

Program ejercicio8A;

Var 
  dia, cantVentasDia, maxVentas, diaMax: integer;
  monto, montoTotalMes: real;
Begin
  montoTotalMes := 0;
  maxVentas := -1;

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
      If (cantVentasDia > maxVentas) Then
        Begin
          maxVentas := cantVentasDia;
          diaMax := dia;
        End;
    End;

  writeln('El monto total acumulado en ventas de todo el mes es: $',
          montoTotalMes:0:2);
  writeln('El dia con mayor cantidad de ventas fue el dia ', diaMax, ' con ',
          maxVentas, ' ventas.');
End.
