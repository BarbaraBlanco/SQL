DECLARE @nome char(60);
DECLARE @codigo int;
DECLARE @endereco char(100);
DECLARE @telefone char(13);
DECLARE @rg char(15);
DECLARE @cpf char(15);
DECLARE @numero int;
DECLARE @valor_cc money;
DECLARE @valor_poup money;
DECLARE @conjunta int;


DECLARE @erro char(1);

SET @nome = 'jjkkjk';
SET @codigo = 976;
SET @endereco = 'RUA 1';
SET @telefone = '123678888';
SET @rg = '1234';
set @cpf = '7890';
set @numero = 1;
set @valor_cc = 123.90;
set @valor_poup = 567.10;
set @conjunta = 1

EXEC @erro = trans_completa @codigo, @nome, @endereco, @telefone, @rg, @numero,
                            @cpf, @valor_cc, @valor_poup, @conjunta;

if @erro = '0'
	print 'deu certo';
else
	print 'deu errado';
GO 

