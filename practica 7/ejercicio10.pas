{ Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la
ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se
registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de
meses que lleva el ciclo de cultivo. 
a. Realizar un programa que lea la información de las empresas y sus cultivos.
Dicha información se ingresa hasta que llegue una empresa con código -1 
(la cual no debe procesarse). Para cada empresa se leen todos sus cultivos, 
hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).

Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan
trigo y cuyo código de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje
representa con respecto al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol
de menos de 5 hectáreas de todas las empresas que no son estatales. }

Program ejercicio10;

Type 
  cultivo = Record
    tipo: string;
    cantHect: real;
    cantMeses: integer;
  End;

  vectorCultivos = array [1..20] Of cultivo;

  empresa = Record
    codigo: integer;
    nombre: string;
    tipo: boolean;
    ciudad: string;
    cultivos: vectorCultivos;
    dimL: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato : empresa;
    sig : lista;
  End;

Procedure agregarAdelante (Var l: lista; e: empresa);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := e;
  nue^.sig := l;
  l := nue;
End;

// Inciso A
Procedure leerCultivos (Var e: empresa);

Var 
  hectareas: real;
Begin
  e.dimL := 0;
  readln(hectareas);
  While ((hectareas <> 0) And (e.dimL < 20)) Do
    Begin
      e.dimL := e.dimL+1;
      e.cultivos[e.dimL].cantHect := hectareas;
      readln(e.cultivos[e.dimL].tipo, e.cultivos[e.dimL].cantMeses);
      readln(hectareas);
    End;
End;

Procedure leerEmpresa(Var e: empresa);

Var 
Begin
  readln(e.codigo);
  If (e.codigo <> -1) Then
    Begin
      readln(e.nombre, e.tipo, e.ciudad);
      leerCultivos(e);
    End;
End;

Procedure cargarLista(Var l: lista);

Var 
  e: empresa;
Begin
  leerEmpresa(e);
  While (e.codigo <> -1) Do
    Begin
      agregarAdelante(l, e);
      leerEmpresa(e);
    End;
End;

Var 
Begin
End.
