=========================
      Exercício 01
=========================
A)
select
    DC.ChannelName as NomeCanal,
    sum(SalesQuantity) as QtdTotalVendida
from FactSales FC
inner join DimChannel DC
on FC.ChannelKey = DC.ChannelKey
group by ChannelName
order by QtdTotalVendida desc

B)
select
    DS.StoreName as NomeLoja,
    sum(SalesQuantity) as QtdTotalVendida,
    sum(ReturnQuantity) as QtdTotalDevolvida
from FactSales FC
inner join DimStore DS
on FC.StoreKey = DS.StoreKey
group by StoreName

C)
select
    DD.CalendarMonthLabel,
    DD.CalendarYear,
    sum(SalesAmount) as QtdTotalVendida
from FactSales FS
inner join DimDate DD
on FS.DateKey = DD.DateKey
group by  CalendarMonthLabel,CalendarYear
order by CalendarYear,dbo.NumAno(CalendarMonthLabel)

=========================
      Exercício 02
=========================
A)
select
    DP.ColorName as Cor,
    sum(SalesQuantity) as QtdTotal
from FactSales FS
inner join DimProduct DP
on FS.Productkey = DP.ProductKey
group by ColorName

B)
with CTE_Filto3k as (
select
    DP.ColorName as Cor,
    sum(SalesQuantity) as QtdTotal
from FactSales FS
inner join DimProduct DP
on FS.Productkey = DP.ProductKey
group by ColorName )
select * from CTE_Filto3k
where QtdTotal > 3000000

=========================
      Exercício 03
=========================
select
    DPC.ProductCategoryName as NomeProdutoCategoria,
    sum(SalesQuantity) as QtdTotal
from FactSales FS
inner join DimProduct DP
on FS.ProductKey = DP.ProductKey
inner join DimProductSubcategory DPS
on DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
inner join DimProductCategory DPC
on DPS.ProductCategoryKey = DPC.ProductCategoryKey
group by DPC.ProductCategoryName
order by QtdTotal desc

=========================
      Exercício 04
=========================
A)
select top 1
    DC.CustomerKey,
    concat(FirstName,' ',LastName) as NomeCompleto,
    sum(SalesQuantity) as QtdComprasTotal
from FactOnlineSales FS
inner join DimCustomer DC
on FS.CustomerKey = DC.CustomerKey
where CustomerType = 'Person'
group by concat(FirstName,' ',LastName),DC.CustomerKey
order by QtdComprasTotal desc

B)
with CTE_NomeProduto as (
select top 10
    ProductKey,
    sum( as QtdCompras
from FactOnlineSales
where CustomerKey = 7665
group by ProductKey
order by QtdCompras desc
) select 
    DP.ProductName,
    CTE.QtdCompras
from CTE_NomeProduto CTE
inner join DimProduct DP
on CTE.ProductKey = DP.ProductKey
order by QtdCompras desc

=========================
      Exercício 05
=========================
select
    DC.Gender as Sexo,
    sum(SalesQuantity) as QtdTotal
from FactOnlineSales FS
inner join DimCustomer DC
on FS.CustomerKey = DC.CustomerKey
group by DC.Gender
having DC.Gender is not null

=========================
      Exercício 06
=========================
select  
    DC.CurrencyDescription,
    avg(AverageRate) as TaxaCambioMedia
from FactExchangeRate FC
inner join DimCurrency DC
on FC.CurrencyKey = DC.CurrencyKey
group by DC.CurrencyDescription
having avg(AverageRate) between 10 and 100

=========================
      Exercício 07
=========================
select top 100 * from FactStrategyPlan
select * from DimScenario

select
    DS.ScenarioName as NomeCenario,
    sum(Amount) as Total
from FactStrategyPlan FSP
inner join DimScenario DS
on FSP.ScenarioKey = DS.ScenarioKey
group by DS.ScenarioName
having DS.ScenarioName <> 'Forecast'

=========================
      Exercício 08
=========================
select
    year(DateKey) as Ano,
    sum(Amount) as Total
from FactStrategyPlan
group by year(DateKey)

=========================
      Exercício 09
=========================
select
     ProductSubcategoryName as NomeCategoria,
     count(ProductKey) as QtdProduto
from DimProduct DP
inner join DIMPRODUCTSUBCATEGORY DPC
on DP.ProductSubcategoryKey = DPC.ProductSubcategoryKey
where BrandName = 'Contoso' 
and ColorName = 'Silver'
group by  ProductSubcategoryName

=========================
      Exercício 10
=========================
select
     BrandName as Marca,
     ProductSubcategoryName as NomeCategoria,
     count(ProductKey) as QtdProduto
from DimProduct DP
inner join DIMPRODUCTSUBCATEGORY DPC
on DP.ProductSubcategoryKey = DPC.ProductSubcategoryKey
group by  ProductSubcategoryName,BrandName
order by BrandName




