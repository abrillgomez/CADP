{ La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al menos
el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se entrega
en tiempo y forma y con al menos el 40% de respuestas correctas. }

Program ejercicio2;

Var 
  legajo, i: integer;
  condicion: char;
  nota: real;

  cant10, cant0, cantPresentes: integer;
  sumaNotas, promedio: real;

  totIngresantes, totRecursantes: integer;
  ingresantesRinden, recursantesRinden: integer;
  cantTodasAprobadas, cantPromedioMayor65, cantAlMenosUnCero: integer;

  max1_10, max2_10, legMax1_10, legMax2_10: integer;
  max1_0, max2_0, legMax1_0, legMax2_0: integer;

Begin

  totIngresantes := 0;
  totRecursantes := 0;
  ingresantesRinden := 0;
  recursantesRinden := 0;
  cantTodasAprobadas := 0;
  cantPromedioMayor65 := 0;
  cantAlMenosUnCero := 0;
  max1_10 := -1;
  max2_10 := -1;
  max1_0 := -1;
  max2_0 := -1;

  writeln('Ingrese el legajo del alumno (-1 para cortar):');
  readln(legajo);

  While (legajo <> -1) Do
    Begin
      writeln('Ingrese la condicion (I para Ingresante, R para Recursante):');
      readln(condicion);
      cant10 := 0;
      cant0 := 0;
      cantPresentes := 0;
      sumaNotas := 0;
      For i:=1 To 5  Do
        Begin
          writeln('Ingrese la nota de la autoevaluacion ', i,' (si no la hizo ingrese -1):');
          readln(nota);
          sumaNotas := sumaNotas+nota;

          If (nota = 10) Then
            cant10 := cant10+1;

          If (nota = 0) Then
            cant0 := cant0+1;

          If (nota >= 4) Then
            cantPresentes := cantPresentes + 1;
        End;

      If (condicion = 'I') Then
        Begin
          totIngresantes := totIngresantes + 1;
          If (cantPresentes >= 4) Then
            ingresantesRinden := ingresantesRinden + 1;
        End
      Else If (condicion = 'R') Then
             Begin
               totRecursantes := totRecursantes + 1;
               If (cantPresentes >= 4) Then
                 recursantesRinden := recursantesRinden + 1;
             End;

      If (cantPresentes = 5) Then
        cantTodasAprobadas := cantTodasAprobadas + 1;

      promedio := sumaNotas / 5;

      If (promedio > 6.5) Then
        cantPromedioMayor65 := cantPromedioMayor65 + 1;

      If (cant0 > 0) Then
        cantAlMenosUnCero := cantAlMenosUnCero + 1;

      If (cant10 > max1_10) Then
        Begin
          max2_10 := max1_10;
          legMax2_10 := legMax1_10;
          max1_10 := cant10;
          legMax1_10 := legajo;
        End
      Else If (cant10 > max2_10) Then
             Begin
               max2_10 := cant10;
               legMax2_10 := legajo;
             End;

      If (cant0 > max1_0) Then
        Begin
          max2_0 := max1_0;
          legMax2_0 := legMax1_0;
          max1_0 := cant0;
          legMax1_0 := legajo;
        End
      Else If (cant0 > max2_0) Then
             Begin
               max2_0 := cant0;
               legMax2_0 := legajo;
             End;

      writeln('Ingrese el legajo del siguiente alumno (-1 para cortar):');
      readln(legajo);
    End;

  If (totIngresantes > 0) Then
    writeln('Ingresantes que rinden: ', ingresantesRinden, ' (', (
            ingresantesRinden * 100 / totIngresantes): 0: 2, '%)')
  Else
    writeln('No se ingresaron alumnos Ingresantes.');

  If (totRecursantes > 0) Then
    writeln('Recursantes que rinden: ', recursantesRinden, ' (', (
            recursantesRinden * 100 / totRecursantes): 0: 2, '%)')
  Else
    writeln('No se ingresaron alumnos Recursantes.');

  writeln('Alumnos que aprobaron todas las autoevaluaciones: ',cantTodasAprobadas);
  writeln('Alumnos con promedio mayor a 6.5: ', cantPromedioMayor65);
  writeln('Alumnos con al menos un cero: ', cantAlMenosUnCero);
  writeln('Legajos con mas notas 10: ', legMax1_10, ' y ', legMax2_10);
  writeln('Legajos con mas notas 0: ', legMax1_0, ' y ', legMax2_0);

End.
