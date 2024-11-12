Se realizaron dos cambios en el formato de los datos en el CSV para poder integrarlos en SQL:

1. Cambio de formato del campo 'Inversión_Marketing'

Por la naturaleza del contenido de Inversión_Marketing, en SQL se asignó al campo el tipo de dato 'DECIMAL(18, 2)'.
DECIMAL(18,2) se puede traducir como: número de hasta 18 digitos y con dos decimales.

Se eligió este tipo de dato porque, si bien algunos registros representan números enteros, la mayoría se expresa en montos con dos decimales.

Ahora bien, sucede que, si el número originalmente no lleva decimales, Excel lo considera como un número entero, por más de que el formato asignado a la celda incluya decimales. 

Es decir, si el monto en un principio es '2548' y ni '2548,00' por más de que agreguemos manualmente la terminacion decimal, Excel lo sigue considerando como '2548' a secas... y en SQL no se puede insertar un número entero en un campo con tipo de dato DECIMAL.

Podemos resolver esto en dos pasos:

a) Adición de decimales a aquellos valores con números enteros.

b) Reemplazo de comas por puntos.

a) Adición de decimales a aquellos valores con números enteros

Este proceso se realiza mediante la siguiente fórmula:

=IF(ISNUMBER(H2); TEXT(H2;"0,00"); H2)

En principio, la sintaxis de esta fórmula es la siguiente:
=IF( Condición a cumplir ; Valor en caso de que se cumpla ; Valor en caso de que no se cumpla )

Veámosla entonces en desglose:

=IF(                  -- Si...

ISNUMBER(H2);         -- La celda es un número

TEXT(H2;"0,00");      -- Convertirla a texto y añadir al final ",00"

H2                    -- Si no, dejarla tal como está

)

Mediante esta fórmula condicional lo que hacemos es indicarle a Excel que transforme el valor de las celdas en formato numérico a formato texto.
Esto es fundamental, ya que no es posible agregar la finalización decimal ",00" si la celda no está en formato texto.
Al mismo tiempo, se le asigna al final del "texto" (",00") en caso de que el número no tuviera tal terminación.

b) Reemplazo de comas por puntos
Una vez realizada la transformación, es necesario reemplazar las comas ( , ) por puntos ( . ) con la función Find & Replace, ya que SQL entiende al punto ( . ) como separador decimal.

Con esos dos pasos la columna ya está lista para ser cargada en SQL como tipo de dato DECIMAL(18,2).

2. Cambio de formato del campo Fecha

Si bien el formato de fecha en la tabla original es dd/mm/yyyy (día/mes/año), Microsoft SQL Server la considera como mm/dd/yyyy de forma predeterminada.

Desde ya, tal consideración por parte del programa no permite la correcta inserción de los registros en la tabla y genera inconvenientes en la manipulación de los datos.

Si bien existen numerosas formas de solucionar esto, la más sencilla es asignarle el tipo de dato DATE con formato 'mm/dd/yyyy' a la columna correspondiente desde el propio archivo csv.



