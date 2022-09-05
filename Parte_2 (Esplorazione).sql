-- In questa parte ci occuperemmo dell'esplorazione dei dati per trovare qualche 
-- insight da inserire in un grafico

-- Il progetto consiste nell'analisi dei dati di persone uccise dalla polizia USA dal
-- 2015 al 2017

-------------------- 1 Tabella ("Uccisioni della polizia (JOIN)) ---------------------

SELECT * FROM "Uccisioni della polizia (JOIN)"

-- 1.1 Causa di morte

SELECT "Causa di morte", 
COUNT("Causa di morte") AS "Quantità",
ROUND(CAST(COUNT("Causa di morte") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Causa di morte"
ORDER BY "Quantità" DESC;

-- 1.2 Arma in posseso della vittima

SELECT "Arma in posseso", 
COUNT("Arma in posseso") AS "Quantità",
ROUND(CAST(COUNT("Arma in posseso") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM"Uccisioni della polizia (JOIN)"
GROUP BY "Arma in posseso"
ORDER BY "Quantità" DESC;

-- 1.3 Genere

SELECT "Genere", 
COUNT("Genere") AS "Quantità",
ROUND(CAST(COUNT("Genere") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Genere"
ORDER BY "Quantità" DESC;

-- 1.4 Etnia

SELECT "Etnia", 
COUNT("Etnia") AS "Quantità",
ROUND(CAST(COUNT("Etnia") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Etnia"
ORDER BY "Quantità" DESC;

-- 1.5 Malattia mentale

SELECT "Malattia mentale", 
COUNT("Malattia mentale") AS "Quantità",
ROUND(CAST(COUNT("Malattia mentale") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Malattia mentale"
ORDER BY "Quantità" DESC;

-- 1.6 Livello di minaccia

SELECT "Livello di minaccia", 
COUNT("Livello di minaccia") AS "Quantità",
ROUND(CAST(COUNT("Livello di minaccia") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Livello di minaccia"
ORDER BY "Quantità" DESC;

-- 1.7 Fuga

SELECT "Fuga", 
COUNT("Fuga") AS "Quantità",
ROUND(CAST(COUNT("Fuga") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Fuga"
ORDER BY "Quantità" DESC;

-- 1.8 Possesso di una camera da parte dell'agente

SELECT "Camera", 
COUNT("Camera") AS "Quantità",
ROUND(CAST(COUNT("Camera") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY "Camera"
ORDER BY "Quantità" DESC;

-- 1.9 Età

SELECT 
SUM(CASE WHEN "Età" < 20 THEN 1 END) AS "Età sotto i 20 anni",
SUM(CASE WHEN "Età" BETWEEN 20 AND 30 THEN 1 END) AS "Età tra 20 e 30 anni",
SUM(CASE WHEN "Età" BETWEEN 30 AND 40 THEN 1 END) AS "Età tra 30 e 40 anni",
SUM(CASE WHEN "Età" BETWEEN 40 AND 50 THEN 1 END) AS "Età tra 40 e 50 anni",
SUM(CASE WHEN "Età" > 50 THEN 1 END) AS "Età sopra i 50 anni"
FROM "Uccisioni della polizia (JOIN)";

-- 1.10 Anno

SELECT
EXTRACT(YEAR FROM "Data") AS "Anno",
COUNT("Data") as "Quantità",
ROUND(CAST(COUNT("Data") AS NUMERIC)/2535*100,2) AS "Quantità (%)"
FROM "Uccisioni della polizia (JOIN)"
GROUP BY EXTRACT(YEAR FROM "Data")
ORDER BY "Anno";

-- 1.11 Medie

SELECT 
ROUND(AVG("Reddito medio"),2) AS "Reddito medio",
--ROUND(AVG("Bianco (%)"),2) AS "Bianco (%) media",
--ROUND(AVG("Afro (%)"),2) AS "Afro (%) media",
--ROUND(AVG("Nativo (%)"),2) AS "Nativo (%) media",
--ROUND(AVG("Asiatico (%)"),2) AS "Asiatico (%) media",
--ROUND(AVG("Spagnolo (%)"),2) AS "Spagnolo (%) media",
ROUND(AVG("Tasso di diploma (%)"),2) AS "Tasso di diploma (%) media",
ROUND(AVG("Tasso di povertà (%)"),2) AS "Tasso di povertà (%) media"
FROM "Uccisioni della polizia (JOIN)";

-- Queste medie tendono a essere fuorviante, visto che sono valori intese per medie
-- di persone in una determinata città, ma è utile notare che la media del tasso di 
-- povertà nelle città dove sono state uccisi dalla polizia è alto, questo solitamente 
-- causa un maggior disordine sociale e economico

---------------------------------------------------------------------------------------

-- In conclusione noto che essere in posseso di una arma pericolosa aumenta le
-- probabilità di essere uccisi dalla polizia, il tipo di minaccia, il non fuggire 
-- (potrebbe essere molto correlato al tipo di minacia), il posseso di una camera 
-- da parte dell'agente è piuttosto preoccupante essendo il 90% sono avvenuti senza 
-- una camera e quindi senza una prova video di aggressione, l'età sotto i 40 anni e il 
-- tasso di povertà per altri valori sarà più comprensibile con i grafici


