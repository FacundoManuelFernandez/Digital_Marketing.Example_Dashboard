-- Replicar la utilizaci�n de los slicers del Dashboard desde SQL es muy sencillo.
-- Basta con agregar la cl�usula WHERE seguido del campo y los valores a filtrar.

-- Por ejemplo, si que se quiere filtrar por la categor�a Influencer la l�nea de c�digo ser�a as�:

-- WHERE Categoria = 'Influencer'

-- O si queremos filtrar por la campa�a blogger desarrollada en Youtube:

-- WHERE NombreCampa�a = 'youtube_blogger'

-- Si previamente se defini� un alias para la tabla donde se encuentra el campo es necesario especificarlo.

-- Hay que tener en cuenta tambi�n que si el campo por el que se quiere filtrar no forma parte del SELECT es necesario previamente realizar un JOIN para incluirlo.

-- Para aplicar varios filtros simultaneamente basta con utilizar los operadores AND o OR. Por ejemplo:

-- WHERE Categoria = 'Social' AND Medio = 'Instagram'
-- WHERE (Categoria = 'Social' OR Categoria = 'Search') AND Medio = 'Facebook'

-- Esta consulta, por ejemplo, filtra la tabla 'Impresiones y Clics por Campa�a' dejando unicamente la pauta de Influencers:
USE MarketingDB
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
WHERE CT.Categoria = 'Influencer' -- Aqu� est� agregado el filtro
GROUP BY CT.Categoria, CM.Campa�a
ORDER BY CT.Categoria DESC


-- Esta consulta solo muestra los resultados del gr�fico de barras 'CTR por Campa�a' para la campa�a 'youtube_blogger'
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
WHERE CM.Campa�a = 'youtube_blogger' -- Aqu� est� agregado el filtro
GROUP BY CM.Campa�a
ORDER BY CTR DESC