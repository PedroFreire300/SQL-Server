=========================
      Exercício 01
=========================

SELECT * FROM DimProduct

A)

SELECT 

ProductName AS 'Nome do Produto',
LEN(ProductName) AS 'Quantidade caracteres'

FROM DimProduct

ORDER BY LEN(ProductName) ASC

B)


SELECT 

ProductName AS 'Nome do Produto',
AVG(LEN(ProductName)) AS 'Quantidade caracteres'

FROM DimProduct
GROUP BY ProductName
ORDER BY LEN(ProductName) ASC

C)

SELECT 

ProductName AS 'Nome do Produto',
AVG(LEN(ProductName)) AS 'Quantidade caracteres'

FROM DimProduct
GROUP BY ProductName
ORDER BY LEN(ProductName) ASC

=========================
      Exercício 02
=========================





