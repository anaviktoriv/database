DROP DATABASE IF EXISTS papyrus;

CREATE DATABASE papyrus;

USE papyrus;

-- table produit

CREATE TABLE produit
(
    codart CHAR(4) NOT NULL,
    libart VARCHAR(30) NOT NULL,
    stkale INT(10) NOT NULL,
    stkphy INT(10) NOT NULL,
    qteann INT(10) NOT NULL,
    unimes CHAR(5) NOT NULL
    ,
    CONSTRAINT codart_PK PRIMARY KEY (codart)
);

-- table fournisseur

CREATE TABLE fournis
(
    numfou INT NOT NULL,
    nomfou VARCHAR(25) NOT NULL,
    ruefou VARCHAR(50) NOT NULL,
    posfou CHAR(5) NOT NULL,
    vilfou VARCHAR(50) NOT NULL,
    confou VARCHAR(15) NOT NULL,
    satisf TINYINT(2)

    ,
    CONSTRAINT numfou_PK PRIMARY KEY (numfou)
);


---------------------------------------------------------------------------------------------------------------------------
INSERT INTO fournis (numfou, nomfou, ruefou, posfou, vilfou, confou, satisf)
VALUES (120, "GROBRIGAN", "20 rue du papier", "92200", "papercity", "Georges", 08),
       (540, "ECLIPSE ", "53, rue laisse flotter les rubans ", "78250 ", "Bugbugville", "Nestor", 07),
       (8700, "MEDICIS", "120 rue des plantes", "75014", "Paris", "Lison", NULL),
       (9120, "DISCOBOL", "11 rue des sports", "85100", "La Roche sur Yon", "Hercule", 08),
	(9150, 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 5),
	(9180, 'HURRYTAPE', '68 boulevard des octets', '4044', 'Dumpville', 'Track', 0);





-- table ???

CREATE TABLE entcom
(
    numcom INT(10) AUTO_INCREMENT NOT NULL,
    obscom VARCHAR(50),
    datcom DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numfou VARCHAR(25)
    
    ,CONSTRAINT numcom_PK PRIMARY KEY(numcom)
    ,CONSTRAINT entcom_fournis_FK FOREIGN KEY (numfou) REFERENCES fournis(numfou)
);

INSERT INTO entcom (numcom, obscom, datcom, numfou) VALUES
	(70010, '', '2018-04-23 15:59:51', 120),
	(70011, 'Commande urgente', '2018-04-23 15:59:51', 540),
	(70020, '', '2018-04-23 15:59:51', 9120),
	(70025, 'Commande urgente', '2018-04-23 15:59:51', 9150),
	(70210, 'Commande cadencée', '2018-04-23 15:59:51', 120),
	(70250, 'Commande cadencée', '2018-04-23 15:59:51', 8700),
	(70300, '', '2018-04-23 15:59:51', 9120),
	(70620, '', '2018-04-23 15:59:51', 540),
	(70625, '', '2018-04-23 15:59:51', 120),
	(70629, '', '2018-04-23 15:59:51', 9180);





    -- create table ??? !!!!!datetime as well as time and time stamp can have  fractional seconds part (up to 6)
    CREATE TABLE ligcom
    (
        numlig TINYINT(3) NOT NULL,
        qtecde INT(10) NOT NULL,
        priuni VARCHAR(50) NOT NULL,
        qteliv INT(10),
        derliv DATETIME(2) NOT NULL,
        numcom INT(10) NOT NULL,
        codart CHAR(4) NOT NULL
    ,
        CONSTRAINT numlig_PK PRIMARY KEY(numlig)
    ,
        CONSTRAINT ligcom_entcom_FK FOREIGN KEY(numcom) REFERENCES entcom(numcom)
    ,
        CONSTRAINT ligcom_produit_FK FOREIGN KEY(codart) REFERENCES produit(codart)
    );


    CREATE TABLE vente
    (
        delliv SMALLINT(5) NOT NULL,
        qte1 INT(10) NOT NULL,
        prix1 VARCHAR(50) NOT NULL,
        qte2 INT(10),
        prix2 VARCHAR(50),
        qte3 INT(10),
        prix3 VARCHAR(50),
        numfou VARCHAR(25) NOT NULL,
        codart CHAR(4) NOT NULL

    ,
        CONSTRAINT vente_produit_fournis_PK PRIMARY KEY (numfou, codart)
    ,
        CONSTRAINT vente_fournis_FK FOREIGN KEY(numfou) REFERENCES fournis(numfou)
    ,
        CONSTRAINT vente_produit_FK FOREIGN KEY(codart) REFERENCES produit(codart)
    );

    CREATE INDEX entcom_numfou
ON entcom (numfou);


    DELIMITER $$
CREATE
TRIGGER check_satisf BEFORE INSERT
ON fournis
FOR EACH ROW BEGIN
    IF NEW.satisf < 0
        OR NEW.satisf > 10
THEN 
SET NEW.satisf = NULL;
END IF;
END $$
DELIMITER ;

CREATE USER "user2"@"localhost" IDENTIFIED BY "123"

GRANT ALL PRIVILEGES ON papyrus TO "user2"@"localhost"
IDENTIFIED BY "123";

GRANT select
ON papyrus
TO user2
IDENTIFIED BY "123";