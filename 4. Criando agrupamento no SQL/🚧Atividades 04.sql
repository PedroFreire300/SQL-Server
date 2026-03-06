-- a) Resumo da quantidade vendida por canal de vendas
SELECT 
    ChannelKey,
    SUM(SalesQuantity) AS TotalQuantidadeVendida
FROM FactSales
GROUP BY ChannelKey
ORDER BY ChannelKey;

-- b) Agrupamento de quantidade vendida e devolvida por loja
SELECT 
    StoreKey,
    SUM(SalesQuantity) AS TotalQuantidadeVendida,
    SUM(ReturnQuantity) AS TotalQuantidadeDevolvida
FROM FactSales
GROUP BY StoreKey
ORDER BY StoreKey;

-- c) Resumo do valor total vendido por canal em 2007
SELECT 
    ChannelKey,
    SUM(SalesAmount) AS TotalValorVendido
FROM FactSales
WHERE YEAR(DateKey) = 2007
GROUP BY ChannelKey
ORDER BY ChannelKey;