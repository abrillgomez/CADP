{ El equipo de nutricionistas de la Villa Olímpica de los Juegos de Los Angeles
2028 desea analizar los datos de las comidas recomendadas para los deportistas. De cada 
una se conoce: nombre, ingrediente principal (p. ej: 'Salmón'), la cantidad de calorías por 
porción, y la vitamina predominante ('A'..'E'). Se dispone de esta
información ordenada por ingrediente principal. Se pide un programa que imprima
un reporte que contenga:
a. Para cada ingrediente, la cantidad total de comidas que lo incluyen como
ingrediente principal, y la vitamina que más predomina entre ellas.
b. Los dos ingredientes principales menos utilizados (según la cantidad de comidas que los 
incluyen como ingredientes principales).
c. El porcentaje de comidas hipocalóricas (las que aportan menos de 400 calorías 
por porción). }

Program ejercicio15;

Type 

  vitaminaPredominante = 'A'..'E';

  comida = Record
    nombre: string;
    ingrediente: string;
    calorias: integer;
    vitamina: vitaminaPredominante;
  End;

  lista = ^nodo;

  nodo = Record
    dato: comida;
    sig: lista;
  End;

  vectorVitaminas = array ['A'..'E'] Of integer;

Procedure cargarLista(Var l: lista);
Begin
  // Se dispone
End;

Procedure procesarComidas (l: lista);

Var 
  aux: lista;
  maxCantVit, cantComidas, min1, min2, totalComidas, comidasHipo: integer;
  ingredienteActual, ingMin1, ingMin2: string;
  v: vectorVitaminas;
  i, vitMaxima: char;

Begin
  aux := l;
  min1 := 9999;
  min2 := 9999;
  totalComidas := 0;
  comidasHipo := 0;

  While (aux <> Nil) Do
    Begin
      cantComidas := 0;
      ingredienteActual := aux^.dato.ingrediente;
      maxCantVit := -1;

      For i:= 'A' To 'E' Do
        Begin
          v[i] := 0;
        End;

      While (aux <> Nil) And (ingredienteActual = aux^.dato.ingrediente) Do
        Begin
          cantComidas := cantComidas+1;
          v[aux^.dato.vitamina] := v[aux^.dato.vitamina]+1;
          totalComidas := totalComidas+1;
          If (aux^.dato.calorias < 400) Then
            Begin
              comidasHipo := comidasHipo +1;
            End;
          aux := aux^.sig;
        End;

      For i:= 'A' To 'E' Do
        Begin
          If (v[i] > maxCantVit) Then
            Begin
              maxCantVit := v[i];
              vitMaxima := i;
            End;
        End;

      If (cantComidas < min1) Then
        Begin
          ingMin2 := ingMin1;
          min2 := min1;
          ingMin1 := ingredienteActual;
          min1 := cantComidas;
        End
      Else If (cantComidas < min2) Then
             Begin
               ingMin2 := ingredienteActual;
               min2 := cantComidas;
             End;

      writeln('Cantidad de comidas para el ingrediente ', ingredienteActual,
              ': ',cantComidas);
      writeln('La vitamina maxima es: ', vitMaxima);
    End;
  writeln('Menos usados: ', ingMin1, ' y ', ingMin2);
  writeln('Porcentaje: ', (comidasHipo*100/totalComidas:0:2));
End;

Var 
  lNueva: lista;
Begin
  lNueva := Nil;
  cargarLista(lNueva);
  procesarComidas(lNueva);
End.
