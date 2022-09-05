-- In questo progetto andremmo a creare le tabelle e inserire i valori dai file csv
-- e infine andremmo a combinare varie tabelle

-- In alcune colonne sono presenti alcuni valori anomali quindi sarà neccessario prima 
-- usare il formato varchar per inserire i valori per poi pulirli e convertirli

---------------------------- 1 Tabella n°1 (Reddito medio) --------------------------

-- 1.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Reddito medio";
CREATE TABLE public."Reddito medio"(
    "Stato" VARCHAR(255),
    "Città" VARCHAR(255), 
    "Reddito medio" VARCHAR(255)); 
COPY "Reddito medio"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\MedianHouseholdIncome2015.csv'
DELIMITER ','
CSV HEADER;

-- 1.2 Ricerca valori non numerici

SELECT * FROM "Reddito medio"
WHERE "Reddito medio" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
OR "Reddito medio" ISNULL
ORDER BY "Stato","Città";

-- 1.3 Aggiornamento dati 

UPDATE "Reddito medio" -- Si può anche usare delete, per il nostro uso è indifferente 
SET "Reddito medio" = NULL 
WHERE "Reddito medio" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

-- 1.4 Test formato numerico

SELECT CAST("Reddito medio" AS NUMERIC)
FROM "Reddito medio";

-- 1.5 Conversione nel formato numerico 

ALTER TABLE "Reddito medio"
ALTER COLUMN "Reddito medio" TYPE NUMERIC
USING "Reddito medio"::NUMERIC;

-- 1.6 Visualizzazione tabella n°1

SELECT * FROM "Reddito medio";

-------------------------- 2 Tabella n°2 (Tasso di povertà) -------------------------

-- 2.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Tasso di povertà";
CREATE TABLE public."Tasso di povertà"(
    "Stato" VARCHAR(255),
    "Città" VARCHAR(255), 
    "Tasso di povertà (%)" VARCHAR(255));
COPY "Tasso di povertà"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\PercentagePeopleBelowPovertyLevel.csv'
DELIMITER ','
CSV HEADER;

-- 2.2 Ricerca valori non numerici

SELECT * FROM "Tasso di povertà"
WHERE "Tasso di povertà (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
OR "Tasso di povertà (%)" ISNULL;

-- 2.3 Aggiornamento dati

UPDATE "Tasso di povertà"
SET "Tasso di povertà (%)" = NULL
WHERE "Tasso di povertà (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

-- 2.4 Test formato numerico

SELECT CAST("Tasso di povertà (%)" AS NUMERIC)
FROM "Tasso di povertà";

-- 2.5 Conversione nel formato numerico 

ALTER TABLE "Tasso di povertà"
ALTER COLUMN "Tasso di povertà (%)" TYPE NUMERIC
USING "Tasso di povertà (%)"::NUMERIC;

-- 2.6 Visualizzazione tabella n°2

SELECT * FROM "Tasso di povertà";

---------------------- 3 Tabella n°3 (Tasso di diploma over25) ----------------------

-- 3.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Tasso di diploma over25";
CREATE TABLE public."Tasso di diploma over25"(
    "Stato" VARCHAR(255),
    "Città" VARCHAR(255), 
    "Tasso di diploma (%)" VARCHAR(255));
COPY "Tasso di diploma over25"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\PercentOver25CompletedHighSchool.csv'
DELIMITER ','
CSV HEADER;

-- 3.2 Ricerca valori non numerici

SELECT * FROM "Tasso di diploma over25"
WHERE "Tasso di diploma (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
OR "Tasso di diploma (%)" ISNULL;

-- 3.3 Aggiornamento dati

UPDATE "Tasso di diploma over25"
SET "Tasso di diploma (%)" = NULL
WHERE "Tasso di diploma (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

-- 3.4 Test formato numerico

SELECT CAST("Tasso di diploma (%)" AS NUMERIC)
FROM "Tasso di diploma over25";

-- 3.5 Conversione nel formato numerico

ALTER TABLE "Tasso di diploma over25"
ALTER COLUMN "Tasso di diploma (%)" TYPE NUMERIC
USING "Tasso di diploma (%)"::NUMERIC;

