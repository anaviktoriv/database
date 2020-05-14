-- 1) Requêtes d'intérrogation sur la base NorthWind
-- A partir du document la base Northwind, ecrivrez les requêtes permettants d'obtenir le résultat attendu.


----EX 1 --------------------------------------------------------------

SELECT CompanyName AS "Société", ContactName AS "contact", ContactTitle as "Fonction", Phone as "Téléphone"
FROM customers
WHERE country = "France"

----EX 2 --------------------------------------------------------------

SELECT ProductName AS "Produit", UnitPrice AS "Prix"
FROM products
WHERE SupplierID = (
    SELECT SupplierID
    FROM suppliers
    WHERE CompanyName = "Exotic Liquids"
)


----EX 3 --------------------------------------------------------------

SELECT CompanyName AS "Fournisseur", Count(*) AS "Nbre produit"
FROM suppliers s
JOIN products
USING (SupplierID)
WHERE s.country = "France"
GROUP BY CompanyName
ORDER BY CompanyName DESC



----EX 4 --------------------------------------------------------------

SELECT CompanyName AS "Client", Count(*) AS "Nbre commandes"
FROM customers c
JOIN orders
USING (CustomerID)
WHERE Country = "France"
GROUP BY CompanyName
HAVING Count(*) > 10


----EX 5 --------------------------------------------------------------

SELECT c.CompanyName, sum(UnitPrice*Quantity) AS total, c.country
FROM customers c
JOIN orders o 
ON c.CustomerID = o.CustomerID
JOIN `order details` od
ON o.OrderID = od.OrderID
Group by c.customerID
having sum(UnitPrice*Quantity) > 30000
ORDER BY sum(UnitPrice*Quantity) DESC


----EX 6 --------------------------------------------------------------

SELECT DISTINCT o.shipcountry, s.CompanyName
FROM suppliers s
JOIN products p
	ON s.SupplierID = p.SupplierID
JOIN `order details` od
	ON p.ProductID = od.ProductID
JOIN orders o
	ON od.OrderID = o.OrderID
WHERE s.CompanyName = "Exotic Liquids"
ORDER BY o.ShipCountry



----EX 7 --------------------------------------------------------------

SELECT sum(UnitPrice*Quantity) AS "Montant Ventes 97"
FROM orders o
JOIN `order details` od
    ON o.OrderID = od.OrderID
WHERE extract(year from orderdate) = "1997"


----EX 8 --------------------------------------------------------------

SELECT extract(month from o.OrderDate), sum(UnitPrice*Quantity) AS total
FROM orders o 
JOIN `order details` od
ON o.OrderID = od.OrderID
WHERE OrderDate = ANY (
select OrderDate
From orders
where extract(year from orderdate) = "1997"
)
Group by extract(month from o.OrderDate)
ORDER BY extract(month from o.OrderDate)

----EX 9 --------------------------------------------------------------


SELECT MAX(orderDate) AS "Date de dernière commande"
FROM orders
WHERE CustomerID = (
SELECT CustomerID
FROM customers
WHERE CompanyName = "Du monde entier"
)


----EX 10 --------------------------------------------------------------

SELECT FLOOR(AVG(-(DATEDIFF(orderDAte, ShippedDate)))) AS "Délai moyen de livraison en jours"
From orders

--I would use ceil*:)




-------------------------------------------------------------------------
--2) Procédures stockées
--Codez deux procédures stockées correspondant aux requêtes 9 et 10. Les procédures stockées doivent prendre en compte les éventuels paramètres.


-- requête 9 ------------------------------------------------------------
DROP PROCEDURE IF EXISTS get_year_when_last_ordered_for;

DELIMITER |
CREATE PROCEDURE get_year_when_last_ordered_for (IN customer Varchar(50))
BEGIN
SELECT MAX(orderDate) AS "Date de dernière commande"
FROM orders
WHERE CustomerID = (
SELECT CustomerID
FROM customers
WHERE CompanyName = customer
);

END |

DELIMITER ;

CALL get_year_when_last_ordered_for ('Du monde entier');

-- requête 10 -----------------------------------------------------------

DROP PROCEDURE IF EXISTS get_average_delivery_time;

DELIMITER |
CREATE PROCEDURE get_average_delivery_time ()
BEGIN
SELECT FLOOR(AVG(-(DATEDIFF(orderDAte, ShippedDate)))) AS "Délai moyen de livraison en jours"
From orders;
END |

DELIMITER ;

CALL get_average_delivery_time ();




---------------------EX 3-------------------------

--J'ai créé le tableau pour les messages

CREATE TABLE messages (
id_message INT AUTO_INCREMENT NOT NULL,
message_body VARCHAR(50),

PRIMARY KEY (id_message)
);


--Mon trigger

DROP TRIGGER IF EXISTS check_country;

DELIMITER |
CREATE TRIGGER check_country AFTER INSERT ON `order details`
    FOR EACH ROW
    BEGIN
        DECLARE order_id INT; 
        DECLARE product_id INT;
        DECLARE unit_price DECIMAL(10,4);
        DECLARE quant SMALLINT;
        DECLARE disc DOUBLE;

        DECLARE destination_counry VARCHAR(15);
		DECLARE origin_country VARCHAR(15);
        -- je capte toute les valeurs:
        SET order_id = NEW.OrderID; 
        SET product_id = NEW.ProductID;
        SET unit_price = NEW.UnitPrice;
        SET quant = NEW.Quantity;
        SET disc = NEW.Discount;
        -- je retrouve les pays:
        SET destination_counry = (SELECT DISTINCT Country 
								FROM `order details` od
                                JOIN orders o
                                ON od.OrderID = o.OrderID
                                JOIN customers c
                                ON o.CustomerID = c.CustomerID
                                WHERE o.ORDERID = order_id);
        SET origin_country = (SELECT s.Country 
                    FROM orders o
                    JOIN `order details` od
                     ON od.OrderID = o.OrderID
                    JOIN products p
                    ON od.ProductID = p.ProductID
                    JOIN suppliers s
                    ON p.SupplierID = s.SupplierID
                   WHERE p.ProductID = product_id AND o.OrderID = order_id);
       IF destination_counry = origin_country THEN
INSERT INTO messages (message_body) VALUES('Pays identique');
ELSE 
INSERT INTO messages (message_body) VALUES('Pays differant');
       END IF;            
END|

DELIMITER ;
