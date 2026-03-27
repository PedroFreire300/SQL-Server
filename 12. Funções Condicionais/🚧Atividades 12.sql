=========================
      Exercício 01
=========================

SELECT * FROM DimProduct

DECLARE

@economy AS FLOAT = 0.05,
@regular AS FLOAT = 0.07,
@deluxe AS FLOAT = 0.09

SELECT

ProductKey AS ID,
ProductName AS Nome,

CASE 

    WHEN ClassName = 'Economy' THEN '5%' 
    WHEN ClassName = 'Regular' THEN '7%'
    ELSE '9%'

END AS Desconto,

CASE 

    WHEN ClassName = 'Economy' THEN  FORMAT(UnitPrice + (UnitPrice * @economy),'c')
    WHEN ClassName = 'Regular' THEN FORMAT(UnitPrice + (UnitPrice * @regular), 'c')
    ELSE FORMAT( UnitPrice + (UnitPrice * @deluxe), 'c')

END AS Valor

FROM DimProduct

=========================
      Exercício 02
=========================

SELECT * FROM DimProduct

SELECT

BrandName AS Marca,
COUNT(BrandName) AS Preço,
CASE

    WHEN COUNT(BrandName) > 500 THEN 'A'
    WHEN COUNT(BrandName) > 100 THEN 'B'
    ELSE 'C'

END AS Categoria

FROM DimProduct 
GROUP BY BrandName
ORDER BY Preço DESC

=========================
      Exercício 03
=========================

SELECT * FROM DimStore

SELECT 

Storename AS Loja,
EmployeeCount AS Funcionário,

CASE 

    WHEN CAST(EmployeeCount AS Int) >= 50 THEN 'Acima de 50 funcionários'
    WHEN CAST(EmployeeCount AS Int) >= 40 THEN 'Acima de 40 funcionários'
    WHEN CAST(EmployeeCount AS Int) >= 30 THEN 'Acima de 30 funcionários'
    WHEN CAST(EmployeeCount AS Int) >= 20 THEN 'Acima de 20 funcionários'
    WHEN CAST(EmployeeCount AS Int) >= 10 THEN 'Acima de 10 funcionários'
    ELSE 'Abaixo de 10 funcionários'

END AS Categoria

FROM DimStore

=========================
      Exercício 04
=========================
SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT

DimProductSubcategory.ProductSubcategoryName AS Nome,
Sum(DimProduct.Weight) AS 'Peso por KG',

CASE 

    WHEN Sum(DimProduct.Weight) >= 1000 THEN 'Rota 2'
    ELSE 'Rota 1'

END AS Caminho

FROM DimProduct
RIGHT JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY DimProductSubcategory.ProductSubcategoryName
HAVING Sum(DimProduct.Weight) is NOT NULL