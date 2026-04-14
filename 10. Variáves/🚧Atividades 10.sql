=========================
      Exercício 01
=========================

A)

DECLARE 

@valor1 INT = 10,
@valor2 INT = 5,
@valor3 INT = 34,
@valor4 INT = 7

Declare @soma INT
Set @soma = @valor1 + @valor2
SELECT @soma as 'SOMA'

B) 
 
DECLARE 

@valor1 INT = 10,
@valor2 INT = 5,
@valor3 INT = 34,
@valor4 INT = 7,

@subtração INT 
Set @subtração = @valor3 - @valor4
Select @subtração AS 'Subtração'

C) 

DECLARE 

@valor1 INT = 10,
@valor2 INT = 5,
@valor3 INT = 34,
@valor4 INT = 7,

@multiplicação INT 
Set @multiplicação = @valor1 * @valor4
Select @multiplicação AS 'Multiplicação'

D) 

DECLARE 

@valor1 FLOAT = 10,
@valor2 FLOAT = 5,
@valor3 FLOAT = 34,
@valor4 FLOAT = 7,

@divisao FLOAT 
Set @divisao = @valor3 / @valor4
Select @divisao AS 'Divisão'

E)

DECLARE 

@valor1 FLOAT = 10,
@valor2 FLOAT = 5,
@valor3 FLOAT = 34,
@valor4 FLOAT = 7,

@divisao FLOAT 
Set @divisao = @valor3 / @valor4
Select round(@divisao,2) AS 'Divisão'

=========================
      Exercício 02
=========================

DECLARE 

@produto VARCHAR(10) = 'Celular',
@quantidade INT = 12,
@preco FLOAT = 9.99,
@faturamento FLOAT
Set @faturamento = @quantidade * @preco

SELECT 

@produto AS 'Produto',
@quantidade AS 'Quantidade',
@preco AS 'Preço',
@faturamento AS 'Faturamento'

=========================
      Exercício 03
=========================

DECLARE

@nome VARCHAR(10) = 'André',
@data_nascimento VARCHAR(10) = '10/02/1998',
@num_pets INT = 2 

PRINT
CONCAT ('Meu nome é ', @nome,' , nasci em ', @data_nascimento,' e tenho ', @num_pets, ' pets')

=========================
      Exercício 04
=========================

SELECT * FROM DimStore

-- ! Refazer
-- Criação de uma variável chamada @lista
-- Ela vai armazenar TEXTO (VARCHAR) com no máximo 50 caracteres
DECLARE @lista VARCHAR(50)

-- Inicializa a variável vazia, por usamos o set
-- * Isso é MUITO importante, porque vamos "somar" textos depois
SET @lista = ''

-- Aqui começa a parte MAIS IMPORTANTE do exercício
-- ! Esse SELECT não está retornando tabela... ele está funcionando como um LOOP escondido

SELECT 
    @lista = @lista + StoreName + ' e '
    -- Tradução mental:
    -- "Para cada linha encontrada, pegue o valor atual de @lista
    -- e adicione o nome da loja + ' e ' no final"

FROM DimStore

-- Filtra apenas lojas fechadas em 2008
-- (OBS: isso não é a melhor prática, mas funciona)
WHERE CloseDate LIKE '%2008%'

-- Aqui o SQL já terminou o "loop escondido"
-- e a variável @lista agora contém TODOS os nomes concatenados

PRINT 'As lojas fechadas no ano de 2008 foram: ' + @lista
-- Exibe o resultado final juntando texto fixo + variável