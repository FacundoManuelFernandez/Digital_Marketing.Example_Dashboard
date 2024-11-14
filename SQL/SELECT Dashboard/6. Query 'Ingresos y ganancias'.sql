-- Consultas correspondientes a las visualizaciones de la página 'Ingresos y ganancias'

USE MarketingDB

-- Cuadro de resultados: Inversión en Marketing
SELECT FORMAT(SUM(Inversion_Marketing), 'N0', 'es-CO') AS Inversión_Marketing FROM TablaDeHechos;

-- Cuadro de resultados: Ingresos
SELECT FORMAT(SUM(Ingresos), 'N0', 'es-CO') AS Ingresos FROM TablaDeHechos;

-- Cuadro de resultados: Ganancia bruta
SELECT FORMAT(SUM(Ganancia_Bruta), 'N0', 'es-CO') AS Ganancia_bruta FROM TablaDeHechos;

--Indicador: ROMI
SELECT
		CAST(
			ROUND(
					CASE WHEN SUM(Inversion_Marketing) > 0 THEN ((SUM(Ingresos) - SUM(Inversion_Marketing)) / SUM(Inversion_Marketing)) * 100
					ELSE 0
			END, 2) AS DECIMAL (18,2)
			) AS ROMI
FROM TablaDeHechos


-- Gráfico de columnas: Ganancia bruta por Campaña

SELECT
CM.Campaña,
FORMAT(SUM(TH.Ganancia_Bruta), 'N0', 'es-CO') AS Ganancia_bruta
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY Campaña
ORDER BY SUM(TH.Ganancia_Bruta) DESC

-- Gráfico de columnas: ROMI por Campaña

SELECT
CM.Campaña,
		CAST(
			ROUND(
					CASE WHEN SUM(Inversion_Marketing) > 0 THEN ((SUM(Ingresos) - SUM(Inversion_Marketing)) / SUM(Inversion_Marketing)) * 100
					ELSE 0
			END, 2) AS DECIMAL (18,1)
			) AS ROMI
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY Campaña
ORDER BY SUM(TH.Ganancia_Bruta) DESC
