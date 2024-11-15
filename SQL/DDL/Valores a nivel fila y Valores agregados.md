¿Por qué no se pueden agregar métricas como CTR, CPC, ROMI como campos en la base de datos?

Las columnas están diseñadas para almacenar datos estáticos o calculados por fila. Cada fila de una tabla representa un registro único, por lo que cualquier cálculo a nivel de columna se realiza individualmente para esa fila.

CTR (Click-Through Rate), CPC (Cost Per Click), o ROMI (Return on Marketing Investment) son métricas derivadas que suelen calcularse en función de conjuntos de datos completos (por ejemplo, un total de clics o impresiones) en lugar de solo una fila.

Si se intentara almacenar directamente el resultado de una fórmula que involucra agregaciones como SUM en una columna, el sistema no sabría qué conjunto de filas sumar porque las columnas no tienen contexto del total general o del conjunto específico de datos necesarios.

Es decir, agregaciones como SUM (o AVG, COUNT, MAX, etc.) se aplican sobre un conjunto de filas en un contexto de consulta o agregación, y no pueden calcularse "fila por fila".

No sucede lo mismo con "Ganancia bruta" (Inversión - Ingresos). Dicha métrica opera en valores individuales por fila (por ejemplo, la inversión y los ingresos de una campaña específica). El cálculo es determinístico y estático: siempre se puede evaluar a partir de las columnas en la misma fila, por lo que se puede almacenar directamente en una columna calculada. Por el contrario, CTR, CPC o ROMI dependen de la suma de múltiples filas (valores dinámicos que cambian según el contexto de la consulta), por lo que no es posible almacenarlos en una columna calculada directamente sin especificar un grupo de datos.

Por esto mismo es que en Excel, por ejemplo, dichas métricas se calculan sobre la Tabla Dinámica y no sobre la propia base de datos (fila por fila).

En SQL, el cálculo DE estas métricas que requieren agregación se realiza directamente en cada consulta específica o, a lo sumo, en un CTE (Common Table Expression) o vista si se desea optimizar la eficiencia de la consulta
