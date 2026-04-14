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

SELECT  * FROM dCliente
SELECT  * FROM dGerente
SELECT  * FROM fContratos

=========================
      Exercício 03
=========================

INSERT INTO dCliente (Id_cliente,Nome_cliente,Data_Nascimento)
VALUES (1,'André Martins','19890212'),
 (2,'Bárbara Campos','19920507'),
 (3,'Carol Freitas','19850423'),
 (4,'Diego Cardoso','19941011'),
 (5,'Eduardo Pereira','19881109'),
 (6,'Fabiana Silva','19890902'),
 (7,'Gustavo Barbosa','19930627'),
 (8,'Helen Viana','19900211')

