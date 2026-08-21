=========================
      Exercício 01
=========================

select * from FactSales
select * from DimStore

select * from FactSales
where StoreKey = (
      select StoreKey from DimStore
      where StoreName = 'Contoso Orlando Store'
      )

=========================
      Exercício 02
=========================

select 

ProductKey,
ProductName,
UnitPrice

from DimProduct 
where UnitPrice > (
      select UnitPrice from DimProduct
      where ProductKey = 1893
      )

=========================
      Exercício 03
=========================

select * from DimEmployee
where DepartmentName = (
      select DepartmentName from DimEmployee
      where concat(FirstName,' ',LastName) = 'Miguel Severino'
)

=========================
      Exercício 04
=========================

select * from DimCustomer

select 

CustomerKey as ID,
concat(FirstName,' ',LastName) as NomeCompleto,
EmailAddress as Email,
YearlyIncome as SalarioAnual
from DimCustomer
where CustomerType = 'Person' and YearlyIncome > (
      select avg(YearlyIncome) from DimCustomer
      where CustomerType = 'Person'
)

=========================
      Exercício 05
=========================

select
      FirstName as Nome
from DimCustomer
where CustomerKey in (
      select CustomerKey from FactOnlineSales 
      where Promotionkey in (
      select Promotionkey from DimPromotion
      where PromotionName =  'Asian Holiday Promotion'
))

=========================
      Exercício 06
=========================

select * from DimCustomer
select top 10000 * from FactOnlineSales

select 
      FS.CustomerKey as Id,
      DC.CompanyName as Empresa
from FactOnlineSales FS
inner join DimCustomer DC
on FS.CustomerKey = DC.CustomerKey
where CustomerType <> 'Person'
GROUP by FS.ProductKey,FS.CustomerKey,DC.CompanyName
HAVING sum(SalesQuantity) > 3000

=========================
      Exercício 07
=========================
select * from DimProduct

select 
      
      ProductKey as Id_Produto,
      ProductName as Produto,
      BrandName as Marca,
      UnitPrice as PreçoUnit,
      ( 
            select avg(UnitPrice) from DimProduct
      )

from DimProduct

=========================
      Exercício 08
=========================
select * from DimProduct

SELECT 
 MAX(Quantidade) AS 'Máximo', 
 MIN(Quantidade) AS 'Mínimo', 
 AVG(Quantidade) AS 'Média' 
FROM( 
 SELECT 
  BrandName, 
  COUNT(*) AS 'Quantidade' 
 FROM DimProduct 
 GROUP BY BrandName 
 ) AS T 

=========================
      Exercício 09
=========================

with CTE_QtdProdutosPorMarca as (
SELECT 
      BrandName, 
      COUNT(*) AS 'Quantidade' 
FROM DimProduct 
GROUP BY BrandName 
)select max(Quantidade) as QtdMaxima from CTE_QtdProdutosPorMarca

=========================
      Exercício 10
=========================

with CTE_ProdutosAdventureWorks as ( 
      
      select

            ProductKey,
            ProductName,
            ProductSubcategoryKey,
            BrandName,
            UnitPrice

      from DimProduct
      where BrandName = 'Adventure Works'

),

CTE_CategoriaTelevisionsERadio as (

      select

            ProductSubcategoryKey,  
            ProductSubcategoryName
            
      from DimProductSubcategory
      where ProductSubcategoryName in ('Televisions' ,'Monitors')
)

SELECT 
 CTE_ProdutosAdventureWorks.*, 
 CTE_CategoriaTelevisionsERadio.ProductSubcategoryName 
FROM CTE_ProdutosAdventureWorks 
inner JOIN CTE_CategoriaTelevisionsERadio 
 ON CTE_ProdutosAdventureWorks.ProductSubcategoryKey = 
CTE_CategoriaTelevisionsERadio.ProductSubcategoryKey