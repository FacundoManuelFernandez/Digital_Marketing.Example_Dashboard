-- Consultas correspondientes a las visualizaciones de la página 'Action: de suscriptores a consumidores'
USE MarketingDB

-- Cuadro de resultados: Suscripciones
SELECT FORMAT(SUM(Suscripciones), 'N0', 'es-CO') AS Suscripciones FROM TablaDeHechos;

-- Cuadro de resultados: Ventas
SELECT FORMAT(SUM(Ventas), 'N0', 'es-CO') AS Ventas FROM TablaDeHechos;

-- Indicador: Conversión de suscripciones a ventas
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Suscripciones) > 0 THEN (SUM(Ventas) * 100.0) / SUM(Suscripciones)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversión
FROM TablaDeHechos;

-- Gráfico de columnas: Ventas por Campaña

SELECT
CM.Campaña,
FORMAT(SUM(TH.Ventas), 'N0', 'es-CO') AS Ventas
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY Campaña
ORDER BY SUM(TH.Ventas) DESC

-- Gráfico de barras: Conversión por Campaña

SELECT
	CM.Campaña,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Suscripciones) > 0 THEN (SUM(TH.Ventas) * 100.0) / SUM(TH.Suscripciones)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS Conversión
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY CM.Campaña
ORDER BY Conversión DESC