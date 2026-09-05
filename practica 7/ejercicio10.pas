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

// Inciso B
Function tienDosCeros (num: integer): boolean;

Var 
  cont, digito: integer;
Begin
  cont := 0;
  While (num <> 0) Do
    Begin
      digito := num Mod 10;
      If (digito=0) Then
        Begin
          cont := cont+1;
        End;
      num := num Div 10;
    End;
  tienDosCeros := (cont >= 2);
End;

Function cultivaTrigo(v: vectorCultivos; dimL: integer): boolean;

Var 
  i: integer;
  encontre: boolean;
Begin
  encontre := false;
  i := 1;

  While ((i <= dimL) And (encontre = false)) Do
    Begin
      If (v[i].tipo = 'trigo') Then
        Begin
          encontre := true;
        End
      Else
        Begin
          i := i+1;
        End;
    End;
  cultivaTrigo := encontre;
End;

// Inciso B, C y D
Procedure procesarLista (l: lista);

Var 
  soja, total: real;
  i, maxTiempo: integer;
  maxEmpresa: string;
Begin
  soja := 0;
  total := 0;
  maxTiempo := -1;
  While (l<>Nil) Do
    Begin
      If ((l^.dato.ciudad = 'San Miguel del Monte') And (cultivaTrigo(l^.dato.
         cultivos, l^.dato.dimL)) And (tienDosCeros(l^.dato.codigo))) Then
        Begin
          writeln(l^.dato.nombre);
        End;
      For i:=1 To l^.dato.dimL Do
        Begin
          total := total+l^.dato.cultivos[i].cantHect;
          If (l^.dato.cultivos[i].tipo = 'soja') Then
            Begin
              soja := soja + l^.dato.cultivos[i].cantHect;
            End;
          If ((l^.dato.cultivos[i].tipo ='maiz') And (l^.dato.cultivos[i].
             cantMeses > maxTiempo)) Then
            Begin
              maxEmpresa := l^.dato.nombre;
              maxTiempo := l^.dato.cultivos[i].cantMeses;
            End;
        End;
      l := l^.sig;
    End;
  writeln('Hectareas totales de soja: ', soja:0:2);
  If (total > 0) Then
    Begin
      writeln('Porcentaje que representa: ', (soja*100/total): 0: 2, '%');
    End;
  writeln('La empresa: ', maxEmpresa, ' tarda ', maxTiempo, ' en cultivar maiz')
  ;
End;

// Inciso E
Procedure incrementarGirasol (l: lista);

Var 
  i: integer;

Begin
  While (l <> Nil) Do
    Begin
      If (l^.dato.tipo = false) Then
        Begin
          For i:=1 To l^.dato.dimL Do
            Begin
              If ((l^.dato.cultivos[i].tipo = 'girasol') And (l^.dato.cultivos[i
                 ].cantHect < 5)) Then
                Begin
                  l^.dato.cultivos[i].cantMeses := l^.dato.cultivos[i].cantMeses
                                                   +1;
                End;
            End;
        End;
      l := l^.sig;
    End;
End;

Var 
  l: lista;
Begin
  l := Nil;
  cargarLista(l);
  procesarLista(l);
  incrementarGirasol(l);
End.
