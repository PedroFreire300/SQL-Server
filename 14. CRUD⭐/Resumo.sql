================================
Creates
================================
create table Cliente (
	IdCliente int primary key identity(1,1),
	Nome varchar(100),
	Email varchar(100) not null,
	Cidade varchar(50),
	Sexo varchar(50),
	Telefone varchar (20),
	CPF varchar(15) not null,
	DataNascimento date,
	
	constraint UN_Email
	unique (Email),

	constraint UN_CPF
	unique (CPF),
	
	constraint CK_Sexo
	check (Sexo in ('Masculino','Feminino'))
)

create table Produtos (
	CodigoProduto int primary key identity(1,1),
	Nome varchar(100),
	Marca varchar(100),
	PrecoUnit decimal(10,2),
	Descricao text,

	constraint CK_PrecoUnit
	check (PrecoUnit > 0)
)

create table Pedidos (
	IdPedido int primary key identity(1,1),
	IdCliente int,
	CodigoProduto int not null,
	Quantidade int,
	Preco decimal(10,2),
	Total as (Quantidade * Preco),
	DataVenda date default getdate(), 

	constraint FK_IdCliente
	foreign key (IdCliente)
	references Cliente(IdCliente),

	constraint FK_CodigoProduto
	foreign key (CodigoProduto)
	references Produtos(CodigoProduto),

	constraint CK_Quantidade
	check (Quantidade > 0)
)

======================================
Linhas
======================================
insert into Cliente (Nome,Email,Cidade,Sexo,Telefone,CPF,DataNascimento) --Adicionar
values
('Pedro Paulo','pedropaulo43410@gmail.com','Indaiatuba','Masculino',11947249176,'43414530810','2004-03-25')

delete from Cliente -- Deletar
where IdCliente = 15

update Cliente -- Atualizar 
set peso = 75
where IdCliente = 12

=======================================
Colunas
=======================================
alter table Cliente -- Adicionar
add Peso int 

alter table Cliente --Deletar
drop column Peso

alter table Cliente --Alterar tipo 
alter column Email varchar(100) not null;

update Cliente -- Atualizar 
set Peso = 75
where IdCliente = 12

