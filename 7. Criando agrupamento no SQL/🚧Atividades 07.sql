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

========================
      Exercício 04
========================

SELECT * FROM DimProduct

A)

SELECT

BrandName as 'Marca',
Count(ProductKey) as 'Qtd_Total'

FROM DimProduct
GROUP BY Brandname

B)

SELECT

ClassName as 'Classe',
AVG(UnitPrice) as 'Média_unit'

FROM DimProduct
GROUP BY ClassName

C)

SELECT

ColorName as 'Cor',
Sum(Weight) as 'Peso'

FROM DimProduct
GROUP BY ColorName
ORDER BY Peso Desc

========================
      Exercício 05
========================

SELECT * FROM DimProduct

SELECT 

StockTypeName,
sum(Weight) as Peso

From DimProduct 
GROUP BY StockTypeName,BrandName
HAVING BrandName in ('Contoso')
ORDER BY StockTypeName DESC

========================
      Exercício 06
========================

SELECT * FROM DimProduct

SELECT  

BrandName as 'Marca',
COUNT(DISTINCT ColorName) as 'Qtd_cores'

From DimProduct
GROUP BY BrandName

========================
      Exercício 07
========================

SELECT * FROM DimCustomer

SELECT

Gender AS "Genêro",
FORMAT(AVG(YearlyIncome),'C') AS 'Média Salarial'

FROM DimCustomer
GROUP BY Gender
HAVING Gender IS NOT NULL

========================
      Exercício 08
========================

SELECT * FROM DimCustomer

SELECT 

count(*) AS 'Qtd_clientes',
Education AS 'Escolaridade',
FORMAT(AVG(YearlyIncome),'C') AS 'Média Salarial'

FROM DimCustomer
GROUP BY Education
HAVING Education is not null



