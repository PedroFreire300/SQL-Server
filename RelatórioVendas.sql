/*
Relatório de Vendas por Loja - Contoso

Objetivo:
Gerar um relatório com as 10 lojas que mais venderam, mostrando:
- Nome da loja padronizado
- Valor total vendido
- Valor de imposto calculado sobre as vendas
- Data e hora de geração do relatório

O que foi utilizado neste script:
- DECLARE (variável)
- SELECT TOP
- INNER JOIN
- SUM (função de agregação)
- GROUP BY
- ORDER BY
- CASE
- CHARINDEX
- LEFT
- REPLACE
- UPPER
- FORMAT (moeda)
- CONVERT (formatação de data)
- SYSDATETIME
- PRINT
- CONCAT
*/

Declare @imposto FLOAT = 0.05

SELECT TOP (10)

upper(REPLACE (CASE
    WHEN CHARINDEX(' Online', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Online', DS.StoreName) - 1)
    WHEN CHARINDEX(' No.', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' No.', DS.StoreName) - 1)
    WHEN CHARINDEX(' Store', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Store', DS.StoreName) - 1)
    WHEN CHARINDEX(' Reseller', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Reseller', DS.StoreName) - 1)
    ELSE DS.StoreName
END, 'Contoso', 'Filial')) AS Loja,

FORMAT(Sum(FS.SalesAmount), 'C') AS ValorProdutoTotal,

FORMAT(Sum(FS.SalesAmount) * @imposto, 'C') AS Imposto


FROM FactSales FS
INNER JOIN DimStore DS
ON FS.StoreKey = DS.StoreKey
GROUP BY 

UPPER ( REPLACE (CASE
    WHEN CHARINDEX(' Online', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Online', DS.StoreName) - 1)
    WHEN CHARINDEX(' No.', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' No.', DS.StoreName) - 1)
    WHEN CHARINDEX(' Store', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Store', DS.StoreName) - 1)
    WHEN CHARINDEX(' Reseller', DS.StoreName) > 0
        THEN LEFT(DS.StoreName, CHARINDEX(' Reseller', DS.StoreName) - 1)
    ELSE DS.StoreName
END, 'Contoso', 'Filial'))

ORDER BY Sum(FS.SalesAmount) DESC

PRINT CONCAT ( 'Último relátorio emitido em ' ,CONVERT(VARCHAR, SYSDATETIME (),103),' as ', CONVERT(VARCHAR, SYSDATETIME (),108) )

