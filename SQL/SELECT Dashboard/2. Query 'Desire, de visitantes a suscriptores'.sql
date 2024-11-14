-- Consultas correspondientes a las visualizaciones de la página 'Desire: de visitantes a suscriptores'
USE MarketingDB

-- Cuadro de resultados: Clics
SELECT FORMAT(SUM(Clics), 'N0', 'es-CO') AS Clics FROM TablaDeHechos;

-- Cuadro de resultados: Suscripciones
SELECT FORMAT(SUM(Suscripciones), 'N0', 'es-CO') AS Suscripciones FROM TablaDeHechos;

-- Indicador: Conversión de clics a suscripciones

SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Clics) > 0 THEN (SUM(Suscripciones) * 100.0) / SUM(Clics)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversión
FROM TablaDeHechos;

-- Gráfico de columnas: suscripciones por campaña

SELECT
CM.Campaña,
FORMAT(SUM(TH.Suscripciones), 'N0', 'es-CO') AS Suscripciones
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY Campaña
ORDER BY SUM(TH.Suscripciones) DESC

-- Gráfico de barras: Conversión por Campaña

SELECT
	CM.Campaña,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Clics) > 0 THEN (SUM(TH.Suscripciones) * 100.0) / SUM(TH.Clics)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS Conversión
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY CM.Campaña
ORDER BY Conversión DESC