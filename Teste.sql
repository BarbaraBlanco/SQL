DECLARE @nome char(60);
DECLARE @cod int;
DECLARE @ender char(120);
DECLARE @cpf char(11);
DECLARE @erro char(1);

SET @nome = 'bb';
SET @cod = 98007;
SET @ender = 'RUA 1';
SET @cpf = '12345678888';

EXEC proc_teste9 @nome, @cod, @ender, @cpf, @erro OUTPUT;

if @erro = '0'
	print 'deu certo';
else
	print 'deu errado';
GO 

