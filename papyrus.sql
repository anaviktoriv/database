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
    numfou VARCHAR(25) NOT NULL,
    nomfou VARCHAR(25) NOT NULL,
    ruefou VARCHAR(50) NOT NULL,
    posfou CHAR(5) NOT NULL,
    vilfou VARCHAR(50) NOT NULL,
    confou VARCHAR(15) NOT NULL,
    satisf TINYINT(2)

    ,
    CONSTRAINT numfou_PK PRIMARY KEY (numfou)
);

-- table ???

CREATE TABLE entcom
(
    numcom INT(10)
    AUTO_INCREMENT NOT NULL,
    obscom VARCHAR
    (50),
    datcom DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numfou VARCHAR
    (25)
    ,
    CONSTRAINT numcom_PK PRIMARY KEY
    (numcom)
    ,
    CONSTRAINT entcom_fournis_FK FOREIGN KEY
    (numfou) REFERENCES fournis
    (numfou)
);

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