drop database if exists exemple;
create database exemple;

use exemple;


CREATE TABLE dept (
	nodept 		varchar(50) NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	noregion 	varchar(50) NOT NULL
);

CREATE TABLE employe(
	noemp 		int NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	prenom 		varchar(50) NOT NULL,
	dateemb 	datetime NOT NULL,
	nosup 		varchar(50) NULL,
	titre 		varchar(50) NOT NULL,
	nodep 		varchar(50) NOT NULL REFERENCES dept(nodept),
	salaire 	decimal(18, 0) NOT NULL,
	tauxcom 	decimal(18, 0) NULL
);



INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('10', 'finance', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('20', 'atelier', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('30', 'atelier', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('31', 'vente', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('32', 'vente', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('33', 'vente', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('34', 'vente', '4');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('35', 'vente', '5');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('41', 'distribution', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('42', 'distribution', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('43', 'distribution', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('44', 'distribution', '4');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('45', 'distribution', '5');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('50', 'administration', '1');




INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (1, 'patamob', 'adhémar', '20000326', NULL, 'président', '50', 50000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (2, 'zeublouse', 'agathe', '20000415', '1', 'dir.distrib', '41', 35000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (3, 'kuzbidon', 'alex', '20000505', '1', 'dir.vente', '31', 34000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (4, 'locale', 'anasthasie', '20000525', '1', 'dir.finance', '10', 36000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (5, 'teutmaronne', 'armand', '20000614', '1', 'dir.administratif', '50', 36000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (6, 'zoudanlkou', 'debbie', '20000704', '2', 'chef entrepot', '41', 25000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (7, 'rivenbusse', 'elsa', '20000724', '2', 'chef entrepot', '42', 24000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (8, 'ardelpic', 'helmut', '20000813', '2', 'chef entrepot', '43', 23000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (9, 'peursconla', 'humphrey', '20000902', '2', 'chef entrepot', '44', 22000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (10, 'vrante', 'helena', '20000922', '2', 'chef entrepot', '45', 21000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (11, 'melusine', 'enfaillite', '20001012', '3', 'représentant', '31', 25000, 10);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (12, 'eurktumeme', 'odile', '20001101', '3', 'représentant', '32', 26000, 12);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (13, 'hotdeugou', 'olaf', '20001121', '3', 'représentant', '33', 27000, 10);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (14, 'odlavieille', 'pacome', '20001211', '3', 'représentant', '34', 25000, 15);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (15, 'amartakaldire', 'quentin', '20001221', '3', 'représentant', '35', 23000, 17);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (16, 'traibien', 'samira', '20001231', '6', 'secrétaire', '41', 15000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (17, 'fonfec', 'sophie', '20010110', '6', 'secrétaire', '41', 14000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (18, 'fairent', 'teddy', '20010120', '7', 'secrétaire', '42', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (19, 'blaireur', 'terry', '20010209', '7', 'secrétaire', '42', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (20, 'ajerre', 'tex', '20010209', '8', 'secrétaire', '43', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (21, 'chmonfisse', 'thierry', '20010219', '8', 'secrétaire', '43', 12000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (22, 'phototetedemort', 'thomas', '20010219', '9', 'secrétaire', '44', 22500, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (23, 'kaecoute', 'xavier', '20010301', '9', 'secrétaire', '34', 11500, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (24, 'adrouille-toutltan', 'yves', '20010311', '10', 'secrétaire', '45', 11000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (25, 'anchier', 'yvon', '20010321', '10', 'secrétaire', '45', 10000, NULL);


 ------------------------------------------------------------------------------------


 --ex2------------------------------------------------
 SELECT * FROM dept

 --ex3------------------------------------------------

SELECT nom, dateemb, nosup, nodep, salaire
FROM employe;

SELECT dept.nom, dateemb, nosup, nodep, salaire 
FROM dept, employe

---ex4-------------------------------------------------

SELECT titre
FROM employe;

--ex5--------------------------------------------------

SELECT titre 
FROM employe 
WHERE titre = 'président';

SELECT DISTINCT titre 
FROM employe 

--ex6--------------------------------------------------

SELECT nom, noemp, nodep
FROM employe
WHERE titre = "secrétaire"

--ex7--------------------------------------------------

SELECT nom, nodep
FROM employe
WHERE nodep > 40

--ex8--------------------------------------------------

SELECT nom, prenom
FROM employe
WHERE nom < prenom

--ex9--------------------------------------------------

SELECT nom, salaire, nodep
FROM employe
WHERE titre = "représentant" AND nodep = 35 AND salaire > 20000

--ex10--------------------------------------------------

SELECT nom, salaire, nodep
FROM employe
WHERE titre = "représentant" OR titre = "président"

--ex11--------------------------------------------------

SELECT nom, titre, salaire, nodep
FROM employe
WHERE nodep = 34 AND (titre = "représentant" OR titre = "secrétaire")

--ex12--------------------------------------------------

SELECT nom, titre, nodep, salaire
FROM employe
WHERE (titre = "représentant" OR titre = "secrétaire") AND nodep IN ("34")


--ex13--------------------------------------------------

SELECT nom, salaire
FROM employe
WHERE salaire BETWEEN 20000 AND 30000

--ex15--------------------------------------------------

SELECT nom
FROM employe
WHERE nom LIKE "h%"

--ex16--------------------------------------------------

SELECT nom
FROM employe
WHERE nom LIKE "%n"

--ex17--------------------------------------------------

SELECT nom
FROM employe
WHERE nom LIKE "__u%"

--ex18--------------------------------------------------

SELECT salaire, nom
FROM employe
WHERE nodep in ("41")
ORDER BY salaire

--ex19--------------------------------------------------

SELECT salaire, nom
FROM employe
WHERE nodep in ("41")
ORDER BY salaire DESC

--ex20--------------------------------------------------

SELECT titre, salaire, nom
FROM employe
ORDER BY titre, salaire DESC

--ex21--------------------------------------------------

SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom

--ex22--------------------------------------------------

SELECT nom, salaire,  tauxcom, titre
FROM employe
WHERE tauxcom IS NULL


--ex23--------------------------------------------------

SELECT nom, salaire,  tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL


--ex24--------------------------------------------------

SELECT nom, salaire,  tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL AND tauxcom < 15


--ex25--------------------------------------------------

SELECT nom, salaire,  tauxcom, titre
FROM employe
WHERE tauxcom IS NOT NULL AND tauxcom > 15

--ex26--------------------------------------------------

SELECT nom, salaire,  tauxcom, tauxcom*salaire AS commission
FROM employe
WHERE tauxcom IS NOT NULL

--ex27--------------------------------------------------

SELECT nom, salaire,  tauxcom, tauxcom*salaire AS commission
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom

--ex28--------------------------------------------------

SELECT CONCAT (nom, prenom) AS concatenatedname
FROM employe

--ex29--------------------------------------------------

SELECT SUBSTRING(nom, 1, 5)
FROM employe

--ex30--------------------------------------------------

SELECT nom, LOCATE("r", nom) AS rang
FROM employe

--ex31--------------------------------------------------

SELECT nom, UPPER(nom), LOWER(nom)
FROM employe
WHERE nom = "vrante"

--ex32--------------------------------------------------

SELECT nom, LENGTH(nom)
FROM employe


-----JOINTURES-----------------------------------------

SELECT prenom, noregion, e.nodep
FROM employe e
JOIN dept d
ON e.nodep = d.nodept


SELECT nodept, d.nom, e.nom
FROM employe e
JOIN dept d
ON e.nodep = d.nodept
ORDER BY nodept


SELECT d.nom, e.nom
FROM employe e
JOIN dept d
ON e.nodep = d.nodept
WHERE d.nom = "distribution"


SELECT e.nom, e.salaire, p.nom, p.salaire
FROM employe e
JOIN employe p
ON e.nosup = p.noemp
WHERE e.salaire > p.salaire


SELECT nom, titre
FROM employe
WHERE titre = (
	SELECT titre
	FROM employe
	WHERE nom = "Amartakaldire"
)

SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ANY (
	SELECT salaire
	FROM employe
	WHERE nodep = 31
)
ORDER BY nodep, salaire


SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ALL (
	SELECT salaire
	FROM employe
	WHERE nodep = 31
)
ORDER BY nodep, salaire


SELECT nom, titre
FROM employe
WHERE nodep = 31 AND titre IN (
	SELECT titre
	FROM employe
	WHERE nodep = 32
)


SELECT nom, titre
FROM employe
WHERE nodep = 31 AND titre NOT IN (
	SELECT titre
	FROM employe
	WHERE nodep = 32
)

SELECT nom, titre, salaire
FROM employe
WHERE titre = (
	SELECT titre
	FROM employe
	WHERE nom = "fairent"
) AND salaire = (
	SELECT salaire
	FROM employe
	WHERE nom = "fairent"
) AND nom NOT IN ("fairent")


SELECT nodept, dept.nom, employe.nom
FROM dept
LEFT JOIN employe
ON nodept = nodep
ORDER BY nodept


SELECT titre, COUNT(nom)
FROM employe
GROUP BY titre


SELECT noregion, AVG(salaire), SUM(salaire)
FROM employe
JOIN dept
ON nodept = nodep
GROUP BY noregion

SELECT nodep, COUNT(*)
FROM employe
GROUP BY nodep
HAVING COUNT(*) > 3


