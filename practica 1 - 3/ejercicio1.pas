{ Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000 
Por ejemplo:
- Ingrese un código de empresa: 33
- Ingrese la cant. de inversiones: 4
- Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
- Resultado del análisis: Empresa 33 Monto promedio 31157,71
- Ingrese un código de empresa: 41
- Ingrese la cant. de inversiones: 3
- Ingrese el monto de cada inversión: 102000.22 53000 12000
- Resultado del análisis: Empresa 41 Monto promedio 55666,74
- Ingrese un código de empresa: 100
- Ingrese la cant. de inversiones: 1
- Ingrese el monto de cada inversión: 84000.34
- Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
- La empresa 41 es la que mayor dinero posee invertido ($167000.22).
- Hay 3 empresas con inversiones por más de $50000 }

Program ejercicio1;

Var 
  codigo, cantInversiones, i, codMax, cantMas50k: integer;
  monto, sumaInversiones, promedio, maxMonto: real;
Begin

  cantMas50k := 0;
  codMax := -1;
  maxMonto := -1;

  Repeat
    sumaInversiones := 0;
    writeln('Ingrese el codigo de la empresa');
    readln(codigo);
    writeln('Ingrese la cantidad de inversiones de la empresa');
    readln(cantInversiones);
    For i:=1 To cantInversiones Do
      Begin
        writeln('Ingrese el monto de la inversion');
        readln(monto);
        sumaInversiones := sumaInversiones+monto;
      End;
    promedio := (sumaInversiones/cantInversiones);
    writeln(promedio:0:2);
    If (sumaInversiones > maxMonto) Then
      Begin
        maxMonto := sumaInversiones;
        codMax := codigo;
      End;
    If (sumaInversiones > 50000) Then
      Begin
        cantMas50k := cantMas50k+1;
      End;
  Until  (codigo = 100);
  writeln('La empresa ', codMax, ' es la que mayor dinero posee invertido.');
  writeln('Hay ', cantMas50k, ' empresas con inversiones por mas de $50000.');
End.
