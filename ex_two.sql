DROP DATABASE IF EXISTS ski_resort;

CREATE DATABASE ski_resort;

USE ski_resort;

-- create client table

CREATE TABLE client
(
    client_id INT NOT NULL,
    client_adresse VARCHAR(50) NOT NULL,
    client_nom VARCHAR(50) NOT NULL,
    client_prenom VARCHAR(50) NOT NULL
    ,
    CONSTRAINT client_PK PRIMARY KEY (client_id)
);

CREATE TABLE station
(
    station_id INT NOT NULL,
    station_nom VARCHAR(50) NOT NULL
    ,
    CONSTRAINT station_PK PRIMARY KEY(station_id)
);

CREATE TABLE hotel
(
    hotel_id Int NOT NULL,
    hotel_capacite INT NOT NULL,
    hotel_nom VARCHAR(50) NOT NULL,
    hotel_adresse VARCHAR(50) NOT NULL,
    station_id INT NOT NULL
,
    CONSTRAINT hotel_PK PRIMARY KEY (hotel_id)
,
    CONSTRAINT hotel_station_FK FOREIGN KEY (station_id) REFERENCES station(station_id)
);

CREATE TABLE chambre
(
    chambre_id Int NOT NULL,
    chambre_type VARCHAR(50) NOT NULL,
    exposition VARCHAR(50) NOT NULL,
    degre_confort Int NOT NULL,
    chambre_capacite Int NOT NULL,
    hotel_id Int NOT NULL
,
    CONSTRAINT chambre_PK PRIMARY KEY (chambre_id)
,
    CONSTRAINT chambre_hotel_FK FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id)
);

CREATE TABLE reservation
(
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    date_reservation DATE NOT NULL,
    montant_accompte DECIMAL(7,2) NOT NULL,
    prix_total DECIMAL(7,2) NOT NULL,
    chambre_id Int NOT NULL,
    client_id INT NOT NULL

    ,
    CONSTRAINT reservation_chambre_client_PK PRIMARY KEY (chambre_id, client_id)
    ,
    CONSTRAINT reservation_chambre_FK FOREIGN KEY (chambre_id) REFERENCES chambre (chambre_id)
    ,
    CONSTRAINT reservation_client_FK FOREIGN KEY (client_id) REFERENCES client (client_id)


);
