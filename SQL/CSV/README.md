Para crear la tabla de hechos se utilizaron algunas fórmulas en Excel, a saber:


nsformar .

Dos cambios en el formato de los datos para poder integrarlos en SQL:

1. Cambio 

Por la naturaleza del contenido de Inversión_Marketing, se asignó al campo el tipo de dato 'DECIMAL(18, 2)', esto es, 

=IF(ISNUMBER(H2); TEXT(H2;"0,00"); H2)

La sintaxis de esta fórmula es la siguiente:


Veamosla en desglose:
=IF(                  -- Si...
ISNUMBER(H2);         -- La celda es un número
TEXT(H2;"0,00");      -- Convertirla a texto y añadir al final ",00"
H2                    -- Si no, dejarla tal como está
)

Mediante esta fórmula condicional lo que hacemos en principio es transformar el valor de las celdas a formato texto.
Esto es fundamental, ya que no es posible Es formato texto, ya que 

 Inversion_Marketing DECIMAL(18, 2),