-- 3.6 Visualizzazione tabella n°3

SELECT * FROM "Tasso di diploma over25";

----------------------- 4 Tabella n°4 (Uccisioni della polizia) ---------------------

-- 4.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Uccisioni della polizia";
CREATE TABLE public."Uccisioni della polizia"(
    "ID" INT,
    "Nome" VARCHAR(255),
    "Data" DATE,
    "Causa di morte" VARCHAR(255),
    "Arma in posseso" VARCHAR(255),
    "Età" INT,
    "Genere" VARCHAR(255),
    "Etnia" VARCHAR(255),
    "Città" VARCHAR(255),
    "Stato" VARCHAR(255),
    "Malattia mentale" BOOLEAN,
    "Livello di minaccia" VARCHAR(255),
    "Fuga" VARCHAR(255),
    "Camera" BOOLEAN,
	CONSTRAINT "Uccisioni della polizia_pkey" PRIMARY KEY ("ID"));
COPY "Uccisioni della polizia"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\PoliceKillingsUS.csv'
DELIMITER ','
CSV HEADER;

-- 4.2 Visualizzazione tabella n°4

SELECT * FROM "Uccisioni della polizia";

---------------------------- 5 Tabella n°5 (Popolazione) ----------------------------

-- 5.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Popolazione";
CREATE TABLE public."Popolazione"(
    "Città" VARCHAR(255),
    "Stato" VARCHAR(255),
	"Popolazione" DECIMAL(20,0),
    "lat" NUMERIC,
	"lng" NUMERIC);
COPY "Popolazione"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\PopulationByCity.csv'
DELIMITER ','
CSV HEADER;

-- 5.2 Visualizzazione tabella n°5

SELECT * FROM "Popolazione";

------------------------------- 6 Tabella n°6 (Etnia) -------------------------------

-- 6.1 Creazione e inserimento valori

DROP TABLE IF EXISTS public."Etnia";
CREATE TABLE public."Etnia"(
    "Stato" character varying(255),
    "Città" character varying(255),
    "Bianco (%)" character varying(255),
    "Afro (%)" character varying(255),
    "Nativo (%)" character varying(255),
    "Asiatico (%)" character varying(255),
    "Spagnolo (%)" character varying(255));
COPY "Etnia"
FROM 'C:\Users\39380\Desktop\Progetti\SQL\UccisioniPoliziaUS\Dati\ShareRaceByCity.csv'
DELIMITER ','
CSV HEADER;

-- 6.2 Ricerca valori non numerici

SELECT * FROM "Etnia"
WHERE "Bianco (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
OR "Bianco (%)" ISNULL;

-- 6.3 Pulizia dati

DELETE FROM "Etnia"
WHERE "Bianco (%)" !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

-- 6.4 Test formato numerico

SELECT CAST("Bianco (%)" AS NUMERIC)
FROM "Etnia";

-- 6.5 Conversione nel formato numerico

ALTER TABLE "Etnia"
ALTER COLUMN "Bianco (%)" TYPE NUMERIC
USING "Bianco (%)"::NUMERIC,
ALTER COLUMN "Afro (%)" TYPE NUMERIC
USING "Afro (%)"::NUMERIC,
ALTER COLUMN "Nativo (%)" TYPE NUMERIC
USING "Nativo (%)"::NUMERIC,
ALTER COLUMN "Asiatico (%)" TYPE NUMERIC
USING "Asiatico (%)"::NUMERIC,
ALTER COLUMN "Spagnolo (%)" TYPE NUMERIC
USING "Spagnolo (%)"::NUMERIC;

-- 6.6 Visualizzazione tabella n°6

SELECT * FROM "Etnia";

--------------------------------- 7 Tabella (JOIN1) ---------------------------------

-- In questa parte andremmo a combinare varie tabelle, useremmo come riferimento
-- lo stato e la città dove è presente in tutte le tabelle, ma prima faremmo un breve 
-- confronto tra varie tabelle per vedere se i valori combaciano

