=========================
      Exercício 01
=========================

A)
declare
      @valor1 int = 10,
      @valor2 int = 5,
      @valor3 int = 34,
      @valor4 int = 7,
      @soma int 
      set @soma = @valor1 + @valor2
print 'Resultado da soma:' + cast(@soma as varchar(10))

B)
declare
      @valor1 int = 10,
      @valor2 int = 5,
      @valor3 int = 34,
      @valor4 int = 7,
      @sub int 
      set @sub = @valor3 - @valor4
print 'Resultado da subtração:' + cast(@sub as varchar(10))

C)
declare
      @valor1 int = 10,
      @valor2 int = 5,
      @valor3 int = 34,
      @valor4 int = 7,
      @mult int 
      set @mult = @valor1 * @valor4
print 'Resultado da multiplicação:' + cast(@mult as varchar(10))

D)
declare
      @valor1 int = 10,
      @valor2 int = 5,
      @valor3 int = 34,
      @valor4 int = 7,
      @div int 
      set @div = @valor3 / @valor4
print 'Resultado da divisão:' + cast(@div as varchar(10))

=========================
      Exercício 02
=========================
declare
      @produto varchar(30) = 'celular',
      @quantidade int = 12,
      @preco decimal(10,2) = 9.99,
      @faturamento decimal(10,2)
      set @faturamento = @quantidade * @preco
print 'O faturamento do produto ' + @produto + ' foi de R$' + cast(@faturamento as varchar(10))

=========================
      Exercício 03
=========================
create or alter proc prSimularDados
	@nome as varchar(30),
	@data_nascimento as date,
	@num_pets as int
as begin
	print 'Meu nome é ' + @nome + ', nasci em ' + cast(@data_nascimento as varchar(20)) + ' e tenho ' + cast(@num_pets as varchar(1)) + ' pets.'
end

exec prSimularDados 'Pedro','25-03-2004',2

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

"DECLARE @lista VARCHAR(MAX)

SET @lista = ''

SELECT
    @lista = @lista + StoreName + ' e '
FROM DimStore
WHERE YEAR(CloseDate) = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + @lista"

=========================
      Exercício 05
=========================
declare @categoria varchar(30) = 'Lamps'

select * from DimProduct
where ProductSubcategoryKey = (
select
      ProductSubcategoryKey
from DimProductSubcategory 
where ProductSubcategoryName = @categoria)