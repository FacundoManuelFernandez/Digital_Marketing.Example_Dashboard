-- Consultas correspondientes a las visualizaciones de la p�gina 'Inversi�n y costos'

USE MarketingDB

-- Cuadro de resultados: Inversi�n en Marketing
SELECT FORMAT(SUM(Inversion_Marketing), 'N0', 'es-CO') AS Inversi�n_Marketing FROM TablaDeHechos;

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

-- Gr�fico de columnas: Inversi�n por campa�a

SELECT
CM.Campa�a,
FORMAT(SUM(TH.Inversion_Marketing), 'N0', 'es-CO') AS Inversi�n
FROM TablaDeHechos TH
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY Campa�a
ORDER BY SUM(TH.Inversion_Marketing) DESC

--Tabla: CPC, CPL y CAC por Campa�a

SELECT
	CT.Categoria,
	CM.Campa�a,
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
INNER JOIN Campa�a CM
ON CM.ID_NombreCampa�a = TH.ID_NombreCampa�a
GROUP BY CT.Categoria, CM.Campa�a
ORDER BY CT.Categoria DESC

