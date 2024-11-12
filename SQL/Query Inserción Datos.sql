BULK INSERT Campa�a
FROM 'C:\Users\Facundo\Documents\Facundo\Data Analysis\Proyectos\Dashboard Model\SQL\CSVs\Campa�a.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Define el separador de columnas
    ROWTERMINATOR = '\n',   -- Define el separador de filas
    FIRSTROW = 2            -- Ignora la fila de encabezados
);

BULK INSERT Categoria
FROM 'C:\Users\Facundo\Documents\Facundo\Data Analysis\Proyectos\Dashboard Model\SQL\CSVs\Categor�a.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Medio
FROM 'C:\Users\Facundo\Documents\Facundo\Data Analysis\Proyectos\Dashboard Model\SQL\CSVs\Medio.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT TablaDeHechos
FROM 'C:\Users\Facundo\Documents\Facundo\Data Analysis\Proyectos\Dashboard Model\SQL\CSVs\Tabla de Hechos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
