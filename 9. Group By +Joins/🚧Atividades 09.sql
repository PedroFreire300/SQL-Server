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

=========================
      Exercício 04
=========================

SELECT TOP (1000) * FROM FactOnlineSales
SELECT TOP (1000) * FROM DimCustomer

A)

SELECT 
    DimCustomer.FirstName AS Nome,
    DimCustomer.LastName AS Sobrenome,
    sum(FactOnlineSales.SalesQuantity) AS Qtd_compras

FROM FactOnlineSales
INNER JOIN DimCustomer
ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
GROUP BY  DimCustomer.FirstName,  DimCustomer.LastName
HAVING DimCustomer.FirstName IS NOT NULL
ORDER BY Qtd_compras Desc

B)

=========================
      Exercício 05
=========================
    
SELECT * FROM FACTONLINESALES
SELECT * FROM DimCustomer

SELECT

DimCustomer.Gender as Genêro,
Sum(FACTONLINESALES.SalesQuantity) as Qtd_Compras

From FACTONLINESALES 
INNER JOIN DimCustomer
ON FACTONLINESALES.CustomerKey = DimCustomer.CustomerKey
GROUP BY DimCustomer.Gender
HAVING DimCustomer.Gender is not null

=========================
      Exercício 06
=========================

SELECT * FROM FACTEXCHANGERATE
SELECT * FROM DimCurrency

SELECT 

DimCurrency.CurrencyDescription,
FACTEXCHANGERATE.AverageRate

FROM FACTEXCHANGERATE
INNER JOIN DimCurrency
ON FACTEXCHANGERATE.CurrencyKey = DimCurrency.CurrencyKey
where FACTEXCHANGERATE.AverageRate BETWEEN 10 and 100
ORDER BY FACTEXCHANGERATE.AverageRate Desc

=========================
      Exercício 07
=========================

SELECT * FROM FactStrategyPlan
SELECT * FROM DimScenario

SELECT

DimScenario.ScenarioName AS 'NAME',
format(Sum(FactStrategyPlan.Amount), 'C') AS 'TOTAL'

FROM FactStrategyPlan
INNER JOIN DimScenario
ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY DimScenario.ScenarioName
HAVING DimScenario.ScenarioName in ('Actual','Budget')
ORDER BY 'TOTAL' DESC

=========================
      Exercício 08
=========================

SELECT * FROM FactStrategyPlan

SELECT DISTINCT 

Datekey AS 'Ano',
FORMAT(sum(amount),'c') AS 'Total'

FROM FactStrategyPlan
GROUP BY Datekey
HAVING Datekey in('2007','2008','2009')

=========================
      Exercício 09
=========================

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT

DPS.ProductSubcategoryName as NomeCategoria,
COUNT (*) as QtdProdutos

FROM DimProduct DP
INNER JOIN DimProductSubcategory DPS
ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
WHERE BrandName = 'Contoso' and ColorName = 'Silver'
GROUP BY DPS.ProductSubcategoryName

