=========================
      Exercício 01
=========================
declare
    @economy float = 0.05,
    @regular float = 0.07,
    @deluxe float = 0.09

select
    ProductKey,
    ProductName,
    case
        when ClassName = 'Economy' then @economy
        when ClassName = 'Regular' then @regular
        when ClassName = 'Deluxe' then @deluxe
        else 'Sem Classificação'
    end as Porcentagem,
    case
        when ClassName = 'Economy' then cast (UnitPrice - (UnitPrice * @economy) as decimal(10,2))
        when ClassName = 'Regular' then cast (UnitPrice - (UnitPrice * @regular) as decimal(10,2))
        when ClassName = 'Deluxe' then cast (UnitPrice - (UnitPrice * @deluxe) as decimal(10,2))
        else 0
    end as UnitPriceNovo
from DimProduct

=========================
      Exercício 02
=========================
with cte as (
    select
        BrandName as Marca,
        count(*) as TotalProdutosMarca
    from DimProduct
    group by BrandName
)
select 
    *,
    case
        when TotalProdutosMarca > 500 then 'Categoria A'
        when TotalProdutosMarca > 100 then 'Categoria B'
        else 'Categoria C'
    end as Categoria    
from cte

=========================
      Exercício 03
=========================
select
    StoreName,
    EmployeeCount,
    case
        when EmployeeCount >= 50 then 'Diamante'
        when EmployeeCount >= 40 then 'Platina'
        when EmployeeCount >= 30 then 'Ouro'
        when EmployeeCount >= 20 then 'Prata'
        when EmployeeCount >= 10 then 'Bronze'
        else 'Madeira'
    end as Categoria
from DimStore

=========================
      Exercício 04
=========================
with cte as (
select
	ProductSubcategoryName,
	cast (avg(Weight) * 100 as decimal(10,2)) as Peso
from DimProduct DP
inner join DimProductSubcategory DPS
on DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
group by ProductSubcategoryName
) 
select
	*,
	iif(Peso>1000,'Rota 2','Rota 1') as Rota
from cte

=========================
      Exercício 05
=========================
select
	FirstName as 'Nome',
	Gender as 'Sexo',
	TotalChildren as 'Qtd.Filhos',
	EmailAddress as 'E-mail',
	case
		when Gender = 'M' and TotalChildren <> 0 then 'Sorteio Pai do Ano'
		when Gender = 'F' and TotalChildren <> 0 then 'Sorteio Mãe do Ano'
		else 'Caminhão de Prêmios'
	end as 'Ação do Marketing'
from DimCustomer

=========================
      Exercício 06
=========================
select 
    StoreName as Nome,
    OpenDate as [Data de Abertura],
    case
        when CloseDate is null then DATEDIFF(day, OpenDate, getdate())
        else DATEDIFF(day, OpenDate, CloseDate)
    end as [Dias em Operação]
from DimStore
where CloseDate is null
order by [Dias em Operação] desc

