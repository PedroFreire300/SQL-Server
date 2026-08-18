========================
      Exercício 01
========================

create function CalAnos (@parametro1 date, @parametro2 date)
returns int
as begin
return
	case 
		when @parametro2 is null then datediff(year,@parametro1,getdate())
		else datediff(year,@parametro1,@parametro2)
	end
end

print dbo.CalAnos ('25-03-2004','17-08-2026')
print dbo.CalAnos ('25-03-2004',null)

========================
      Exercício 02
========================

create function Bonus (@parametro1 float)
returns float
as begin
	return @parametro1 + (@parametro1 * 0.05)
end

select
	format(dbo.Bonus(BaseRate),'C','PT-BR') as Bônus
from DimEmployee
where EndDate is null

========================
      Exercício 03
========================

select * from DimCustomer

select
	FirstName as Nome
from DimCustomer
Where Gender = 'M'

create function TabelaGender (@parametro1 char(1))
returns table 
return
	(
	select
		FirstName as Nome
	from DimCustomer
	Where Gender = @parametro1
	)

select * from dbo.TabelaGender('M')

========================
      Exercício 04
========================

create function QtdMarcaCor (@parametro varchar(50))
returns table
return 
	(
	select
		distinct ColorName as NomeCor,
		count(Colorname) over(partition by ColorName) as QtdCor
	from DimProduct
	where BrandName = @parametro
	)

select * from dbo.QtdMarcaCor('Contoso')
	