SELECT * FROM "Popolazione" ORDER BY "Stato", "Città"; -- 2831 righe
SELECT * FROM "Reddito medio" ORDER BY "Stato", "Città"; -- 27468 righe
SELECT * FROM "Tasso di povertà" ORDER BY "Stato", "Città"; -- 29329 righe
SELECT * FROM "Tasso di diploma over25" ORDER BY "Stato", "Città"; -- 29329 righe
SELECT * FROM "Etnia" ORDER BY "Stato", "Città"; -- 29248 righe
SELECT * FROM "Uccisioni della polizia" ORDER BY "Stato", "Città"; -- 2535 righe

-- La tabella popolazione ha valori diversi rispetto alle altre 4 tabelle (uguali)
-- nella colonna città, ma ha i stessi valori della tabella di interesse quindi sarà 
-- neccessario fare qualche aggiustamento sulle altre 4 tabelle dopo averli uniti per
-- farlo in unica volta e useremmo FULL JOIN dove i dati non ricavabili veranno 
-- convertiti in Null per non perdere dati

-- 7.1 Unione di tabelle come una nuova tabella (JOIN1)

DROP TABLE IF EXISTS "JOIN1";
CREATE TABLE "JOIN1" AS (
SELECT 
A."Stato", A."Città", A."Reddito medio", 
B."Bianco (%)", B."Afro (%)", B."Nativo (%)", B."Asiatico (%)", B."Spagnolo (%)",
C."Tasso di diploma (%)",
D."Tasso di povertà (%)"
FROM ((SELECT * FROM "Reddito medio") A
	  FULL OUTER JOIN 
	  (SELECT * FROM "Etnia") B 
	  ON A."Stato"= B."Stato" AND A."Città"= B."Città"
	  FULL OUTER JOIN 
	  (SELECT * FROM "Tasso di diploma over25") C 
	  ON A."Stato"= C."Stato" AND A."Città"= C."Città"
	  FULL OUTER JOIN 
	  (SELECT * FROM "Tasso di povertà") D 
	  ON A."Stato"= D."Stato" AND A."Città"= D."Città"));
	
SELECT * FROM "JOIN1";

-- 7.2 Pulizia dati (JOIN1)

SELECT "Stato", "Città" FROM "JOIN1" ORDER BY "Stato";
SELECT "Stato", "Città" FROM "Popolazione" ORDER BY "Stato";

-- Facendo delle ricerche noto che nella colonna della città della tabella
-- JOIN1, i dati hanno valori di troppo rispetto alla colonna città 
-- della tabella popolazione (es Anchor Point CDP / Anchor Point, 
-- Anchorage municipality / Anchorage)

SELECT "Stato", "Città"
FROM "JOIN1"
WHERE "Città" NOT LIKE '%city' 
-- AND "Città"  NOT LIKE '%CDP'
-- AND "Città" NOT LIKE '%town'
-- AND "Città" NOT LIKE '%borough'
-- AND "Città" NOT LIKE '%city and borough'
-- AND "Città" NOT LIKE '%village'
-- AND "Città" NOT LIKE '%municipality'
ORDER BY "Stato", "Città";

-- Suppongo che questi 7 siano i valori di troppo e successivamente li 
-- andremmo a rimuovere

SELECT "Stato", "Città", 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE("Città",' CDP',''),
						' town',''),
						' city and borough',''),
						' village',''),
						' city',''),
						' municipality',''),
						' borough','')
FROM "JOIN1" ORDER BY "Stato";

-- 7.3 Aggiornamento tabella (JOIN1)

UPDATE "JOIN1"
SET "Città" = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE("Città",' CDP',''),
						' town',''),
						' city and borough',''),
						' village',''),
						' city',''),
						' municipality',''),
						' borough','');

-- 7.4 Visualizzazione JOIN1

SELECT * FROM "JOIN1" ORDER BY "Stato", "Città";

--------------- 8 Tabella (Distribuzione di valori per stato e città) ---------------

-- Ora che abbiamo finito di sistemare i valori della tabella (JOIN1) passiamo alla
-- fase successiva, che si tratta di inserire i valori della popolazione

