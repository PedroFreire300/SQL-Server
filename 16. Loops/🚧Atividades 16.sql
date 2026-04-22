=========================
      Exercício 01
=========================

DECLARE @ValorInicial  INT = 0 
DECLARE @ValorFinal  INT = 22

WHILE @ValorInicial < @ValorFinal
BEGIN
    SET @ValorInicial += 1
    PRINT CONCAT('O valor do contador é:',@ValorInicial)   
END