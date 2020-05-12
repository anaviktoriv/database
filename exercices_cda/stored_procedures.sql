-- EX 1 Afficher le code des fournisseurs pour lesquels des commandes ont été passées

DELIMITER |
DROP PROCEDURE IF EXISTS Lst_fournis;
CREATE PROCEDURE Lst_fournis()
BEGIN
SELECT DISTINCT numfou
FROM entcom;
END |

DELIMITER ;

CALL Lst_fournis;

--EX 2 Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et
-- le sous total = quantité commandée * Prix unitaire)
DROP PROCEDURE IF EXISTS Lst_Commandes;

DELIMITER |
CREATE PROCEDURE Lst_Commandes(IN word Varchar(50))
BEGIN
SELECT e.numcom, f.nomfou, p.libart, l.qtecde*l.priuni AS somme
FROM produit p
JOIN ligcom l
ON p.codart = l.codart
JOIN entcom e
ON l.numcom = e.numcom
JOIN fournis f
ON e.numfou = f.numfou
WHERE e.obscom LIKE word;

END |

DELIMITER ;

CALL Lst_Commandes('%Urgent%');

--EX 3
-- création d'une procédure stockée avec plusieurs paramètres
-- Créer la procédure stockée CA_ Fournisseur, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée (cette requête sera construite à partir de la requête n°19).
-- On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table FOURNIS.
-- 19.Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix
-- indiqués sont hors taxes et que le taux de TVA est 20%.
-- Testez cette procédure avec différentes valeurs des paramètres.

DROP PROCEDURE IF EXISTS CA_Fournisseur;

DELIMITER |
CREATE PROCEDURE CA_Fournisseur(IN chosenYear Varchar(50), IN supplier_id Varchar(50))
BEGIN
SELECT sum(l.qtecde*l.priuni)+(sum(l.qtecde*l.priuni)/100*20) AS somme
FROM fournis f
JOIN entcom e
ON f.numfou = e.numfou
JOIN ligcom l
ON e.numcom = l.numcom
WHERE extract(year from e.datcom) = chosenYear AND f.numfou = supplier_id;

END |

DELIMITER ;

CALL CA_Fournisseur('2018', '00120');

-- Lister les procédures stockées :

SHOW PROCEDURE STATUS;