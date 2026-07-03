{ La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en 
La Plata. Para ello, debe realizar un programa que lea y almacene información sobre las 
computadoras con este sistema operativo (a lo sumo 10.000). De cada computadora se conoce: 
código de computadora, la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), 
la cantidad de paquetes instalados y la cantidad de cuentas de usuario que poseen. La 
información debe almacenarse ordenada por código de computadora de manera ascendente. La 
lectura finaliza al ingresar el código de computadora -1, que no debe procesarse. Una vez 
almacenados todos los datos, se pide: La compañía Canonical Llt. desea obtener estadísticas 
acerca del uso de Ubuntu Linux en La Plata. Para ello, debe realizar un programa que lea 
y almacene información sobre las computadoras con este sistema operativo (a lo sumo 
10.000). De cada computadora se conoce: código de computadora, la versión de Ubuntu que 
utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la cantidad 
de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora 
-1, que no debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes
instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500. }

Program ejercicio1Ad;

Const 
  dimF = 10000;

Type 
  computadora = Record
    codigo: integer;
    version: string;
    paquetes: integer;
    cuentas: integer;
  End;

  vectorComputadoras = array[1..dimF] Of computadora;

Function leerComputadora(codigo: integer): computadora;
Var 
  c: computadora;
Begin
  c.codigo := codigo;
  writeln('Ingrese la version de Ubuntu');
  readln(c.version);
  writeln('Ingrese la cantidad de paquetes instalados');
  readln(c.paquetes);
  writeln('Ingrese la cantidad de cuentas de usuario');
  readln(c.cuentas);
  leerComputadora := c;
End;

Procedure insertarOrdenado(Var dimL: integer; Var v: vectorComputadoras; c:
                           computadora);
Var 
  i, pos: integer;
Begin
  // Buscar el lugar
  pos := 1;
  While ((pos <= dimL) And (v[pos].codigo < c.codigo)) Do
    Begin
      pos := pos+1;
    End;
  // Hacer lugar
  For i:= dimL Downto pos Do
    Begin
      v[i+1] := v[i]
    End;
  // Insertar y actualizar
  v[pos] := c;
  dimL := dimL+1;
End;

// Inciso A 
Function cantComputadoras(dimL: integer; v: vectorComputadoras): integer;
Var 
  i,cant: integer;
Begin
  cant := 0;
  For i:=1 To dimL Do
    Begin
      If ((v[i].version = '18.04') Or (v[i].version = '16.04')) Then
        Begin
          cant := cant+1;
        End;
    End;
  cantComputadoras := cant;
End;

// Inciso B
Function totalCuentas(dimL: integer; v: vectorComputadoras): integer;
Var 
  i, suma: integer;
Begin
  suma := 0;

  For i:=1 To dimL Do
    Begin
      suma := suma+v[i].cuentas
    End;

  totalCuentas := suma;
End;

// Inciso C
Function buscarMaximo (dimL: integer; v: vectorComputadoras): string;
Var 
  i, maxPaquetes: integer;
  maxVersion: string;

Begin
  maxPaquetes := -1;

  For i:=1 To dimL Do
    Begin
      If (v[i].paquetes > maxPaquetes) Then
        Begin
          maxPaquetes := v[i].paquetes;
          maxVersion := v[i].version
        End;
    End;

  buscarMaximo := maxVersion;
End;

// Inciso D
Procedure eliminarComputadora (Var dimL: integer; Var v: vectorComputadoras);
Var 
  i, j, cantBorrados: integer;
Begin
  // Buscar el límite
  i := 1;
  While (i <= dimL) And (v[i].codigo >= 0) And (v[i].codigo <= 500) Do
    Begin
      i := i+1;
    End;

  // Calcular cuántos borramos
  cantBorrados := i-1;

  // Mover
  For j := i To dimL Do
    Begin
      v[j-cantBorrados] := v[j];
    End;

  //  Actualizar el tamaño
  dimL := dimL-cantBorrados;
End;

Var 
  v: vectorComputadoras;
  dimL, cod: integer;
  resultado: real;
  c: computadora;

Begin
  dimL := 0;

  writeln('Ingrese el codigo de la computadora (-1 para terminar)');
  readln(cod);

  While (cod <> -1) Do
    Begin
      c := leerComputadora(cod);
      insertarOrdenado(dimL, v, c);
      writeln('Ingrese el codigo de la siguiente computadora (-1 para terminar)'
      );
      readln(cod);
    End;

  If (dimL > 0) Then
    Begin
      resultado := totalCuentas(dimL, v) / dimL;
      writeln('El promedio de cuentas de usuario es: ', resultado:0:2);
      writeln('Cantidad de computadoras con version 18.04 o 16.04: ',
              cantComputadoras
              (dimL, v));
      writeln('La version con mas paquetes instalados es: ', buscarMaximo(dimL,
              v));
      eliminarComputadora(dimL, v);
      writeln('Se eliminaron las computadoras con codigo entre 0 y 500. La nueva cantidad de computadoras es: ', dimL);
    End
  Else
    Begin
      writeln('Error: no se registraron computadoras para calcular el promedio.')
    End;

End.
