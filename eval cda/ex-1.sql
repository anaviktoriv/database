DROP DATABASE IF EXISTS ex;

CREATE DATABASE ex;

USE ex;

CREATE TABLE client
(
    cli_num INT AUTO_INCREMENT NOT NULL,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(30)

    ,CONSTRAINT cli_num_PK PRIMARY KEY (cli_num) 
);

CREATE TABLE commande
(
    com_num INT AUTO_INCREMENT NOT NULL,
    com_date DATETIME,
    com_obs VARCHAR(50),
    cli_num INT
    
    ,CONSTRAINT com_num_PK PRIMARY KEY (com_num)
    ,CONSTRAINT cli_num_clent_FK FOREIGN KEY (cli_num) REFERENCES client(cli_num)

);

CREATE TABLE produit
(
pro_num INT AUTO_INCREMENT NOT NULL,
pro_libelle VARCHAR(50),
pro_descroption VARCHAR(50)

, CONSTRAINT pro_num_PK PRIMARY KEY (pro_num)
);

CREATE TABLE quantite
(
com_num INT NOT NULL,
pro_num INT NOT NULL,
est_qte INT

,CONSTRAINT quantite_commande_produit_PK PRIMARY KEY (com_num, pro_num)
,CONSTRAINT quantite_commande_FK FOREIGN KEY (com_num) REFERENCES commande(com_num)
,CONSTRAINT quantite_produit_FK FOREIGN KEY (pro_num) REFERENCES produit(pro_num)

);

    CREATE INDEX client_cli_nom ON client(cli_nom);