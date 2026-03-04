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
