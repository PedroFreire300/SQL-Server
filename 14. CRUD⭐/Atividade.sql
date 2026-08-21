=========================
      Exercício 01
=========================

a) create database BD_Teste
b) drop database BD_Teste
c) create database ExerciciosDB

=========================
      Exercício 02
=========================

create table dCliente (
      Id_Cliente int primary key identity(1,1),
      Nome_Cliente varchar (100) not null,
      Data_Nascimento date not null
)

create table dGerente (
      Id_Gerente int primary key identity(1,1),
      Nome_Gerente varchar(100) not null,
      Data_Contratacao date default getdate(),
      Salario decimal(10,2) not null,

      constraint ck_Salario
      check (Salario > 0)
)

create table fContratos (
      Id_Contrato int primary key identity(1,1),
      Data_Assinatura date default getdate(),
      Id_Cliente int not null,
      Id_Gerente int not null,
      Valor_Contrato decimal(10,2) not null,

      constraint Fk_Id_Cliente
      foreign key (Id_Cliente)
      references dCliente(Id_Cliente),

      constraint Fk_Id_Gerente
      foreign key (Id_Gerente)
      references dGerente(Id_Gerente),

      constraint ck_Valor_Contrato
      check (Valor_Contrato > 0)

)

=========================
    Exercício 03 e 04
=========================

insert into dCliente ( Nome_Cliente,Data_Nascimento)
values
      ('André Martins','1989-02-12'),
      ('Bárbara Campos','1992-05-07'),
      ('Carol Freitas','1985-04-23'),
      ('Diego Cardoso','1994-10-11'),
      ('Eduardo Pereira','1988-11-09'),
      ('Fabiana Silva','1989-09-02'),
      ('Gustavo Barbosa','1993-06-27'),
      ('Helen Viana','1990-02-11')

insert into dGerente (Nome_Gerente,Salario)
values
      ('Lucas Sampaio',6700),
      ('Mariana Padilha',9900),
      ('Nathália Santos',7200),
      ('Otávio Costa',11000)

insert into fContratos (Id_Cliente,Id_Gerente,Valor_Contrato)
values
      (8, 1, 23000),
      (3, 2, 15500),
      (7, 2, 6500),
      (1, 3, 33000),
      (5, 4, 11100),
      (4, 2, 5500),
      (7, 3, 55000),
      (2, 1, 31000),
      (5, 4, 3400),
      (6, 2, 9200)

=========================
      Exercício 05
=========================

update fContratos
set 
Data_Assinatura = '17-03-2019',
Valor_Contrato = 33500
where Id_Cliente = 4

=========================
      Exercício 06
=========================

delete from fContratos
where Id_Contrato = 10


      