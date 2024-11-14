-- Consultas correspondientes a las visualizaciones de la página 'Awareness: de vistas a visitantes'

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

--Tabla: Impresiones y Clics por Campaña

SELECT
	CT.Categoria,
	CM.Campaña,
	FORMAT(SUM(TH.Impresiones), 'N0', 'es-CO') AS Impresiones,
	FORMAT(SUM(TH.Clics), 'N0', 'es-CO') AS Clics 
FROM TablaDeHechos TH
INNER JOIN Categoria CT
ON CT.ID_Categoria = TH.ID_Categoria
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY CT.Categoria, CM.Campaña
ORDER BY CT.Categoria DESC

--Gráfico de barras: CTR por Campaña

SELECT
	CM.Campaña,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Impresiones) > 0 THEN (SUM(TH.Clics) * 100.0) / SUM(TH.Impresiones)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS CTR
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY CM.Campaña
ORDER BY CTR DESC