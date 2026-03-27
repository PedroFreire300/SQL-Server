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
    WHEN CHARINDEX(' Online', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Online', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' No.', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' No.', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' Store', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Store', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' Reseller', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Reseller', DimStore.StoreName) - 1)
    ELSE DimStore.StoreName
END, 'Contoso', 'Filial')) AS Loja,

FORMAT(Sum(FactSales.SalesAmount), 'C') AS ValorProduto,

FORMAT(Sum(FactSales.SalesAmount) * @imposto, 'C') AS Imposto


FROM FactSales
INNER JOIN DimStore
ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY 

UPPER ( REPLACE (CASE
    WHEN CHARINDEX(' Online', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Online', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' No.', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' No.', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' Store', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Store', DimStore.StoreName) - 1)
    WHEN CHARINDEX(' Reseller', DimStore.StoreName) > 0
        THEN LEFT(DimStore.StoreName, CHARINDEX(' Reseller', DimStore.StoreName) - 1)
    ELSE DimStore.StoreName
END, 'Contoso', 'Filial'))

ORDER BY Sum(FactSales.SalesAmount) DESC

PRINT CONCAT ( 'Último relátorio emitido em ' ,CONVERT(VARCHAR, SYSDATETIME (),103),' as ', CONVERT(VARCHAR, SYSDATETIME (),108) )

