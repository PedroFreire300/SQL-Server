SELECT SQL_VARIANT_PROPERTY(10,'baseType')
SELECT SQL_VARIANT_PROPERTY(10.0,'baseType')

SELECT 'O preço do pastel é: ' + Cast (30.99 AS VARCHAR) + 'na data' +  Cast ('20/06/2021' AS DATETIME)

SELECT  Cast ('20/06/2021' AS DATETIME) + 1

Declare @preco as float
Set @preco = 10.89
SELECT @preco as 'Preço' 

Declare @nome as varchar(10) = 'Matheus'
SELECT @nome as 'Nome'

declare @qtd_vendas as int = 100
declare @qtd_preço as float = 89.99

SELECT @qtd_vendas*@qtd_preço as 'Total'


declare @desconto as float = 0.1

Select 

Productkey,
ProductName,
Unitprice,
UnitPrice - (UnitPrice * @desconto) as 'Desconto'

From 

DimProduct