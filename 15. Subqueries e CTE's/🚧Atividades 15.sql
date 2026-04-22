=========================
      Exercício 01
=========================

SELECT * FROM FactSales
WHERE StoreKey = 
(
SELECT StoreKey FROM DimStore
WHERE StoreName = 'Contoso Orlando Store'
)

=========================
      Exercício 02
=========================

SELECT * FROM DimProduct

SELECT 

ProductKey,
ProductName,
UnitPrice,
( 
    SELECT UnitPrice
    FROM DimProduct
    WHERE ProductKey = 1893
    )

FROM DimProduct
WHERE UnitPrice > ANY ( 
    SELECT UnitPrice
    FROM DimProduct
    WHERE ProductKey = 1893
    )


=========================
      Exercício 03
=========================

SELECT * FROM DimEmployee

SELECT * FROM DimEmployee
WHERE DepartmentName = 
(
SELECT
DepartmentName 
FROM DimEmployee
WHERE CONCAT ( FirstName,' ',LastName)  = 'Miguel Severino'
)

=========================
      Exercício 04
=========================

SELECT * FROM DimCustomer

-- Refazer

=========================
      Exercício 05
=========================

SELECT TOP(10000) * FROM FactOnlineSales
SELECT * FROM DimCustomer

SELECT * FROM FactOnlineSales
WHERE PromotionKey EXISTS (SELECT PromotionKey FROM DimPromotion
WHERE PromotionName = 'Asian Holiday Promotion')


=========================
      Exercício 06
=========================

SELECT * FROM DimCustomer
SELECT * FROM FactSales

-- Refazer 


=========================
      Exercício 07
=========================
--Revisão 01

=========================
      Exercício 08
=========================
--Revisão 02

=========================
      Exercício 09
=========================
--! Simulado

=========================
      Exercício 10
=========================
--! Simulado
