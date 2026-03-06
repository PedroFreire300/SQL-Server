=========================
      Exercício 01
=========================

A)

SELECT * FROM DimProduct

B) 

SELECT * FROM DimCustomer

=========================
      Exercício 02
=========================

A e B) 

SELECT

CustomerKey,
FirstName AS Nome,
EmailAddress AS Email,
BirthDate AS Data_aniversário

FROM DimCustomer

=========================
      Exercício 03
=========================

A) 

SELECT TOP (100) 

*

FROM DimCustomer 

B) 

SELECT TOP (20) PERCENT

*

FROM DimCustomer

C e D)

SELECT TOP (100)

FirstName AS Nome,
EmailAddress AS Email,
BirthDate AS Data_Aniversário 

FROM DimCustomer

=========================
      Exercício 04
=========================

SELECT  

Manufacturer AS Fornecedores

FROM DimProduct

=========================
      Exercício 05
=========================

SELECT * FROM DimProduct

SELECT distinct ProductKey FROM FactSales