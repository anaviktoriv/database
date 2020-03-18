DROP DATABASE IF EXISTS papyrus;

CREATE DATABASE papyrus;

USE papyrus;


CREATE TABLE produit
(
    codart CHAR(4) NOT NULL,
    libart VARCHAR(30) NOT NULL,
    stkale INT NOT NULL,
    stkphy INT NOT NULL,
    qteann INT NOT NULL,
    unimes CHAR(5) NOT NULL
    ,
    CONSTRAINT codart_PK PRIMARY KEY (codart)
);

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


CREATE TABLE entcom
(
    numcom INT AUTO_INCREMENT NOT NULL,
    obscom VARCHAR(50),
    datcom DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numfou INT
    
    ,CONSTRAINT numcom_PK PRIMARY KEY(numcom)
    ,CONSTRAINT entcom_fournis_FK FOREIGN KEY (numfou) REFERENCES fournis(numfou)
);

    CREATE TABLE ligcom
    (
        numlig TINYINT(3) NOT NULL,
        qtecde INT NOT NULL,
        priuni VARCHAR(50) NOT NULL,
        qteliv INT,
        derliv DATETIME(2) NOT NULL,
        numcom INT NOT NULL,
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
        delliv SMALLINT NOT NULL,
        qte1 INT NOT NULL,
        prix1 VARCHAR(50) NOT NULL,
        qte2 INT,
        prix2 VARCHAR(50),
        qte3 INT,
        prix3 VARCHAR(50),
        numfou INT NOT NULL,
        codart CHAR(4) NOT NULL

    ,
        CONSTRAINT vente_produit_fournis_PK PRIMARY KEY (numfou, codart)
    ,
        CONSTRAINT vente_fournis_FK FOREIGN KEY(numfou) REFERENCES fournis(numfou)
    ,
        CONSTRAINT vente_produit_FK FOREIGN KEY(codart) REFERENCES produit(codart)
    );


CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON papyrus TO 'newuser'@'localhost';
SHOW GRANTS FOR 'newuser'@'localhost'; 