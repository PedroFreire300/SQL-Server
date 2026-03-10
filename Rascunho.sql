SELECT * from FactSales

SELECT top (20)
    ProductKey as ProductID,
    SUM(SalesAmount) AS TotalSales
FROM FactSales
GROUP BY ProductKey
ORDER BY ProductKey DESC
HAVING TotalSales > 10000


