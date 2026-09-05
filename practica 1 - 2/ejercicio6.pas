{ Realizar un programa que lea información de 200 productos de un supermercado.
De cada producto se lee
código y precio (cada código es un número entre 1 y 200). Informar en
pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.}

Program ejercicio6;

Var 
  i, codigo, codMin1, codMin2, cant: integer;
  precio, min1, min2: real;
Begin
  cant := 0;
  min1 := 99999;
  min2 := 99999;

  For i:=1 To 200 Do
    Begin
      writeln('Ingrese el codigo del producto (1 a 200):');
      readln(codigo);
      writeln('Ingrese el precio del producto:');
      readln(precio);

      If (precio < min1) Then
        Begin
          min2 := min1;
          codMin2 := codMin1;
          min1 := precio;
          codMin1 := codigo;
        End
      Else If (precio < min2) Then
             Begin
               min2 := precio;
               codMin2 := codigo;
             End;

      If (precio > 16) And (codigo Mod 2 = 0) Then
        cant := cant + 1;
    End;

  writeln('Los codigos de los dos productos mas baratos son: ', codMin1, ' y ',
          codMin2);
  writeln('Cantidad de productos de mas de 16 pesos con codigo par: ', cant);
End.
