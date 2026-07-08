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
function tienDosCeros (num: integer): boolean;
var
  cont, digito: integer;
begin 
  cont:=0;
  While(num <> 0) do begin
    digito:=num MOD 10;
    if(digito=0) then begin
      cont:=cont+1;
    end;
    num:=num DIV 10;
  end;
  tienDosCeros := (cont >= 2);
end;

function cultivaTrigo(v: vectorCultivos; dimL: integer): boolean;
var
  i: integer;
  encontre: boolean;
begin
  encontre:=false;
  i:=1;

  while ((i <= dimL) and (encontre = false)) do begin
    if (v[i].tipo = 'trigo') then begin 
      encontre:=true;
    end else begin
      i:=i+1;
      end;
  end;
  cultivaTrigo:=encontre;
end;

// Inciso B, C y D
procedure procesarLista (l: lista);
var 
  soja, total: real;
  i, maxTiempo: integer;
  maxEmpresa: string;
begin
  soja:=0;
  total:=0;
  maxTiempo:=-1;
  while (l<>nil) do begin
    if ((l^.dato.ciudad = 'San Miguel del Monte') and (cultivaTrigo(l^.dato.cultivos, l^.dato.dimL)) and (tienDosCeros(l^.dato.codigo))) then begin
      writeln(l^.dato.nombre);
    end;
    for i:=1 to l^.dato.dimL do begin 
      total:=total+l^.dato.cultivos[i].cantHect;
      if (l^.dato.cultivos[i].tipo = 'soja') then begin 
        soja := soja + l^.dato.cultivos[i].cantHect;
      end;
      if ((l^.dato.cultivos[i].tipo ='maiz') and (l^.dato.cultivos[i].cantMeses > maxTiempo)) then begin
        maxEmpresa:=l^.dato.nombre;
        maxTiempo:=l^.dato.cultivos[i].cantMeses;
      end;
    end;
    l:=l^.sig;
  end;
  writeln('Hectareas totales de soja: ', soja:0:2);
  if (total > 0) then begin
    writeln('Porcentaje que representa: ', (soja*100/total):0:2, '%');
  end;
  writeln('La empresa: ', maxEmpresa, ' tarda ', maxTiempo, ' en cultivar maiz');
end;

// Inciso E
procedure incrementarGirasol (l: lista);
var
  i: integer;

begin 
  while (l <> nil) do begin
  if (l^.dato.tipo = false) then begin 
    for i:=1 to l^.dato.dimL do begin
      if ((l^.dato.cultivos[i].tipo = 'girasol') and (l^.dato.cultivos[i].cantHect < 5)) then begin 
      l^.dato.cultivos[i].cantMeses:=l^.dato.cultivos[i].cantMeses+1;
      end;
    end;
  end;
  l:=l^.sig;
  end;
end;

Var 
  l: lista;
Begin
  l := nil; 
  cargarLista(l); 
  procesarLista(l); 
  incrementarGirasol(l); 
End.