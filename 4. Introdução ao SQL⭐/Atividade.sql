=========================
      Exercício 01
=========================

A)

select
      count(ProductKey) as QtdProdutos
from DimProduct

B)

select
      count(CustomerKey) as QtdClientes
from DimCustomer

=========================
      Exercício 02
=========================

SELECT
      CustomerKey as IdCliente,
      FirstName as Nome,
      EmailAddress as 'E-mail',
      BirthDate as 'Date de Nascimento'
from DimCustomer

=========================
      Exercício 03
=========================

select * from DimCustomer

select top 100
      FirstName as Nome,
      EmailAddress as 'E-mail',
      BirthDate as 'Data de Nascimento'
from DimCustomer
where BirthDate is not null
order by BirthDate asc


=========================
      Exercício 04
=========================

select distinct
      Manufacturer as Fornecedor
from DimProduct

=========================
      Exercício 05
=========================

select * from DimProduct
where ProductKey not in (
      select
            ProductKey
      from FactSales
)
