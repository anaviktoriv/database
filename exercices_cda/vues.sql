-- EX 2 vues sur la base apapyrus

-- 1
DROP VIEW IF EXISTS v_GlobalCde;
CREATE VIEW v_GlobalCde AS
SELECT codart, qtecde as QteTot, qtecde*priuni as PrixTot
FROM ligcom;

SELECT * FROM v_GlobalCde;

-- 2
DROP VIEW IF EXISTS v_VentesI100;
CREATE VIEW v_VentesI100 AS
SELECT * FROM ligcom
WHERE codart = "I100";

SELECT * FROM v_VentesI100;

-- 3
DROP VIEW IF EXISTS v_VentesI100Grobrigan;

CREATE VIEW v_VentesI100Grobrigan AS
SELECT * FROM ligcom 
JOIN entcom
USING (numcom)
WHERE codart = "I100" AND numfou = "00120";

SELECT * FROM v_VentesI100Grobrigan
