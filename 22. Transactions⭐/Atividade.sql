========================
      Exercício 01
========================
create table Carro (
    id_carro int primary key identity(1,1),
    placa char(8) not null,
    modelo varchar(50) not null,
    tipo varchar(20) not null

    constraint ck_tipo
    check (tipo in ('Hatch','SUV','Sedan')),

    constraint un_placa
    unique (placa)
)

insert into Carro (placa,modelo,tipo)
values 
('DAS-1412','Hyundai HB20','Hatch'),
('JHG-3902','Fiat Cronos','Sedan'),
('IPW-9018','Citroen C4 Cactus','SUV'),
('JKR-8891','Nissan Kicks','SUV'),
('TRF-5904','Chevrolet Onix','Sedan')

select * from Carro

========================
      Exercício 02
========================

a)

BEGIN TRANSACTION p1
insert into Carro (placa,modelo,tipo)
values
    ('CDR-0090','Fiat Argo','Hatch')

select * from Carro

ROLLBACK TRANSACTION p1

COMMIT TRANSACTION p1

b)

BEGIN TRANSACTION p2

update Carro
set tipo = 'Sedan' 
where id_carro = 1

select * from Carro

ROLLBACK TRANSACTION p2

COMMIT TRANSACTION p2

c)

delete from Carro
where id_carro = 7
