-- EXERCICE BASE CP (SCRIPT FRUIT)
DROP TRIGGER IF EXISTS maj_total;

DELIMITER |
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT; 
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(l.prix*l.quantite)-sum(l.prix*l.quantite)/100*c.remise  
                    FROM lignedecommande l
                    JOIN commande c
                    ON c.id = l.id_commande
                   WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END|

DELIMITER ;

DROP TRIGGER IF EXISTS update_total;

DELIMITER |
CREATE TRIGGER update_total AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT; 
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(l.prix*l.quantite)-sum(l.prix*l.quantite)/100*c.remise  
                    FROM lignedecommande l
                    JOIN commande c
                    ON c.id = l.id_commande
                   WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END|

DELIMITER ;

DROP TRIGGER IF EXISTS update_on_delete_total;

DELIMITER |
CREATE TRIGGER update_on_delete_total AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT; 
        DECLARE tot DOUBLE;
        SET id_c = old.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(l.prix*l.quantite)-sum(l.prix*l.quantite)/100*c.remise  
                    FROM lignedecommande l
                    JOIN commande c
                    ON c.id = l.id_commande
                   WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
END|

DELIMITER ;

-- USEFUL
SHOW TRIGGERS;


--EXERCICE PAPYRUS

CREATE TABLE articles_a_commander (
	id 				INT AUTO_INCREMENT  NOT NULL,
	_date 			DATETIME NOT NULL,
    qte             INT,
    codart          VARCHAR(4),
	PRIMARY KEY (id),
    FOREIGN KEY (codart) REFERENCES produit(codart)
);


DROP TRIGGER IF EXISTS inserer_la_ligne_dans_articles_a_commander;

DELIMITER |
CREATE TRIGGER inserer_la_ligne_dans_articles_a_commander AFTER UPDATE ON produit
    FOR EACH ROW
    BEGIN
        DECLARE produit_id VARCHAR(4); 
        DECLARE quantite DOUBLE;
        SET produit_id = new.codart; -- nous captons le id de produit concerné
        SET quantite = (SELECT stkale - stkphy
                    FROM produit
                   WHERE codart = produit_id); -- on recalcul le total
	 IF (SELECT sum(qte) FROM articles_a_commander) > 0 THEN 
     SET quantite = quantite - (SELECT sum(qte) FROM articles_a_commander);
     END IF;
        
       INSERT INTO articles_a_commander (_date, qte, codart) VALUES (current_date(), quantite, produit_id);
END|

DELIMITER ;
