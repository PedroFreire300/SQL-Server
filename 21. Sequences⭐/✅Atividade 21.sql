========================
      Exercício 01
========================

create sequence cliente_seq as int 
start with 1
increment by 1
no maxvalue 
no cycle

create sequence carro_seq as int 
start with 1
increment by 1
no maxvalue 

create sequence locacoes_seq as int 
start with 1
increment by 1
no maxvalue

========================
      Exercício 02
========================

create table Cliente (
    id_cliente int primary key,
    nome_cliente varchar(100) not null,
    cnh char(9) not null,
    cartao varchar(50) not null
)

create table Carro (
    id_carro int primary key,
    placa varchar(20) not null,
    modelo varchar(50) not null,
    tipo varchar(50) not null,

    constraint ck_tipo
    check (tipo in ('Hatch','Sedan','SUV')),

    constraint un_placa
    unique (placa)
)

create table Locacoes (
    id_locacao int primary key,
    data_locacao date default getdate() not null,
    data_devolucao date not null,
    tipo varchar(50) not null,
    id_carro int not null,
    id_cliente int not null,

    constraint fk_id_carro
    foreign key (id_carro)
    references Carro(id_carro),

    constraint fk_id_cliente
    foreign key (id_cliente)
    references Cliente(id_cliente)
)

insert into Cliente (id_cliente,nome_cliente,cnh,cartao) values 
(next value for cliente_seq,'Pedro',123456789,'Nubank')

insert into Cliente (id_cliente,nome_cliente,cnh,cartao) values
(next value for cliente_seq,'Matheus',987654321,'Bradesco')

select * from Cliente

insert into Carro(id_carro,placa,modelo,tipo) values
(next value for carro_seq,'FSW1805',2012,'SUV')

select * from Carro

insert into Locacoes (
    id_locacao,
    data_locacao,
    data_devolucao,
    tipo,
    id_carro,
    id_cliente
    )

values (
    next value for locacoes_seq,
    '18-08-2026',
    '29-08-2026',
    '10 dias',
    1,
    1
)

========================
      Exercício 03
========================

drop sequence cliente_seq
drop sequence carro_seq
drop sequence locacoes_seq

