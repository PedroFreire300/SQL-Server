=========================
      Exercício 01
=========================

A)

Create view VwProdutos as
select
    ProductName,
    ColorName,
    UnitPrice,
    UnitCost
from DimProduct

select * from VwProdutos

B)

Create view vwFuncionarios as
Select
    FirstName,
    BirthDate,
    DepartmentName
from DimEmployee

select * from vwFuncionarios

C)

create view vwLojas as 
select 
    StoreKey,
    StoreName,
    OpenDate
from DimStore

select * from vwLojas

=========================
      Exercício 02
=========================
select * from DimCustomer
select
    concat(FirstName,' ',LastName) as NomeCompleto,
    case
        when Gender = 'M' then 'Masculino'
        else 'Feminino'
        end as Gênero,
    EmailAddress as 'E-mail',
    format(YearlyIncome,'c','Pt-br') as 'Renda Anual'
from DimCustomer

=========================
      Exercício 03
=========================

A)

create view vwLojasAtivas as 
select * from DimStore
where CloseDate is null

select * from vwLojasAtivas

B) 

CREATE VIEW vwFuncionariosMkt as
SELECT 
    FirstName,
    EmailAddress,
    DepartmentName
FROM DimEmployee
WHERE DepartmentName = 'Marketing'

select * from vwFuncionariosMkt

C)

create view vwContosoLitwareSilver as
SELECT * FROM DimProduct
WHERE ProductName like '%Silver'
and BrandName in ('Contoso','Litware')

select * from vwContosoLitwareSilver

=========================
      Exercício 04
=========================

create view vwTotalVendidoProdutos as 
select
    DP.ProductName,
    sum(SalesQuantity) as QtdVendida
from FactSales FS
inner join DimProduct DP
on FS.ProductKey = DP.ProductKey
group by ProductName

select * from vwTotalVendidoProdutos

=========================
      Exercício 05
=========================

A)

alter view VwProdutos1 as
select
    ProductName,
    ColorName,
    UnitPrice,
    UnitCost,
    BrandName
from DimProduct

select * from VwProdutos1

B)

alter view vwFuncionarios1 as
Select
    FirstName,
    BirthDate,
    DepartmentName
from DimEmployee
where gender = 'F'

select * from vwFuncionarios1

C)

alter view vwLojas1 as 
select 
    StoreKey,
    StoreName,
    OpenDate
from DimStore
where Closedate is null

select * from vwLojas1

=========================
      Exercício 06
=========================
Select * from DimProduct
A)

create view vw_6a as
select
    BrandName as 'Nome da Marca',
    count(*) as 'Total de Produtos'
from DimProduct
group by BrandName

select * from vw_6a

B) 

alter view vw_6a as
select
    BrandName as 'Nome da Marca',
    count(*) as 'Total de Produtos',
    round(sum(weight),2) as 'Peso Total'
from DimProduct
group by BrandName

select * from vw_6a

C)

drop view vw_6a









