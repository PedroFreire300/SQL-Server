========================
      Exercício 01
========================

a) create database AlugaFacil

b) 

create table Cliente (
      Id_Cliente int primary key identity(1,1),
      Nome_Cliente varchar (100) not null,
      CNH varchar(50) not null,
      Cartao varchar(50) not null,

      constraint un_CNH
      unique (CNH)
) 

create table Carro (
      Id_Carro int primary key identity(1,1),
      Modelo varchar (50) not null,
      Tipo varchar (50) not null,
      Placa varchar (20) not null
      
      constraint ck_Tipo
      check (Tipo in('Hatch','Sedan','SUV')),

      constraint un_Placa
      unique (Placa)

)

create table Locacoes ( 
      Id_Locacao int primary key identity(1,1),
      Data_Locacao date not null,
      Data_Devolucao date not null,
      Id_Carro int not null,
      Id_Cliente int not null,

      constraint Fk_Id_Cliente
      foreign key (Id_Cliente)
      references Cliente(Id_Cliente),

      constraint Fk_Id_Carro
      foreign key (Id_Carro)
      references Carro(Id_Carro)

)

========================
      Exercício 02
========================

drop database AlugaFacil

