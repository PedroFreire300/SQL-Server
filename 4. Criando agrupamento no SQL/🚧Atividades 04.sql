=========================
      Exercício 01
=========================
SELECT * FROM FactSales

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

========================
      Exercício 02
========================



