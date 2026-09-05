{ Realizar un programa que lea desde teclado información de autos de carrera.
Para cada uno de los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En
la carrera participaron 100
autos. Informar en pantalla:
● Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
● Los nombres de los dos pilotos que finalizaron en los dos últimos puestos. }

Program ejercicio7;

Var 
  i: integer;
  nombre, nomMin1, nomMin2, nomMax1, nomMax2: string;
  tiempo, min1, min2, max1, max2: real;
Begin
  min1 := 99999;
  min2 := 99999;
  max1 := 0;
  max2 := 0;

  For i:=1 To 100 Do
    Begin
      writeln('Ingrese el nombre del piloto:');
      readln(nombre);
      writeln('Ingrese el tiempo total:');
      readln(tiempo);

      If (tiempo < min1) Then
        Begin
          min2 := min1;
          nomMin2 := nomMin1;
          min1 := tiempo;
          nomMin1 := nombre;
        End
      Else If (tiempo < min2) Then
             Begin
               min2 := tiempo;
               nomMin2 := nombre;
             End;

      If (tiempo > max1) Then
        Begin
          max2 := max1;
          nomMax2 := nomMax1;
          max1 := tiempo;
          nomMax1 := nombre;
        End
      Else If (tiempo > max2) Then
             Begin
               max2 := tiempo;
               nomMax2 := nombre;
             End;
    End;

  writeln('Primeros puestos: 1ro ', nomMin1, ' y 2do ', nomMin2);
  writeln('Ultimos puestos: Ultimo ', nomMax1, ' y Anteultimo ', nomMax2);
End.
