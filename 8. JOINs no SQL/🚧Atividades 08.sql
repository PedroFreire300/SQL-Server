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

FactStrategyPlan.StrategyPlanKey,
FactStrategyPlan.DateKey,
DimScenario.ScenarioName,
FactStrategyPlan.Amount

FROM FactStrategyPlan
INNER JOIN DimScenario
ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
where ScenarioName is null 


==========================
      Exercício 07
==========================










