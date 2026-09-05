{ Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos.
Recordar: las fórmulas para el cálculo de volumen (V) del cilindro y del paralelepipedo rectangular son:
- V=π.r².h
- V=A.B.C }


Program ejercicio3;

Var 
  tipo: char;
  ancho, largo, alto, radio, volumen: real;
  sumaVolCilindros, sumaVolRectangulos: real;
  max1_vol, max2_vol: real;
  cantCilindros, cantRectangulos, cantMenor140: integer;

Begin
  sumaVolCilindros := 0;
  sumaVolRectangulos := 0;
  cantCilindros := 0;
  cantRectangulos := 0;
  cantMenor140 := 0;
  max1_vol := -1;
  max2_vol := -1;

  writeln('Ingrese el tipo de tanque (R para Rectangular, C para Cilindrico, Z para salir):');
  readln(tipo);

  While (tipo <> 'Z') Do
    Begin
      If (tipo = 'R') Then
        Begin
          writeln('Ingrese el ancho, largo y alto del tanque rectangular:');
          readln(ancho);
          readln(largo);
          readln(alto);
          volumen := ancho * largo * alto;
          sumaVolRectangulos := sumaVolRectangulos + volumen;
          cantRectangulos := cantRectangulos + 1;
        End
      Else If (tipo = 'C') Then
             Begin
               writeln('Ingrese el radio y alto del tanque cilindrico:');
               readln(radio);
               readln(alto);
               volumen := Pi * radio * radio * alto;
               sumaVolCilindros := sumaVolCilindros + volumen;
               cantCilindros := cantCilindros + 1;
             End;

      If (alto < 1.40) Then
        cantMenor140 := cantMenor140 + 1;

      If (volumen > max1_vol) Then
        Begin
          max2_vol := max1_vol;
          max1_vol := volumen;
        End
      Else If (volumen > max2_vol) Then
             Begin
               max2_vol := volumen;
             End;

      writeln('Ingrese el tipo de siguiente tanque (R, C, o Z para salir):');
      readln(tipo);
    End;

  writeln('El mayor volumen vendido es: ', max1_vol:0:2);
  writeln('El segundo mayor volumen vendido es: ', max2_vol:0:2);

  If (cantCilindros > 0) Then
    writeln('Volumen promedio de tanques cilindricos: ', (sumaVolCilindros /cantCilindros): 0: 2)
  Else
    writeln('No se ingresaron tanques cilindricos.');

  If (cantRectangulos > 0) Then
    writeln('Volumen promedio de tanques rectangulares: ', (sumaVolRectangulos /cantRectangulos): 0: 2)
  Else
    writeln('No se ingresaron tanques rectangulares.');

  writeln('Cantidad de tanques con alto menor a 1.40 metros: ', cantMenor140);

End.

