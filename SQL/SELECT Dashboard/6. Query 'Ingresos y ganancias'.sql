-- Consultas correspondientes a las visualizaciones de la p�gina 'Ingresos y ganancias'

USE MarketingDB

-- Cuadro de resultados: Inversi�n en Marketing
SELECT FORMAT(SUM(Inversion_Marketing), 'N0', 'es-CO') AS Inversi�n_Marketing FROM TablaDeHechos;

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


-- Gr�fico de columnas: Ganancia bruta por Campa�a

SELECT
CM.Campa�a,
FORMAT(SUM(TH.Ganancia_Bruta), 'N0', 'es-CO') AS Ganancia_bruta
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY Campa�a
ORDER BY SUM(TH.Ganancia_Bruta) DESC

-- Gr�fico de columnas: ROMI por Campa�a

SELECT
CM.Campa�a,
		CAST(
			ROUND(
					CASE WHEN SUM(Inversion_Marketing) > 0 THEN ((SUM(Ingresos) - SUM(Inversion_Marketing)) / SUM(Inversion_Marketing)) * 100
					ELSE 0
			END, 2) AS DECIMAL (18,1)
			) AS ROMI
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY Campa�a
ORDER BY SUM(TH.Ganancia_Bruta) DESC
