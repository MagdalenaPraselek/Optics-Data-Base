--Top 10 customers
SELECT TOP 10 CustomerID, SUM(TotalAmount) AS Income
FROM Orders
GROUP BY CustomerID
ORDER BY Income DESC;

--3 Top sold frames
SELECT TOP 3 f.Model, SUM(TotalAmount) AS Income
FROM Frames as f JOIN Orders AS o ON f.FrameID = o.FrameID
GROUP BY f.Model
ORDER BY Income DESC;

--Top 3 Lenses sold
SELECT TOP 3 l.Name, COUNT(o.OrderID) AS Sold_quantity
FROM Lenses AS l JOIN Orders AS o ON l.LensID = o.LensID
GROUP BY l.Name
ORDER BY Sold_quantity DESC;

--Customers who paid with card
SELECT (c.Name + ' ' + c.LastName) AS Name
FROM Orders AS o JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE o.PaymentFormID = 1;

--Customers who have prescription but have not bought spectacles
SELECT (c.Name + ' ' + c.LastName) AS Name
FROM Customers AS c 
JOIN Prescriptions AS p ON c.CustomerID = p.CustomerID
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--Customers who bought more than 1 pair of spectacles
SELECT c.Name + ' ' + c.LastName AS Name, COUNT(o.OrderID) AS OrderQuantity
FROM Customers AS c JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.Name, c.LastName
HAVING COUNT(o.OrderID) > 1;

--Frames that were sold more than once
SELECT f.Model, COUNT(o.OrderID) AS OrderQuantity
FROM Frames AS f JOIN Orders AS o ON f.FrameID = o.FrameID
GROUP BY f.Model
HAVING COUNT(o.OrderID) > 1
ORDER BY OrderQuantity DESC

--Day with higher income
SELECT TOP 1 OrderDate
FROM Orders
GROUP BY OrderDate
ORDER BY SUM(TotalAmount) DESC

--Day of week with higher income
SELECT TOP 1 DATENAME(dw, OrderDate) AS DayOfWeek, SUM(TotalAmount) AS Income
FROM Orders
GROUP BY DATENAME(dw, OrderDate)
ORDER BY SUM(TotalAmount) DESC







