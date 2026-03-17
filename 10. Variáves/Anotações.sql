
DECLARE 

@produto VARCHAR(10) = 'Celular',
@quantidade INT = 12,
@preco FLOAT = 9.6908,
@faturamento FLOAT
-- Set porque quero guardar um valor
Set @faturamento = @quantidade * @preco

SELECT 

@produto AS 'Produto',
@quantidade AS 'Quantidade',
@preco AS 'Preço',

-- Round,Ceiling e Floor
round(@faturamento,2) AS 'Faturamento'

-- Juntar texto + número com o concat é bem mais profissional
PRINT CONCAT ('O Valor do produto foi de ', @faturamento)

-- cast e format
PRINT 'O Valor do produto foi de ' +  cast(@faturamento AS VARCHAR(10))

-- Nome do servidor
-- SELECT @@SERVERNAME

-- VERSÃO
-- SELECT @@VERSION