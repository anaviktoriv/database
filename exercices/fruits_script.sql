DROP DATABASE IF EXISTS cp;

CREATE DATABASE cp;

USE cp;

CREATE TABLE client (
	id 				INT AUTO_INCREMENT  NOT NULL,
	nom 			VARCHAR(30) NOT NULL,
	prenom 			VARCHAR(30) NOT NULL,
	adresse 		VARCHAR(30) NOT NULL,
	ville 			VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE produit (
	id 				INT AUTO_INCREMENT NOT NULL,
	designation 	VARCHAR(30),
	prix_achat 		DOUBLE NOT NULL,
	prix_vente 		DOUBLE NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE commande (
	id 				INT AUTO_INCREMENT NOT NULL,
	id_client 		INT ,
	date_commande 	DATETIME DEFAULT NOW(),
	remise 			INT NOT NULL,
	total			DOUBLE,
	PRIMARY KEY (id),
	FOREIGN KEY (id_client) REFERENCES client(id)
);

CREATE TABLE lignedecommande (
	id_commande 	INT,
	id_produit 		INT,
	quantite 		INT,
	prix		 	DOUBLE,
	FOREIGN KEY (id_commande) REFERENCES commande(id),
	FOREIGN KEY (id_produit) REFERENCES produit(id)
);


INSERT INTO client (nom, prenom, adresse, ville) VALUES ('dupontel', 'bernard', 'rue du bas', 'flichcourt');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('gates', 'bill', 'rue du haut', 'amiens');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('apple', 'alfred', 'rue du milieu', 'abbeville');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('bb', 'raoul', 'rue du bas', 'dreuil');
INSERT INTO client (nom, prenom, adresse, ville) VALUES ('dupontel', 'jacques', 'rue du bas', 'paris');

INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('pomme', 1, 2);
INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('poire', 1, 3);
INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('pêche', 2, 4);
INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('mango', 3, 6);
INSERT INTO produit (designation, prix_achat, prix_vente) VALUES ('kiwi', 1, 3);

INSERT INTO commande (id_client, date_commande, remise) VALUES (2, '2018-09-01', 50);

INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 1, 2, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 2, 3, 3);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 5, 5, 3);