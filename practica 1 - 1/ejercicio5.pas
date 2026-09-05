{ Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura
finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo: se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo
promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor
al valor 2500 (en el ejemplo anterior, se debería informar 0%). }


Program ejercicio5;

Var 
  legajo, cantAlum, cantAlumSup, cantAlumDest: integer;
  promedio: real;

Begin
  cantAlum := 0;
  cantAlumSup := 0;
  cantAlumDest := 0;
  writeln('Ingrese el legajo del alumno');
  readln(legajo);
  While (legajo <> -1) Do
    Begin
      writeln('Ingrese el promedio del alumno');
      readln(promedio);
      cantAlum := cantAlum+1;
      If (promedio > 6.5) Then
        cantAlumSup := cantAlumSup+1;
      If (promedio > 8.5) And (legajo < 2500) Then
        cantAlumDest := cantAlumDest+1;
      writeln('Ingrese el legajo del alumno');
      readln(legajo);
    End;
  writeln('Cantidad de alumnos leida: ', cantAlum);
  writeln('Cantidad de alumnos cuyo promedio supera 6.5: ', cantAlumSup);
  If (cantAlum > 0) Then
    writeln('Porcentaje de alumnos destacados cuyo legajo es menor a 2500: ', (
            cantAlumDest*100)/cantAlum: 0: 2);
End.
