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
      Exercício 03
=========================

SELECT * FROM DimEmployee

SELECT

CONCAT(FirstName,' ',LastName) AS Nome,
EmailAddress AS Email,
left(EmailAddress,CHARINDEX('@',EmailAddress)-1) AS ID,
CONCAT(upper(FirstName),day(BirthDate)) AS Senha

FROM DimEmployee

=========================
      Exercício 04
=========================

SELECT * FROM DimCustomer

SELECT

FirstName AS Nome, 
EmailAddress AS Email,
AddressLine1 AS Endereço,
DateFirstPurchase AS DataPrimeiraCompra

FROM DimCustomer
WHERE YEAR(DateFirstPurchase) = 2001
ORDER BY DateFirstPurchase DESC

=========================
      Exercício 05
=========================

SELECT * FROM DimEmployee 

SELECT 

FirstName AS Nome,
EmailAddress AS Email,
HireDate AS DataContratação,
DAY(HireDate) AS Dia,
DATENAME(MONTH,MONTH(HireDate)) AS Mês,
YEAR(HireDate) AS Ano

FROM 

DimEmployee