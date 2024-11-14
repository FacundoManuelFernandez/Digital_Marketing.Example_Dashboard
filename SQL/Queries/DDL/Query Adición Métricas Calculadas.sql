USE MarketingDB

-- Primero, ejecutar el siguiente código para agregar la columna:

ALTER TABLE TablaDeHechos
ADD Ganancia_Bruta DECIMAL(18, 2)

-- Luego, ejecutar el código que define su valor calculado:

UPDATE TablaDeHechos
SET Ganancia_Bruta = Ingresos - Inversion_Marketing

-- Estas dos operaciones son de tipos diferentes y no pueden ejecutarse simultáneamente en una sola instrucción de SQL.
-- ALTER TABLE se utiliza para modificar la estructura de la tabla, por lo que es una operación DDL (Data Definition Language).
-- UPDATE es una operación DML (Data Manipulation Language), utilizada para modificar los datos de las filas de una tabla.

-- ¿Por qué no agregar columnas como CTR, CPC, ROMI, etc. directamente con agregaciones?
-- No se puede almacenar directamente en un campo una fórmula con valores calculados dinámicos basados en agregaciones (como SUM).
-- Esto es así porque las columnas de una tabla están pensadas para almacenar valores estáticos a nivel de fila.
-- Por contrario, las agregaciones como SUM operan sobre un conjunto de datos y generan valores dinámicos basados en un conjunto de filas.
-- Para obtener valores agregados como SUM, es mejor calcularlos en una consulta o bien crear una vista o tabla.