USE MarketingDB

-- Primero, ejecutar el siguiente c�digo para agregar la columna:

ALTER TABLE TablaDeHechos
ADD Ganancia_Bruta DECIMAL(18, 2)

-- Luego, ejecutar el c�digo que define su valor calculado:

UPDATE TablaDeHechos
SET Ganancia_Bruta = Ingresos - Inversion_Marketing

-- Estas dos operaciones son de tipos diferentes y no pueden ejecutarse simult�neamente en una sola instrucci�n de SQL.
-- ALTER TABLE se utiliza para modificar la estructura de la tabla, por lo que es una operaci�n DDL (Data Definition Language).
-- UPDATE es una operaci�n DML (Data Manipulation Language), utilizada para modificar los datos de las filas de una tabla.

-- �Por qu� no agregar columnas como CTR, CPC, ROMI, etc. directamente con agregaciones?
-- No se puede almacenar directamente en un campo una f�rmula con valores calculados din�micos basados en agregaciones (como SUM).
-- Esto es as� porque las columnas de una tabla est�n pensadas para almacenar valores est�ticos a nivel de fila.
-- Por contrario, las agregaciones como SUM operan sobre un conjunto de datos y generan valores din�micos basados en un conjunto de filas.
-- Para obtener valores agregados como SUM, es mejor calcularlos en una consulta o bien crear una vista o tabla.