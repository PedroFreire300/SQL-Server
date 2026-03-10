=========================
      Exercício 01
=========================

SELECT TOP (100)
*
FROM    
    FactSales
ORDER BY
SalesAmount DESC

=========================
      Exercício 02
=========================

SELECT TOP (10)
*
FROM DimProduct
ORDER BY
    UnitPrice DESC,
    Weight DESC,
    AvailableForSaleDate ASC;

=========================
      Exercício 03
=========================

SELECT 
ProductName AS Produto,
Weight AS Peso
FROM DimProduct
ORDER BY 
Weight DESC

=========================
      Exercício 04
=========================

SELECT 

StoreName AS Loja, 
OpenDate AS Data_abertura, 
EmployeeCount AS Qtd_funcionarios,
CloseDate AS Data_fechamento

From DimStore

Where CloseDate is not null

==========================
      Exercício 05
==========================

SELECT 
productkey as ID
FROM dimproduct
where brandname = 'Litware'
and  AvailableForSaleDate = '20090315'

==========================
      Exercício 06
==========================

A)

SELECT 
*
from dimStore
where status = 'off'

B) 

SELECT 
*
from dimStore
where CloseDate is not null

==========================
      Exercício 07
==========================

SELECT * from dimstore

SELECT 

StoreName AS Loja,
EmployeeCount AS Qtd_funcionarios

from dimstore

WHERE EmployeeCount > 50

==========================
      Exercício 08
==========================

SELECT * FROM DimProduct

SELECT

Productkey AS ID,
ProductName AS Produto,
UnitPrice AS Preço

FROM DimProduct

WHERE ProductDescription like '%LCD%'









