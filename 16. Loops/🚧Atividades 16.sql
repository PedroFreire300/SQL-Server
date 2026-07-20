=========================
      Exercício 01
=========================
declare 

@ValorInicial INT = 0,
@ValorFinal INT = 100

while @ValorInicial <= @ValorFinal
begin 
      set @ValorInicial += 10
      print concat('O valor do contador é ', @ValorInicial)
end
=========================
      Exercício 02
=========================


=========================
      Exercício 03
=========================
create table Calendario (
      data date
)

declare 
      @Start date = '01-01-2021',
      @Finish date = '31-12-2021'

while @Start <= @Finish
begin
      insert into Calendario(data) 
      values(
            @Start
      )
      set @Start = dateadd(day,1,@Start)
end

select * from Calendario

=========================
         Extra
=========================

DECLARE
      @valor int = 3,
      @multiplicador int = 0,
      @tabuada int

WHILE @multiplicador < 15
BEGIN
      SET @multiplicador += 1
      SET @tabuada = @multiplicador * @valor
      PRINT concat(@multiplicador, '*', @valor, '=', @tabuada)
END
      
