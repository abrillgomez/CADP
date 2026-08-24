{ Una entidad bancaria de la ciudad de La Plata solicita realizar un programa
destinado a la administración de transferencias de dinero entre cuentas bancarias, 
efectuadas entre los meses de Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y
Noviembre del 2018. De cada transferencia se conoce: número de cuenta origen, 
DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, 
fecha, hora, monto y el código del motivo de la transferencia (1: alquiler, 2: expensas, 
3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee 
orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros
(son aquellas en las que las cuentas origen y destino no pertenecen al mismo titular). Esta 
nueva estructura debe estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio 
en las cuales el número de cuenta destino posea menos dígitos pares que impares. }

Program ejercicio8;

Type 

  motivos = 1..7;

  mes = 1..11;

  transferencia = Record
    numCuentaOrigen: integer;
    dniOrigen: integer;
    numCuentaDestino: integer;
    dniDestino: integer;
    fecha: mes;
    hora: integer;
    monto: real;
    motivo: motivos;
  End;

  lista = ^nodo;

  nodo = Record
    dato: transferencia;
    sig: lista;
  End;

  vectorContador = array [1..7] Of integer;

Procedure insertarOrdenado (Var l: lista; t: transferencia);

Var 
  act, ant, nuevo: lista;
Begin
  new(nuevo);
  nuevo^.dato := t;
  act := l;
  ant := l;

  While (act <> Nil) And (t.numCuentaOrigen > act^.dato.numCuentaOrigen) Do
    Begin
      ant := act;
      act := act^.sig;
    End;

  If (act = l) Then
    l := nuevo
  Else
    ant^.sig := nuevo;

  nuevo^.sig := act;
End;

Procedure cargarLista(Var l: lista);
Begin
  // Se dispone
End;

// Inciso A
Procedure generarListaTerceros (l: lista; Var lNueva: lista);

Var 
  aux: lista;

Begin
  lNueva := Nil;
  aux := l;

  While (aux <> Nil) Do
    Begin
      If (aux^.dato.dniOrigen <> aux^.dato.dniDestino) Then
        Begin
          insertarOrdenado(lNueva, aux^.dato);
        End;

      aux := aux^.sig;
    End;
End;

// Inciso D
Function cumpleDigitos (num: integer): boolean;

Var 
  digito, pares, impares: integer;
Begin
  pares := 0;
  impares := 0;
  While (num <> 0) Do
    Begin
      digito := num Mod 10;
      If (digito Mod 2 = 0) Then
        pares := pares+1
      Else impares := impares+1;
      num := num Div 10;
    End;

  If (pares < impares) Then
    cumpleDigitos := true
  Else
    cumpleDigitos := false;
End;


// Inciso B
Procedure procesarListaNueva (l: lista);

Var 
  aux: lista;
  i, cuentaActual, maxMotivo, codMax, cantJunio: integer;
  v: vectorContador;
  montoTotalCuenta: real;

Begin
  cantJunio := 0;
  aux := l;
  maxMotivo := -1;

  For i:=1 To 7 Do
    Begin
      v[i] := 0;
    End;

  While (aux <> Nil) Do
    Begin
      cuentaActual := aux^.dato.numCuentaOrigen;
      montoTotalCuenta := 0;

      While (aux <> Nil) And (aux^.dato.numCuentaOrigen = cuentaActual) Do
        Begin
          montoTotalCuenta := montoTotalCuenta + aux^.dato.monto;
          v[aux^.dato.motivo] := v[aux^.dato.motivo]+1;
          If (aux^.dato.fecha = 6) And (cumpleDigitos(aux^.dato.numCuentaDestino
             )) Then
            Begin
              cantJunio := cantJunio+1;
            End;

          aux := aux^.sig;
        End;

      writeln('El onto total de la cuenta ', cuentaActual,' es de: ',
              montoTotalCuenta);
    End;

  For i:=1 To 7 Do
    Begin
      If (v[i] > maxMotivo) Then
        Begin
          maxMotivo := v[i];
          codMax := i;
        End;
    End;

  writeln('El codigo de motivo con mas transferencias a terceros es: ', codMax);
  writeln('Cantidad de transferencias en junio con condicion de digitos: ',
          cantJunio);

End;


Var 
  l, lNueva: lista;
Begin
  l := Nil;
  cargarLista(l);
  generarListaTerceros(l, lNueva);
  procesarListaNueva(lNueva);
End.
