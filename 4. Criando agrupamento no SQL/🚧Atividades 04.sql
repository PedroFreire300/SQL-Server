=========================
      Exercício 01
=========================
SELECT top (1000) * FROM FactSales

A)

SELECT

channelKey,
sum(SalesQuantity) as Qtd_vendida

FROM FactSales
GROUP BY channelKey

B)

SELECT 

StoreKey,
sum(SalesQuantity) as Qtd_vendida,
sum(ReturnQuantity) as Qtd_devolvida

FROM FactSales
GROUP BY StoreKey
ORDER BY StoreKey ASC

C)

SELECT

channelKey AS Loja,
sum(SalesAmount) as Qtd_vendida

from FactSales
WHERE DateKey LIKE '%2007%'
GROUP BY channelKey
ORDER BY Loja


========================
      Exercício 02
========================

SELECT * from FactSales 

SELECT

ProductKey As 'Produto ID',
sum(SalesAmount) as Total_vendas

From FactSales
GROUP BY ProductKey

A)

SELECT

ProductKey As 'Produto ID',
sum(SalesAmount) as Total_vendas

From FactSales
GROUP BY ProductKey
Having sum(SalesAmount) > 5000000
ORDER BY Total_vendas DESC


B)

SELECT top (10)

ProductKey As 'Produto ID',
sum(SalesAmount) as Total_vendas

From FactSales
GROUP BY ProductKey
ORDER BY Total_vendas DESC

========================
      Exercício 03
========================

A)

SELECT * from FactOnlineSales

SELECT
CustomerKey,
sum(SalesQuantity) as Qtd_maxima


FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY Qtd_maxima DESC

--19037

B)

SELECT top (3)

productKey,
sum(SalesQuantity) as Qtd_maxima

FROM FactOnlineSales
where CustomerKey = 19037
GROUP BY productKey
ORDER BY Qtd_maxima DESC


















