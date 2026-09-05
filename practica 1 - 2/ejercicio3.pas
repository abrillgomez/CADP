{ Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
informar:
● La cantidad de alumnos aprobados (nota 8 o mayor).
● La cantidad de alumnos que obtuvieron un 7 como nota }

Program ejercicio3;

Var 
  nombre: string;
  nota, aprobados, alumnosConSiete: integer;
Begin
  aprobados := 0;
  alumnosConSiete := 0;
  Repeat
    writeln('Ingrese el nombre del alumno');
    readln(nombre);
    writeln('Ingrese la nota del alumno');
    readln(nota);
    If (nota >= 8) Then
      aprobados := aprobados+1;
    If (nota = 7) Then
      alumnosConSiete := alumnosConSiete+1;
  Until (nombre = 'Zidane Zinedine');
  writeln('Cantidad de alumnos aprobados: ', aprobados);
  writeln('Cantidad de alumnos que obtuvieron un 7 como nota: ', alumnosConSiete
  );
End.
