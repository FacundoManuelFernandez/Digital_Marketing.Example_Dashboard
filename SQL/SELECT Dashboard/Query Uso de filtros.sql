-- Replicar la utilización de los slicers del Dashboard desde SQL es muy sencillo.
-- Basta con agregar la cláusula WHERE seguido del campo y los valores a filtrar.

-- Por ejemplo, si que se quiere filtrar por la categoría Influencer la línea de código sería así:

-- WHERE Categoria = 'Influencer'

-- O si queremos filtrar por la campaña blogger desarrollada en Youtube:

-- WHERE NombreCampaña = 'youtube_blogger'

-- Si previamente se definió un alias para la tabla donde se encuentra el campo es necesario especificarlo.

-- Hay que tener en cuenta también que si el campo por el que se quiere filtrar no forma parte del SELECT es necesario previamente realizar un JOIN para incluirlo.

-- Para aplicar varios filtros simultaneamente basta con utilizar los operadores AND o OR. Por ejemplo:

-- WHERE Categoria = 'Social' AND Medio = 'Instagram'
-- WHERE (Categoria = 'Social' OR Categoria = 'Search') AND Medio = 'Facebook'

-- Esta consulta, por ejemplo, filtra la tabla 'Impresiones y Clics por Campaña' dejando unicamente la pauta de Influencers:
USE MarketingDB
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
WHERE CT.Categoria = 'Influencer' -- Aquí está agregado el filtro
GROUP BY CT.Categoria, CM.Campaña
ORDER BY CT.Categoria DESC


-- Esta consulta solo muestra los resultados del gráfico de barras 'CTR por Campaña' para la campaña 'youtube_blogger'
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
WHERE CM.Campaña = 'youtube_blogger' -- Aquí está agregado el filtro
GROUP BY CM.Campaña
ORDER BY CTR DESC