=========================
      Exercício 01
=========================

select * from vwProdutos

select 

    vwProdutos.*,
    sum(Quantidade_Vendida) over() as Qtd_Vendida_Total

from vwProdutos 

=========================
      Exercício 02
=========================

select 

    vwProdutos.*,
    sum(Quantidade_Vendida) over() as Qtd_Vendida_Total,
    sum(Quantidade_Vendida) over(PARTITION BY Marca) as Qtd_Vendida_Total_Marca

from vwProdutos 

=========================
      Exercício 03       --Refazer
========================= 
select 

    vwProdutos.*,
    sum(Quantidade_Vendida) over() as Qtd_Vendida_Total,
    sum(Quantidade_Vendida) over(partition by Marca) as Qtd_Vendida_Total_Marca,
    format(1.0*(sum(Quantidade_Vendida) over(partition by Marca))/sum(Quantidade_Vendida) over(), '0.00%') as "% Por Vendas"

from vwProdutos
=========================
      Exercício 04       
=========================
select 
    Marca,
    Cor,
    Quantidade_Vendida,
    rank() over(ORDER BY Quantidade_Vendida desc) as Rank
from vwProdutos
where Marca = 'Contoso'

=========================
        Desafio          --Refazer
========================= 
select * from DimDate -- Tabela principal
select * from DimStore -- Tabela secundaria

create view vwHistoricoLojas as 

select
      row_number() over (order by CalendarMonth) as ID,
      DD.CalendarYear as Ano,
      DD.CalendarMonthLabel as Mês,
      count(DS.OpenDate) as Qtd_Lojas
from DimDate DD
left join DimStore DS
on DD.Datekey = DS.OpenDate
group by CalendarMonthLabel,CalendarYear,CalendarMonth

=========================
      Exercício 05       
=========================


=========================
      Exercício 06       
=========================
select * from vwHistoricoLojas

select
      *,
      sum(Qtd_Lojas) over(order by ID rows between unbounded preceding and current row) as 'soma acumulada'
from
      vwHistoricoLojas

      








