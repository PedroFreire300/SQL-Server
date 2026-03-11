=========================
      Exercício 01
=========================

A) 

SELECT TOP (1000) * FROM FactSales
SELECT top (1000) * FROM DimChannel

SELECT
    DimChannel.ChannelName AS Nome,
    SUM(FactSales.SalesAmount) AS Qtd_vendas

FROM FactSales
INNER JOIN DimChannel
ON FactSales.ChannelKey = DimChannel.ChannelKey
GROUP BY DimChannel.ChannelName
ORDER BY Qtd_vendas DESC

B)

SELECT TOP (1000) * FROM FactSales
SELECT top (1000) * FROM DimStore

SELECT 
    DimStore.StoreName as Loja,
    sum(FactSales.SalesQuantity) as Total_vendas,
    sum(FactSales.ReturnQuantity) as Devoluções

FROM FactSales
INNER JOIN DimStore
On FactSales.Storekey = DimStore.StoreKey
GROUP BY DimStore.StoreName
ORDER BY Total_vendas Desc

C)

SELECT TOP (1000) * FROM FactSales
SELECT TOP (1000) * FROM DimDate

select 

    DimDate.CalendarYear AS ANO,
    DimDate.CalendarMonthLabel as MÊS,
    sum(FactSales.SalesAmount) as TOTAL

from factsales
inner join DimDate
On FactSales.Datekey = DimDate.Datekey
group by DimDate.CalendarYear, DimDate.CalendarMonthLabel
order by ANO,MÊS desc

=========================
      Exercício 02
=========================

SELECT * FROM DimProduct
SELECT * FROM FactSales

A)

SELECT top (1)
    DimProduct.ColorName AS Cor,
    sum(FactSales.SalesQuantity) AS Qtd_vendida

From DimProduct
INNER JOIN FactSales
On DimProduct.ProductKey = FactSales.ProductKey
GROUP BY DimProduct.ColorName
ORDER by Qtd_vendida desc

B)

SELECT
    DimProduct.ColorName AS Cor,
    sum(FactSales.SalesQuantity) AS Qtd_vendida

From DimProduct
INNER JOIN FactSales
On DimProduct.ProductKey = FactSales.ProductKey
GROUP BY DimProduct.ColorName
HAVING sum(FactSales.SalesQuantity) > 3000000

=========================
      Exercício 03
=========================

SELECT * FROM FactSales
SELECT * FROM DimProduct --tem a chave secundaria de productsubcategorykey
SELECT * FROM DimProductSubCategory -- 

SELECT

    DimProductSubCategory.ProductSubcategoryName as Categoria,
    sum(FactSales.SalesQuantity) as Qtd_vendida

from DimProduct
INNER JOIN DimProductSubCategory
on DimProduct.ProductSubcategoryKey = DimProductSubCategory.ProductSubcategoryKey
    INNER JOIN FactSales
    on DimProduct.ProductKey = FactSales.SalesKey

GROUP BY DimProductSubCategory.ProductSubcategoryName




    


    