{ La biblioteca de la Universidad Nacional de La Plata necesita un programa para
administrar información de préstamos de libros efectuados en marzo de 2020. Para ello, 
se debe leer la información de los préstamos realizados. De cada préstamo se lee: 
nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el libro, 
día del préstamo (1..31). La información de los préstamos se lee de manera ordenada por 
ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
  a. Generar una estructura que contenga, para cada ISBN de libro, la cantidad de
  veces que fue prestado.
  Esta estructura debe quedar ordenada por ISBN de libro.
  b. Calcular e informar el día del mes en que se realizaron menos préstamos.
  c.Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo
  impar y nro. de socio par. }

Program explicacion;

Type 
  rangoDias = 1..31;

  prestamo = Record
    nro: integer;
    isbn: integer;
    socio: integer;
    dia: rangoDias;
  End;

  libro = Record
    isbn: integer;
    cant: integer;
  End;

  vector = array[rangoDias] Of integer;

  lista = ^nodo;

  nodo = Record
    dato: libro;
    sig: lista;
  End;

{ ========================================================= }
{ ACA FALTAN CREAR LOS MODULOS CORTITOS:                    }
{ - Procedure inicializarVector                             }
{ - Procedure leerPrestamo                                  }
{ - Procedure agregarAdelante                               }
{ - Procedure imprimirDatos                                 }
{ ========================================================= }

Procedure procesarDatos (Var L: lista; Var v: vector; Var porc: real);

Var 
  p: prestamo;
  actual, cant, cumplen, total: integer;
Begin
  L := Nil;
  cumplen := 0;
  total := 0;

  leerPrestamo(p);
  While (p.isbn <> -1) Do
    Begin
      cant := 0;
      actual := p.isbn;

      While (p.isbn <> -1) And (p.isbn = actual) Do
        Begin
          cant := cant + 1;
          v[p.dia] := v[p.dia] + 1;
          total := total + 1;

          If ((p.socio Mod 2) = 0) And ((p.nro Mod 2) = 1) Then
            Begin
              cumplen := cumplen + 1;
            End;

          leerPrestamo(p);
        End;

      agregarAdelante(L, actual, cant);
      // Agregar atrás también puede ser
    End;

  If (total > 0) Then
    porc := (cumplen / total) * 100
  Else
    porc := 0;
End;

Function minimo (v: vector): rangoDias;

Var 
  i, diaMin: rangoDias;
  valorMin: integer;
Begin
  valorMin := 9999;
  For i := 1 To 31 Do
    Begin
      If (v[i] < valorMin) Then
        Begin
          valorMin := v[i];
          diaMin := i;
        End;
    End;
  minimo := diaMin;
End;

{ --- PROGRAMA PRINCIPAL --- }

Var 
  v: vector;
  l: lista;
  porcentaje: real;
  minimoDia: rangoDias;
Begin
  inicializarVector(v);
  procesarDatos(l, v, porcentaje);
{ Módulo encargado de leer los prestamos y devolver la 
    lista con la cant de prestamos, el vector cargado con el porcentaje }
  minimoDia := minimo(v);

  imprimirDatos(l, minimoDia, porcentaje);
End.
