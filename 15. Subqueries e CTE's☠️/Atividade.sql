=========================
      Exercício 01
=========================
select * from FactSales
where StoreKey = 
(
select StoreKey 
from DimStore
where StoreName = 'Contoso Orlando Store'
)

=========================
      Exercício 02
=========================
A)
select
    ProductKey,
    ProductName,
    UnitPrice
from DimProduct
where UnitPrice > (
    select
        UnitPrice
    from DimProduct
    where ProductKey = 1893
    )

B)
select
    ProductKey,
    ProductName,
    UnitPrice,
    ( select
        UnitPrice
    from DimProduct
    where ProductKey = 1893 ) as UnitPriceId1893
from DimProduct
where UnitPrice > (
    select
        UnitPrice
    from DimProduct
    where ProductKey = 1893
    )

=========================
      Exercício 03
=========================
select * from DimEmployee
where DepartmentName = (
    select
        DepartmentName
    from DimEmployee
    where concat(FirstName,' ',LastName) = 'Miguel Severino'
    )

=========================
      Exercício 04
=========================
select
    CustomerKey,
    FirstName,
    LastName,
    EmailAddress,
    format(YearlyIncome,'c','Pt-Br') as YearlyIncome
from DimCustomer
where CustomerType = 'Person'
and YearlyIncome > ( 
    select
       avg(YearlyIncome)
    from DimCustomer
    where CustomerType = 'Person'
    )

=========================
      Exercício 05       
=========================
select * from DimCustomer
where CustomerKey in ( 
    select distinct CustomerKey from FactOnlineSales
    where PromotionKey in (
        select PromotionKey from DimPromotion
        where PromotionName = 'Asian Holiday Promotion' ) )
order by CustomerKey asc

=========================
      Exercício 06
=========================
select
    Customerkey,
    CompanyName
from DimCustomer
where CompanyName is not null
and CustomerKey in (
    select
        CustomerKey
    from FactOnlineSales
    group by CustomerKey
    having count(Customerkey) > 3000
    )
order by Customerkey asc

=========================
      Exercício 07
=========================
select
    ProductKey,
    ProductName,
    BrandName,
    UnitPrice,
    (select avg(UnitPrice) from DimProduct) as 'Média de UnitPrice'
from DimProduct

select
    ProductKey,
    ProductName,
    BrandName,
    UnitPrice,
    avg(UnitPrice) over() as 'Média de UnitPrice'
from DimProduct

=========================
      Exercício 08       
=========================
with CTE_8 as (
select
    BrandName,
    count(ProductKey) as QtdProdutos
from DimProduct
group by BrandName )
select
    max(QtdProdutos) as MaiorQtd,
    min(QtdProdutos) as MenorQtd,
    avg(QtdProdutos) as QtdMedia
from CTE_8

=========================
      Exercício 09       
=========================
with CTE_QtdProdutosPorMarca as (
select
    BrandName,
    count(ProductKey) as QtdProdutos
from DimProduct
group by BrandName )
select max(QtdProdutos) as MaiorQtdProdutos
from CTE_QtdProdutosPorMarca

=========================
      Exercício 10       
=========================
WITH CTE_ProdutosAdventureWorks AS
(
    SELECT
        ProductKey,
        ProductName,
        ProductSubcategoryKey,
        BrandName,
        UnitPrice
    FROM DimProduct
    WHERE BrandName = 'Adventure Works'
),
CTE_CategoriaTelevisionsEMonitors AS
(
    SELECT
        ProductSubcategoryKey,
        ProductSubcategoryName
    FROM DimProductSubcategory
    WHERE ProductSubcategoryName IN ('Televisions', 'Monitors')
)
SELECT
    PA.ProductKey,
    PA.ProductName,
    PA.ProductSubcategoryKey,
    CT.ProductSubcategoryName,
    PA.BrandName,
    PA.UnitPrice
FROM CTE_ProdutosAdventureWorks PA
INNER JOIN CTE_CategoriaTelevisionsEMonitors CT
    ON PA.ProductSubcategoryKey = CT.ProductSubcategoryKey
    