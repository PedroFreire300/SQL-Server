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




