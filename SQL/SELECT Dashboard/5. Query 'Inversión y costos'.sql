-- Consultas correspondientes a las visualizaciones de la página 'Inversión y costos'

USE MarketingDB

-- Cuadro de resultados: Inversión en Marketing
SELECT FORMAT(SUM(Inversion_Marketing), 'N0', 'es-CO') AS Inversión_Marketing FROM TablaDeHechos;

-- Cuadro de resultados: CPC
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Clics) > 0 THEN (SUM(Inversion_Marketing) / SUM(Clics))
                ELSE 0
            END, 2) AS INT
    ) AS CPC
FROM TablaDeHechos;

-- Cuadro de resultados: CPL
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Suscripciones) > 0 THEN (SUM(Inversion_Marketing) / SUM(Suscripciones))
                ELSE 0
            END, 2) AS INT
    ) AS CPL
FROM TablaDeHechos;

-- Cuadro de resultados: CAC
SELECT 
    CAST(
        ROUND(
            CASE 
                WHEN SUM(Ventas) > 0 THEN (SUM(Inversion_Marketing) / SUM(Ventas))
                ELSE 0
            END, 2) AS INT
    ) AS CAC
FROM TablaDeHechos;

-- Gráfico de columnas: Inversión por campaña

SELECT
CM.Campaña,
FORMAT(SUM(TH.Inversion_Marketing), 'N0', 'es-CO') AS Inversión
FROM TablaDeHechos TH
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY Campaña
ORDER BY SUM(TH.Inversion_Marketing) DESC

--Tabla: CPC, CPL y CAC por Campaña

SELECT
	CT.Categoria,
	CM.Campaña,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(Clics) > 0 THEN (SUM(Inversion_Marketing) / SUM(Clics))
                ELSE 0
            END, 2) AS INT
    ) AS CPC,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(Suscripciones) > 0 THEN (SUM(Inversion_Marketing) / SUM(Suscripciones))
                ELSE 0
            END, 2) AS INT
    ) AS CPL,
	CAST(
        ROUND(
            CASE 
                WHEN SUM(Ventas) > 0 THEN (SUM(Inversion_Marketing) / SUM(Ventas))
                ELSE 0
            END, 2) AS INT
    ) AS CAC
FROM TablaDeHechos TH
INNER JOIN Categoria CT
ON CT.ID_Categoria = TH.ID_Categoria
INNER JOIN Campaña CM
ON CM.ID_NombreCampaña = TH.ID_NombreCampaña
GROUP BY CT.Categoria, CM.Campaña
ORDER BY CT.Categoria DESC

