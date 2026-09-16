
=====================
VERSÃO 
=====================
SELECT @@VERSION; 

=====================
SERVIDOR
=====================
SELECT @@SERVERNAME; 

=====================
COPIAR TABELA
=====================
SELECT * INTO NovaTabela FROM TabelaOriginal;

=====================
PROCURAR UMA COLUNA PELO NOME
=====================
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductSubcategoryKey';

=====================
DEFINIÇÃO DE UMA VIEW EXISTENTE
=====================
EXEC sp_helptext 'Nome da View';
