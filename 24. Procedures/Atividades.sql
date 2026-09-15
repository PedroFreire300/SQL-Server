========================
      Exercício 01
========================
create procedure prFiltrarMarca (@marca varchar(50))
as begin 
    select * from DimProduct where BrandName = @marca
end

execute prFiltrarMarca 'Contoso'

========================
      Exercício 02
========================
create or alter procedure prFiltrarClientes (@quantidade int)
as begin
    with cte as (
    select 
        *,
        row_number() over (order by DateFirstPurchase desc) as TopN
    from DimCustomer
    ) 
    select 
        CustomerKey,
        FirstName,
        LastName,
        DateFirstPurchase 
    from cte
    where TopN <= @quantidade
end
========================
CREATE OR ALTER PROCEDURE prFiltrarClientes2 (@quantidade INT)
AS BEGIN
    SELECT TOP (@quantidade)
        CustomerKey,
        FirstName,
        LastName,
        DateFirstPurchase
    FROM DimCustomer
    WHERE DateFirstPurchase IS NOT NULL
    ORDER BY DateFirstPurchase DESC;
END;
========================
execute prFiltrarClientes 5
execute prFiltrarClientes2 5

========================
      Exercício 03
========================

select * from DimEmployee

create or alter procedure prFiltrarData 
    @mes int = null ,
    @ano int = null
as begin
    select * from DimEmployee where (@mes is null or Month(StartDate) = @mes) and (@ano is null or Year(StartDate) = @ano)
    print 'Data filtrada com sucesso!'
end

exec prFiltrarData 7

========================
      Exercício 04
========================
 select * from Carro

 create or alter procedure prCadastrarCarro
    @id int,
    @placa varchar(25),
    @modelo varchar(25),
    @tipo varchar(25),
    @valor decimal(10,2)
as begin
    insert into Carro (id_carro, placa, modelo, tipo, valor) values (@id, @placa, @modelo, @tipo, @valor)
    print 'Carro cadastrado com sucesso!'
end

exec prCadastrarCarro 3, 'ABC-1234', 'Fusca', 'Hatch', 15000.00

========================
      Exercício 05
========================
create or alter procedure prAlterarValorCarro 
	@id int,
	@valor decimal(10,2)
as begin
	update Carro
	set valor = @valor
	where id_carro = @id
	print 'Tabela carro atualizada'
end

exec prAlterarValorCarro 3,20000

select * from Carro

========================
      Exercício 06
========================
create procedure prDeletar (@id int)
as begin
	delete from Carro
	where id_carro = @id
end

select * from Carro

exec prDeletar 5

