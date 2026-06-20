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
  write('Ingrese el legajo del alumno: ');
  read(legajo);
  write('Ingrese el promedio del alumno: ');
  read(promedio);
End.
