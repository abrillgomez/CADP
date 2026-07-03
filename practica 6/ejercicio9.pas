{ Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente. }

Program JugamosConListas;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;

Procedure armarNodo(Var L: lista; v: integer);

Var 
  aux : lista;
Begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
End;

// Inciso A
Function estaOrdenada(L: lista): boolean;

Var 
  ok: boolean;
Begin
  ok := true;
  While ((L <> Nil) And (L^.sig <> Nil) And ok ) Do
    Begin
      If (L^.num > L^.sig^.num) Then
        Begin
          ok := false;
        End
      Else
        Begin
          L := L^.sig;
        End;
    End;

  estaOrdenada := ok;
End;

// Inciso B
Procedure eliminar(Var L: lista; valor: integer);

Var 
  actual, anterior: lista;
Begin
  actual := L;
  anterior := Nil;

  // Busco el nodo a eliminar
  While (actual <> Nil) And (actual^.num <> valor) Do
    Begin
      anterior := actual;
      actual := actual^.sig;
    End;

  // Si lo encontré, lo elimino
  If (actual <> Nil) Then
    Begin
      // Caso A: El nodo a eliminar es el primero de la lista
      If (anterior = Nil) Then
        Begin
          L := actual^.sig;
          // Actualizo el puntero de la lista al siguiente nodo
        End
        // Caso B: El nodo a eliminar no es el primero de la lista
      Else
        Begin
          anterior^.sig := actual^.sig;
          // El anterior se engancha directamente con el siguiente
        End;
      // Libero la memoria del nodo eliminado
      dispose(actual);
    End;
End;

// Inciso C
Procedure sublista(L: lista; A, B: integer; Var nueva: lista);
Begin
  nueva := Nil;

  While (L <> Nil) Do
    Begin
      If (L^.num > A) And (L^.num < B) Then
        armarNodo(nueva, L^.num);
      L := L^.sig;
    End;
End;

// Inciso D
Procedure sublistaOrdenada(L: lista; A, B: integer; Var nueva: lista);
Begin
  nueva := Nil;

  While ((L <> Nil) And (L^.num < B)) Do
    Begin
      If (L^.num > A) Then
        armarNodo(nueva, L^.num);
      L := L^.sig;
    End;
End;

// Inciso E
Procedure sublistaOrdenadaDescendente(L: lista; A, B: integer; Var nueva: lista)
;
Begin
  nueva := Nil;

  While ((L <> Nil) And (L^.num > A)) Do
    Begin
      If (L^.num < B) Then
        armarNodo(nueva, L^.num);
      L := L^.sig;
    End;
End;


Var 
  pri : lista;
  valor : integer;
Begin
  pri := Nil;
  writeln('Ingrese un numero');
  read(valor);
  While (valor <> 0) Do
    Begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      read(valor);
    End;
End.