-- 8.1 Unione tabella Popolazione e tabella JOIN1

SELECT *
FROM "Popolazione" A
LEFT JOIN "JOIN1" B
ON A."Città" = B."Città" AND A."Stato" = B."Stato"
ORDER BY A."Stato", A."Città";

-- Direi che abbia preso quasi la totalità dei dati nella tabella popolazione 
-- (2831 righe contro 2837 righe, quest'aumento è probabilmente dovuto che nella
-- tabella JOIN1 siano presenti valori ripetitivi) 

-- 8.2 Creazione e aggiornamento in una nuova tabella (JOIN2)

DROP TABLE IF EXISTS "JOIN2";
CREATE TABLE "JOIN2" AS(
	SELECT A."Stato", A."Città", A."Popolazione", A."lat", A."lng",
	B."Reddito medio", B."Bianco (%)", B."Afro (%)", B."Nativo (%)", 
	B."Asiatico (%)", B."Spagnolo (%)", B."Tasso di diploma (%)", 
	B."Tasso di povertà (%)"
	FROM "Popolazione" A
	LEFT JOIN "JOIN1" B
	ON A."Città" = B."Città" AND A."Stato" = B."Stato"
	ORDER BY A."Stato", A."Città");

-- 8.3 Controlliamo i valori (Stato e città) ripetitivi

SELECT *, ROW_NUMBER() OVER (PARTITION BY "Stato", "Città" ORDER BY "Popolazione")
FROM "JOIN2";

-- 8.4 Creazione tabella ("Distribuzione di valori per stato e città") e inserimento

DROP TABLE IF EXISTS "Distribuzione di valori per stato e città";
CREATE TABLE "Distribuzione di valori per stato e città" AS(
SELECT *, ROW_NUMBER() OVER (PARTITION BY "Stato", "Città" ORDER BY "Popolazione")
FROM "JOIN2");

-- 8.5 Aggiornamento

SELECT * 
FROM "Distribuzione di valori per stato e città"
WHERE "row_number" > 1;

DELETE FROM "Distribuzione di valori per stato e città" WHERE "row_number" > 1;

---------------- 9 Tabella (Uccisioni della polizia (Tutti i dati)) ----------------

-- In questa parte andrò a fare l'ultima combinazione tra la 
-- tabella (Uccisioni della polizia) e la tabella combinata con altre tabelle in
-- una nuova tabella che la chiamerò (Uccisioni della polizia (Tutti i dati))

-- 9.1 Test 

SELECT *
FROM "Uccisioni della polizia" A
LEFT JOIN "Distribuzione di valori per stato e città" B
ON A."Città" = B."Città" AND A."Stato" = B."Stato"
ORDER BY A."Stato", A."Città";

-- 9.2 Creazione tabella e inserimento valori

DROP TABLE IF EXISTS "Uccisioni della polizia (JOIN)";
CREATE TABLE "Uccisioni della polizia (JOIN)" AS(
	SELECT 
	A."Data", A."Causa di morte", A."Arma in posseso", A."Età", A."Genere",
	A."Etnia", A."Malattia mentale", A."Fuga", A."Livello di minaccia", 
	A."Camera", A."Stato", A."Città",
	B."Popolazione", B."lat", B."lng", B."Reddito medio", B."Bianco (%)", 
	B."Afro (%)", B."Nativo (%)", B."Asiatico (%)", B."Spagnolo (%)", 
	B."Tasso di diploma (%)", B."Tasso di povertà (%)"
	FROM "Uccisioni della polizia" A
	LEFT JOIN "Distribuzione di valori per stato e città" B
	ON A."Città" = B."Città" AND A."Stato" = B."Stato");

-- 9.3 Visualizzazione tabella

SELECT * FROM "Uccisioni della polizia (JOIN)";

----------------------------------- 10 Conclusione ------------------------------------

-- 10.1 Elimino le tabelle non neccessarie

DROP TABLE IF EXISTS "JOIN1";
DROP TABLE IF EXISTS "JOIN2";

-- Per questo progetto parte 1 è tutto, nella parte 2 mi occupero dell'esplorazione
-- dei dati


