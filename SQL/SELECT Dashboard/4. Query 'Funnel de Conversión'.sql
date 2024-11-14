-- Consultas correspondientes a la visualización 'Funnel de Conversión'
USE MarketingDB

-- Impresiones
SELECT FORMAT(SUM(Impresiones), 'N0', 'es-CO') AS Impresiones FROM TablaDeHechos;

-- CTR

SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Impresiones) > 0 THEN (SUM(Clics) * 100.0) / SUM(Impresiones)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS CTR
FROM TablaDeHechos;

-- Clics
SELECT FORMAT(SUM(Clics), 'N0', 'es-CO') AS Clics FROM TablaDeHechos;

-- Conversión de clics a suscripciones

SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Clics) > 0 THEN (SUM(Suscripciones) * 100.0) / SUM(Clics)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversión_I
FROM TablaDeHechos;

-- Suscripciones
SELECT FORMAT(SUM(Suscripciones), 'N0', 'es-CO') AS Suscripciones FROM TablaDeHechos;

-- Conversión de suscripciones a ventas
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Suscripciones) > 0 THEN (SUM(Ventas) * 100.0) / SUM(Suscripciones)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversión_II
FROM TablaDeHechos;

-- Ventas
SELECT FORMAT(SUM(Ventas), 'N0', 'es-CO') AS Ventas FROM TablaDeHechos;