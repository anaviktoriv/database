

--The USE Statement is used to select a database and perform SQL operations into that database. The database remains default until end of session or execution of another USE statement with some other database.---

DROP DATABASE IF EXISTS db_eval;
CREATE DATABASE db_eval;

USE db_eval;


CREATE TABLE client (
    cli_num INT NOT NULL AUTO_INCREMENT,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(50)
    
    ,CONSTRAINT cli_num_PK PRIMARY KEY (cli_num)
);


CREATE TABLE produit (
pro_num INT NOT NULL AUTO_INCREMENT,
pro_libelle VARCHAR(50),
pro_description VARCHAR(50)

,CONSTRAINT pro_num_PK PRIMARY KEY (pro_num)
);



CREATE TABLE commande (
com_num INT NOT NULL AUTO_INCREMENT,
com_date DATETIME,
com_obs VARCHAR(50),
cli_num INT

,CONSTRAINT com_num_PK PRIMARY KEY (com_num)
,CONSTRAINT commande_client_FK FOREIGN KEY (cli_num) REFERENCES client(cli_num)
);


CREATE TABLE est_compose (
est_qte INT,
com_num INT NOT NULL,
pro_num INT NOT NULL

,CONSTRAINT com_num_pro_num_PK PRIMARY KEY (com_num, pro_num)
,CONSTRAINT est_compose_commande_FK FOREIGN KEY (com_num) REFERENCES commande(com_num)
,CONSTRAINT est_compose_produit_FK FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
);

CREATE INDEX client_nom ON client(cli_nom);