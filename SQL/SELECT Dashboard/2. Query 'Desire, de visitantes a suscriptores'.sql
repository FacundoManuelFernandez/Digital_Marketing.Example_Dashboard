-- Consultas correspondientes a las visualizaciones de la p�gina 'Desire: de visitantes a suscriptores'
USE MarketingDB

-- Cuadro de resultados: Clics
SELECT FORMAT(SUM(Clics), 'N0', 'es-CO') AS Clics FROM TablaDeHechos;

-- Cuadro de resultados: Suscripciones
SELECT FORMAT(SUM(Suscripciones), 'N0', 'es-CO') AS Suscripciones FROM TablaDeHechos;

-- Indicador: Conversi�n de clics a suscripciones

SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Clics) > 0 THEN (SUM(Suscripciones) * 100.0) / SUM(Clics)
                ELSE 0
            END, 2) AS DECIMAL(18, 2)
    ) AS Conversi�n
FROM TablaDeHechos;

-- Gr�fico de columnas: suscripciones por campa�a

SELECT
CM.Campa�a,
FORMAT(SUM(TH.Suscripciones), 'N0', 'es-CO') AS Suscripciones
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY Campa�a
ORDER BY SUM(TH.Suscripciones) DESC

-- Gr�fico de barras: Conversi�n por Campa�a

SELECT
	CM.Campa�a,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(TH.Clics) > 0 THEN (SUM(TH.Suscripciones) * 100.0) / SUM(TH.Clics)
                ELSE 0
            END, 1) AS DECIMAL(18, 1)
    ) AS Conversi�n
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY CM.Campa�a
ORDER BY Conversi�n DESC