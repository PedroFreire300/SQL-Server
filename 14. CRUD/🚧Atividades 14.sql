=========================
      Exercício 01
=========================

CREATE DATABASE Exercicios

=========================
      Exercício 02
=========================

CREATE TABLE dCliente (
    Id_cliente PRIMARY KEY, 
    Nome_cliente Varchar(100),
    Data_Nascimento DATETIME
)

CREATE TABLE dGerente (
    Id_Gerente PRIMARY KEY,
    Nome_Gerente Varchar(100),
    Data_de_Contratacao DATETIME,
    Salario FLOAT
)

CREATE TABLE fContratos (
    Id_Contrato PRIMARY KEY,
    Data_de_Assinatura DATETIME,
    id_Cliente INT,
    Id_Gerente INT,
    Valor_do_Contrato FLOAT
)

SELECT * FROM dCliente --! Consulta
SELECT * FROM dGerente --! Consulta
SELECT * FROM fContratos --! Consulta

=========================
      Exercício 03
=========================

INSERT INTO dCliente (Id_cliente,Nome_cliente,Data_Nascimento)
VALUES 
(1,'André Martins','19890212'),
(2,'Bárbara Campos','19920507'),
(3,'Carol Freitas','19850423'),
(4,'Diego Cardoso','19941011'),
(5,'Eduardo Pereira','19881109'),
(6,'Fabiana Silva','19890902'),
(7,'Gustavo Barbosa','19930627'),
(8,'Helen Viana','19900211')

INSERT INTO dGerente (Id_Gerente,Nome_Gerente,Data_de_Contratacao,Salario)
VALUES 
(1,'Lucas Sampaio','20150321', 6700),
(2,'Mariana Padilha','20110210', 9900),
(3,'Nathália Santos','20181003', 7200),
(4,'Otávio Costa','20170418', 11000)

INSERT INTO fContratos (Id_Contrato,Data_de_Assinatura,id_Cliente,Id_Gerente,Valor_do_Contrato)
VALUES
(1, '20190112', 8, 1, 23000),
(2, '20190210', 3, 2, 15500),
(3, '20190307', 7, 2, 6500),
(4, '20190315', 1, 3, 33000),
(5, '20190321', 5, 4, 11100),
(6, '20190323', 4, 2, 5500),
(7, '20190328', 9, 3, 55000),
(8, '20190404', 2, 1, 31000),
(9, '20190405', 10, 4, 3400),
(10, '20190405', 6, 2, 9200)

SELECT * FROM dCliente --! Consulta
SELECT * FROM dGerente --! Consulta
SELECT * FROM fContratos --! Consulta

=========================
      Exercício 04
=========================

-----------------------//

=========================
      Exercício 05
=========================

UPDATE fContratos
SET 
Data_de_Assinatura = '17/03/2019',
Id_Gerente = 2,
Valor_do_Contrato = 33500
WHERE Id_Contrato = 4

SELECT * FROM fContratos

=========================
      Exercício 06
=========================