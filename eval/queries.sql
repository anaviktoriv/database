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


--Questions: Why when I use o.customerID to group I cannot leave it out of select and get an error that it contains nonagregated column which is not functionaly dependent on columns in Group by clause:
-- SELECT c.CompanyName, o.customerID, sum(UnitPrice*Quantity) AS total, c.country
-- FROM customers c
-- JOIN orders o 
-- ON c.CustomerID = o.CustomerID
-- JOIN `order details` od
-- ON o.OrderID = od.OrderID
-- Group by o.customerID
-- having sum(UnitPrice*Quantity) > 30000
-- ORDER BY sum(UnitPrice*Quantity) DESC


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

--I would use ceil