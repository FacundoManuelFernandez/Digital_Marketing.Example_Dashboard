-- Consultas correspondientes a las visualizaciones de la p�gina 'Action: de suscriptores a consumidores'
USE MarketingDB

-- Cuadro de resultados: Suscripciones
SELECT FORMAT(SUM(Suscripciones), 'N0', 'es-CO') AS Suscripciones FROM TablaDeHechos;

-- Cuadro de resultados: Ventas
SELECT FORMAT(SUM(Ventas), 'N0', 'es-CO') AS Ventas FROM TablaDeHechos;

-- Indicador: Conversi�n de suscripciones a ventas
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Suscripciones) > 0 THEN (SUM(Ventas) * 100.0) / SUM(Suscripciones)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversi�n
FROM TablaDeHechos;

-- Gr�fico de columnas: Ventas por Campa�a

SELECT
CM.Campa�a,
FORMAT(SUM(TH.Ventas), 'N0', 'es-CO') AS Ventas
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY Campa�a
ORDER BY SUM(TH.Ventas) DESC

-- Gr�fico de barras: Conversi�n por Campa�a

SELECT
	CM.Campa�a,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Suscripciones) > 0 THEN (SUM(TH.Ventas) * 100.0) / SUM(TH.Suscripciones)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS Conversi�n
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY CM.Campa�a
ORDER BY Conversi�n DESC