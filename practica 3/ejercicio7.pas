{ Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por
universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios. }


Program ejercicio7;

Type 
  centro = Record
    nombAbrev: string;
    universidad: string;
    cantInv: integer;
    cantBec: integer;
  End;

Procedure leerCentro (Var c: centro);
Begin
  writeln('Ingrese la cantidad de investigadores');
  readln(c.cantInv);
  If (c.cantInv <> 0) Then
    Begin
      writeln('Ingrese el nombre abreviado');
      readln(c.nombAbrev);
      writeln('Ingrese la univesidad a la que pertenece');
      readln(c.universidad);
      writeln('Ingrese la cantidad de becarios');
      readln(c.cantBec);
    End;
End;

Var 
  c: centro;
  uniActual, centroMin1, centroMin2, uniMax: string;
  min1, min2, contCentros, maxInv, sumaInvActual: integer;

Begin
  maxInv := -1;
  min1 := 9999;
  min2 := 9999;
  centroMin1 := '';

  leerCentro(c);

  While (c.cantInv <> 0) Do
    Begin
      uniActual := c.universidad;
      contCentros := 0;
      sumaInvActual := 0;

      While (c.cantInv <> 0) And (c.universidad = uniActual) Do
        Begin
          contCentros := contCentros+1;
          sumaInvActual := sumaInvActual+c.cantInv;

          If (c.cantBec < min1) Then
            Begin
              min2 := min1;
              centroMin2 := centroMin1;
              min1 := c.cantBec;
              centroMin1 := c.nombAbrev;
            End
          Else If (c.cantBec < min2) Then
                 Begin
                   min2 := c.cantBec;
                   centroMin2 := c.nombAbrev;
                 End;

          leerCentro(c);
        End;

      writeln('La universidad ', uniActual,' tiene ', contCentros,' centros.');

      If (sumaInvActual > maxInv) Then
        Begin
          maxInv := sumaInvActual;
          uniMax := uniActual;
        End;

    End;

  writeln('Universidad con mayor cantidad de investigadores en sus centros: ',
          uniMax);
  writeln('Los dos centros con menor cantidad de becarios son: ', centroMin1,
          ' y ', centroMin2);

End.
