-- [SQL Server] Ordenando e filtrando dados
-- Aula 11 de 27: Exerc�cios de Fixa��o - Where mais And, Or e Not

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- 1. Selecione todas as linhas da tabela DimEmployee de funcion�rios do sexo feminino E do departamento de finan�as.

SELECT * FROM DimEmployee WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- 2. Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.

SELECT * FROM DimProduct 
WHERE BrandName = 'Contoso' and ColorName = 'Red' AND UnitPrice >= 100

-- 3. Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.

SELECT * FROM DimProduct 
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- 4. Selecione todas as linhas da tabela DimSalesTerritory onde o continente � a Europa mas o pa�s N�O � a It�lia.

SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'europe' AND NOT SalesTerritoryCountry = 'Italy'