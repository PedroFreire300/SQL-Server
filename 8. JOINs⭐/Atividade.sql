=========================
      Exercício 01
=========================

SELECT * FROM DimProductSubcategory
SELECT * FROM DimProduct

SELECT

    DimProduct.ProductName,
    DimProduct.ProductDescription,

    DimProductSubcategory.ProductSubcategoryName

From DimProduct
INNER JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

--Testes
where ProductSubcategoryName in ('MP4&MP3', 'Recording Pen')

========================
      Exercício 02
========================

SELECT * FROM DimProductSubcategory
SELECT * FROM DimProductCategory

SELECT

    DimProductSubcategory.ProductSubcategoryName,
    DimProductCategory.ProductCategoryName

From DimProductSubcategory
LEFT JOIN DimProductCategory
On DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

=========================
      Exercício 03
=========================

select * from DimStore
select * from DimGeography

SELECT

    DimStore.Storekey,
    DimStore.StoreName,
    DimStore.EmployeeCount,
    DimGeography.ContinentName,
    DimGeography.RegionCountryName

From DimStore
LEFT JOIN DimGeography
on dimStore.GeographyKey = DimGeography.GeographyKey

--Testes
ORDER BY Storekey ASC

==========================
      Exercício 04
==========================

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT

    DimProduct.ProductName,
    DimProductSubcategory.ProductSubcategoryName,
    DimProductSubcategory.LoadDate,
    DimProductSubcategory.UpdateDate

From DimProduct
LEFT JOIN DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategorykey

==========================
      Exercício 05
==========================

SELECT top (100) * FROM FactStrategyPlan
SELECT * FROM DimAccount

SELECT 

    FactStrategyPlan.StrategyPlanKey,
    FactStrategyPlan.DateKey,
    DimAccount.AccountName,
    FactStrategyPlan.Amount

From FactStrategyPlan
INNER JOIN DimAccount
ON FactStrategyPlan.AccountKey = DimAccount.AccountKey


==========================
      Exercício 06
==========================

SELECT * FROM FactStrategyPlan

SELECT * FROM DimScenario 

SELECT 

FactStrategyPlan.StrategyPlanKey AS 'ID',
FactStrategyPlan.DateKey AS 'Data',
DimScenario.ScenarioName AS 'SlA',
FORMAT(FactStrategyPlan.Amount,'C') AS 'Montante'

FROM FactStrategyPlan
INNER JOIN DimScenario
ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
ORDER BY 'ID' ASC

==========================
      Exercício 07
==========================

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT 

ProductSubcategoryName

FROM DimProduct 
RIGHT JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductName IS NULL

==========================
      Exercício 08
==========================

SELECT * FROM DimProduct 
SELECT * FROM DimChannel
SELECT * FROM FactSales

SELECT 

DimProduct.BrandName AS 'Marca',
DimChannel.ChannelName AS 'Canal de Venda'

FROM FactSales
INNER JOIN DimChannel
ON FactSales.ChannelKey = DimChannel.ChannelKey
INNER JOIN DimProduct
ON FactSales.Productkey = DimProduct.ProductKey
GROUP BY DimProduct.BrandName,DimChannel.ChannelName
HAVING Brandname in ('Contoso','Fabrikam','Litware')

==========================
      Exercício 09
==========================

SELECT * FROM FactOnlineSales --Tabela Principal (Chave estrangeira)
SELECT * FROM DimPromotion -- Tabeça Segundaria (Chave primaria)

SELECT TOP (10000)

FOS.OnlineSalesKey,
FOS.DateKey,
DP.PromotionName,
FOS.SalesAmount

FROM FactOnlineSales FOS
INNER JOIN DimPromotion DP
on FOS.PromotionKey = DP.PromotionKey
WHERE PromotionName = 'No Discount'
ORDER BY DateKey ASC

==========================
      Exercício 10
==========================

SELECT TOP (1000) * FROM FactSales --Tabela principal
SELECT * FROM DimChannel --ChannelKey
SELECT * FROM DimStore --Storekey
SELECT * FROM DimProduct --ProductKey

SELECT

FS.Saleskey,
DC.ChannelName,
DS.StoreName,
DP.ProductName,
FS.SalesAmount

FROM FactSales FS
INNER JOIN DimChannel DC 
ON FS.ChannelKey = DC.ChannelKey
INNER JOIN DimStore DS
ON FS.Storekey = DS.Storekey
INNER JOIN DimProduct DP 
ON FS.ProductKey = DP.ProductKey

ORDER BY SalesAmount Desc

