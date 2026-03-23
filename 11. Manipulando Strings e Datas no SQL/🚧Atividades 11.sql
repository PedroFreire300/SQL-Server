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

SELECT TOP (9) StyleName FROM DimProduct

SELECT TOP (9) TRANSLATE (StyleName,'0123456789','ABCDEFGHIJ')

AS StyleName

FROM DimProduct

=========================

SELECT TOP (9) reverse(stuff(reverse(StyleName),2,1,'#'))

FROM DimProduct

=========================
      Exercício 03
=========================

SELECT * FROM DimEmployee

SELECT 

CONCAT(FirstName,' ', LastName) AS 'Nome',
EmailAddress AS 'E-mail',
LEFT (EmailAddress, charindex('@',EmailAddress)-1) as 'ID do e-mail',

CONCAT (UPPER(LEFT (EmailAddress, charindex('@',EmailAddress)-1)) , DAY(BirthDate)) AS 'Senha'

FROM DimEmployee