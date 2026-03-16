=========================
      Exercício 01
=========================

SELECT 
    SUM(SalesQuantity) AS Qtd_Vendida,
    SUM(ReturnQuantity) AS Qtd_Devolvida

from FactSales

========================
      Exercício 02
=========================

SELECT 
    Sum(YearLyIncome) AS Renda_Anual

FROM DimCustomer


WHERE occupation = 'Professional'

========================
      Exercício 03
========================

select
*
from DimStore

A) 

SELECT 
MAX(EmployeeCount) AS Qtd_funcionarios
FROM DimStore
--325

B)

select *
from DimStore
where EmployeeCount = '325'
--Contoso North America Online Store

C)

SELECT 
MIN(EmployeeCount) AS Qtd_funcionarios
FROM DimStore
--7

D)

select *
from DimStore
where EmployeeCount = '7'
--Contoso Europe Online Store

========================
      Exercício 04
========================

SELECT * from DimEmployee

SELECT 

COUNT(Gender) AS Qtd_Masculino

FROM DimEmployee
WHERE gender = 'M'

SELECT 

COUNT(Gender) AS Qtd_Feminino

FROM DimEmployee
WHERE gender = 'F'

B)

SELECT * from DimEmployee

SELECT top (1)

FirstName as Nome,
emailaddress as Email,
hiredate as Data_Contratacao

from DimEmployee
WHERE gender = 'M'
ORDER BY hiredate asc

SELECT top (1)

FirstName as Nome,
emailaddress as Email,
hiredate as Data_Contratacao

from DimEmployee
WHERE gender = 'F'
ORDER BY hiredate asc

========================
      Exercício 05
========================









