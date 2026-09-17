=========================
        Query 01
=========================
-- Group + Case + CTE
with cte as (
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
from DimStore )
select
    Categoria,
    sum(EmployeeCount) as TotalCategoria
from cte
group by Categoria

=========================
        Query 02
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
where FirstName is not null
order by FirstName;

with cte as (
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
where FirstName is not null)
select distinct
	[Ação do Marketing],
	count(*) over(partition by [Ação do Marketing]) as QtdSorteios
from cte