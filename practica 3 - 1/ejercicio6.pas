{ Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,
Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
(que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core), cuyos relojes alcancen velocidades de al menos 2
Ghz. }

Program ejercicio6;

Type 
  microprocesador = Record
    marca: string;
    linea: string;
    cantCores: integer;
    velReloj: real;
    tamTransistores: integer;
  End;

Procedure leerMicroprocesador (Var m: microprocesador);
Begin
  writeln('Ingrese la cantidad de cores del microprocesador: ');
  readln(m.cantCores);
  If (m.cantCores <> 0) Then
    Begin
      writeln('Ingrese la marca del microprocesador: ');
      readln(m.marca);
      writeln('Ingrese la linea del microprocesador: ');
      readln(m.linea);
      writeln('Ingrese la velocidad del reloj del microprocesador: ');
      readln(m.velReloj);
      writeln('Ingrese el tamanio de los transistores del microprocesador: ');
      readln(m.tamTransistores);
    End;
End;

Var 
  m: microprocesador;
  marcaActual, marcaMax1, marcaMax2: string;
  max1, max2, cant14nm, cantMulticore: integer;

Begin
  max1 := -1;
  max2 := -1;
  cantMulticore := 0;
  // cant. de procesadores multicore de la empresa
  marcaMax1 := '';
  marcaMax2 := '';

  leerMicroprocesador(m);

  While (m.cantCores<>0) Do
    Begin
      marcaActual := m.marca;
      cant14nm := 0;
      // cant. de procesadores de 14nm tiene cada marca por separado

      While (m.cantCores<>0) And (m.marca=marcaActual) Do
        Begin
          If (m.CantCores > 2) And (m.tamTransistores<=22) Then
            writeln('Marca: ', m.marca, ' y linea: ', m.linea);

          If (m.tamTransistores = 14) Then
            cant14nm := cant14nm+1;

          If (m.cantCores > 1) And (m.velReloj >= 2) Then
            cantMulticore := cantMulticore+1;
          leerMicroprocesador(m);
        End;

      If (cant14nm > max1) Then
        Begin
          max2 := max1;
          marcaMax2 := marcaMax1;
          max1 := cant14nm;
          marcaMax1 := marcaActual;
        End
      Else If (cant14nm > max2) Then
             Begin
               max2 := cant14nm;
               marcaMax2 := marcaActual;
             End;
    End;

  writeln('Las dos marcas con mas procesadores de 14nm son: ', marcaMax1,' y ',
          marcaMax2);
  writeln('Cantidad total de procesadores multicore rapidos: ', cantMulticore);

End.
