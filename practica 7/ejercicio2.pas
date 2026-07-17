{ Implementar un programa que lea y almacene información de clientes de una
empresa aseguradora automotriz. De cada cliente se lee: código de cliente, 
DNI, apellido, nombre, código de póliza contratada (1..6) y monto básico que abona
mensualmente. La lectura finaliza cuando llega el cliente con código 1122, el cual 
debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto
adicional que el cliente debe abonar en la liquidación mensual de su seguro, 
de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga
mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos 
dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe)
y lo elimine de la estructura. }

Program ejercicio2;

Type 

  rangoPoliza = 1..6;

  cliente = Record
    codigo: integer;
    dni: integer;
    apellido: string;
    nombre: string;
    poliza: rangoPoliza;
    monto: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato : cliente;
    sig : lista;
  End;

  vectorMontosAd  = array[1..6] Of real;

Procedure agregarAdelante (Var l: lista; c: cliente);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := c;
  nue^.sig := l;
  l := nue;
End;

Procedure leerClientes (Var l: lista);

Var 
  c: cliente;
Begin
  Repeat
    Readln(c.codigo, c.dni, c.apellido, c.nombre, c.poliza, c.monto);
    agregarAdelante(l, c);
  Until (c.codigo = 1122)
End;

Procedure montosAdicionales (Var v: vectorMontosAd);
Begin
  // Se dispone
End;

// Inciso B
Function contarNueves (dni: integer): integer;

Var 
  cont, digito: integer;
Begin
  cont := 0;
  digito := 0;
  While (dni <> 0) Do
    Begin
      digito := dni Mod 10;
      If (digito = 9) Then
        cont := cont+1;
      dni := dni Div 10;
    End;
  contarNueves := cont;
End;

// Inciso A
Procedure procesarClientes (l: lista; vMontos: vectorMontosAd);

Var 
  aux: lista;
  montoTotal: real;

Begin
  aux := l;
  montoTotal := 0;

  While (aux <> Nil) Do
    Begin
      montoTotal := aux^.dato.monto+vMontos[aux^.dato.poliza];
      writeln('Dni: ', aux^.dato.dni,'apellido: ', aux^.dato.apellido,
              ' nombre: ', aux^.dato.nombre,
              'monto: ', montoTotal);

      If (contarNueves(aux^.dato.dni) >= 2) Then
        Begin
          writeln('Apellido: ', aux^.dato.apellido, ' nombre: ', aux^.dato.
                  nombre, ' tiene 2 o mas 9 en el dni.');
        End;

      aux := aux^.sig;

    End;
End;

// Inciso C
Procedure eliminar (Var l: lista; valor: integer);

Var 
  act, ant: lista;
Begin
  act := l;
  While (act^.dato.codigo <> valor) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = l) Then
    Begin
      l := act^.sig;
    End
  Else
    Begin
      ant^.sig := act^.sig;
    End;
  dispose(act);
End;

Var 
  lPrincipal: lista;
  vAdicionales: vectorMontosAd;
  codigoAEliminar: integer;
Begin
  lPrincipal := Nil;
  montosAdicionales(vAdicionales);
  leerClientes(lPrincipal);
  procesarClientes(lPrincipal, vAdicionales);
  eliminar(lPrincipal, codigoAEliminar);
End.
