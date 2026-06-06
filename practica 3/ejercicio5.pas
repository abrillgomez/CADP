{ Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se
lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro. }

Program ejercicio5;

Type 
  auto = Record
    marca: string;
    modelo: string;
    precio: real;
  End;

Procedure leerAuto (Var a: auto);
Begin
  writeln('Ingrese la marca del auto: ');
  readln(a.marca);
  If (a.marca <> 'ZZZ') Then
    Begin
      writeln('Ingrese el modelo del auto: ');
      readln(a.modelo);
      writeln('Ingrese el precio del auto: ');
      readln(a.precio);
    End;
End;

Var 
  a: auto;
  marcaActual, modeloMax, marcaMax: string;
  sumaPrecios, maxPrecio: real;
  cantAutos: integer;

Begin
  maxPrecio := -1.0;
  modeloMax := '';
  marcaMax := '';

  leerAuto(a);
  While (a.marca <> 'ZZZ') Do
    Begin
      marcaActual := a.marca;
      sumaPrecios := 0;
      cantAutos := 0;

      While (a.marca <> 'ZZZ') And (a.marca = marcaActual) Do
        Begin
          sumaPrecios := sumaPrecios+a.precio;
          cantAutos := cantAutos+1;
          If (a.precio > maxPrecio) Then
            Begin
              maxPrecio := a.precio;
              modeloMax := a.modelo;
              marcaMax := a.marca;
            End;
          leerAuto(a);
        End;

      writeln('El precio promedio de la marca ', marcaActual, ' es: $', (
              sumaPrecios / cantAutos): 0: 2);

    End;

  writeln('El auto mas caro es el ', modeloMax, ' de la marca ', marcaMax);
End.
