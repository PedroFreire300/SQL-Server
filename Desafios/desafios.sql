==============================
--Desafio 01

select * from FactSales --chave principal
select * from DimChannel --chave estrangeira

select

DC.ChannelName as NomeCanal,
sum(FS.SalesQuantity) as QtdTotalVendas,
sum(FS.SalesAmount) as ValorQtdTotalVendas,
avg(FS.SalesAmount) as ValorMedio

from FactSales FS
inner join DimChannel DC
on FS.Channelkey = DC.ChannelKey
group by DC.ChannelName
having sum(FS.SalesQuantity) > 5000000
order by ValorQtdTotalVendas desc

==================================
--Desafio 02

select * from FactSales
select * from DimStore

select 

NomeLoja,
QtdVendas,
case

	when QtdVendas > 200000 then 'Diamante'
	when QtdVendas > 150000 then 'Ouro'
	when QtdVendas > 100000 then 'Prata'
	else 'Bronze'

end as Classificação

from (
select 

DS.StoreName as NomeLoja,
sum(FS.SalesQuantity) as QtdVendas

from FactSales FS
inner join DimStore DS
on FS.StoreKey = DS.StoreKey
group by DS.StoreName) as T
order by QtdVendas desc

===============================
-- Desafio03

select * from FactSales
select * from DimDate

select 

Ano,
TotalVendas,
TotalProdutosVendas,
TotalVendas / TotalProdutosVendas as Ticket

from ( select

year(Datekey) as Ano,
sum(SalesAmount) as TotalVendas,
sum(SalesQuantity) as TotalProdutosVendas

from FactSales
group by year(Datekey)
having sum(SalesAmount) > 500000000 ) as T

=====================
--Desafio 04

select top 20

DC.CustomerKey as ID,
CONCAT(DC.FirstName,' ',DC.LastName) as NomeCompleto,
SUM(FS.SalesQuantity) as QtdCompras,
sum(FS.UnitPrice) as ValorTotal

from FactOnlineSales FS
inner join DimCustomer DC
on FS.CustomerKey = DC.CustomerKey 
group by CONCAT(DC.FirstName,' ',DC.LastName), DC.CustomerKey
having CONCAT(DC.FirstName,' ',DC.LastName) <> ' '
order by QtdCompras desc

================
--Desafio 05 
