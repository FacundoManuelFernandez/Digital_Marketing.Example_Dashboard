¿Por qué no se pueden agregar métricas como CTR, CPC, ROMI como campos en la base de datos?
Las columnas están diseñadas para almacenar datos estáticos o calculados por fila. Cada fila de una tabla representa un registro único, por lo que cualquier cálculo a nivel de columna se realiza individualmente para esa fila.

CTR (Click-Through Rate), CPC (Cost Per Click), o ROMI (Return on Marketing Investment) son métricas derivadas que suelen calcularse en función de conjuntos de datos completos (por ejemplo, un total de clics o impresiones) en lugar de solo una fila.

Si se intentara almacenar directamente el resultado de una fórmula que involucra agregaciones como SUM en una columna, el sistema no sabría qué conjunto de filas sumar porque las columnas no tienen contexto del total general o del conjunto específico de datos necesarios.

Es decir, agregaciones como SUM (o AVG, COUNT, MAX, etc.) se aplican sobre un conjunto de filas en un contexto de consulta o agregación, y no pueden calcularse "fila por fila".

En cambio, esto no sucede con "Ganancia bruta" (Inversión - Ingresos). Dicha métrica opera en valores individuales por fila (por ejemplo, la inversión y los ingresos de una campaña específica). Este cálculo es determinístico y estático: siempre se puede evaluar a partir de las columnas en la misma fila, por lo que se puede almacenar directamente en una columna calculada. Como dijimos, CTR, CPC o ROMI dependen de la suma de múltiples filas (valores dinámicos que cambian según el contexto de la consulta). Por eso, no es posible almacenarlos en una columna calculada directamente sin especificar un grupo de datos.

Por esto mismo es que, por ejemplo, dichas métricas se calculan en Excel sobre la Tabla Dinámica y no sobre la propia base de datos (fila por fila).
