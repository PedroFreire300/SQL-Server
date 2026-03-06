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


