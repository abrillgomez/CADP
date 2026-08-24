


{ Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto
leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir:
  El aumento de precio del producto 10382 no supera el 10% 
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir:
  El aumento de precio del producto 32767 es superior al 10% }

Program ejercicio6;

Var 
  codigo: integer;
  precioActual, precioNuevo: real;
Begin
  Repeat
    writeln('Ingrese el codigo del producto');
    readln(codigo);
    writeln('Ingrese el precio actual del producto');
    readln(precioActual);
    writeln('Ingrese el precio nuevo del producto');
    readln(precioNuevo);

    If (precioNuevo > (precioActual*1.10)) Then
      writeln('El aumento de precio del producto ', codigo,
              ' es superior al 10%')
    Else
      writeln('El aumento del precio del producto ', codigo,' no supera el 10%');
  Until (codigo=32767)
End.
