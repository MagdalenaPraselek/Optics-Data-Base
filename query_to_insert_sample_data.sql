SELECT TOP 10 CustomerID
FROM (
    SELECT c.CustomerID, SUM(o.TotalAmount) AS SumTotalAmount
    FROM Customers AS c
    INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID
    ) AS CustomerTotalPrice
ORDER BY CustomerID DESC;