-- Consultas correspondientes a las visualizaciones de la p�gina 'Awareness: de vistas a visitantes'

USE MarketingDB;

-- Cuadro de resultados: Impresiones
SELECT FORMAT(SUM(Impresiones), 'N0', 'es-CO') AS Impresiones FROM TablaDeHechos;

-- Cuadro de resultados: Clics
SELECT FORMAT(SUM(Clics), 'N0', 'es-CO') AS Clics FROM TablaDeHechos;

-- Indicador: CTR

SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Impresiones) > 0 THEN (SUM(Clics) * 100.0) / SUM(Impresiones)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS CTR
FROM TablaDeHechos;

--Tabla: Impresiones y Clics por Campa�a

SELECT
	CT.Categoria,
	CM.Campa�a,
	FORMAT(SUM(TH.Impresiones), 'N0', 'es-CO') AS Impresiones,
	FORMAT(SUM(TH.Clics), 'N0', 'es-CO') AS Clics 
FROM TablaDeHechos TH
INNER JOIN Categoria CT
ON CT.ID_Categoria = TH.ID_Categoria
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY CT.Categoria, CM.Campa�a
ORDER BY CT.Categoria DESC

--Gr�fico de barras: CTR por Campa�a

SELECT
	CM.Campa�a,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Impresiones) > 0 THEN (SUM(TH.Clics) * 100.0) / SUM(TH.Impresiones)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS CTR
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY CM.Campa�a
ORDER BY CTR DESC