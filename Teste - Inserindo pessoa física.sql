DECLARE @nome char(60);
DECLARE @codigo int;
DECLARE @endereco char(100);
DECLARE @telefone char(13);
DECLARE @rg char(15);
DECLARE @cpf char(15);


DECLARE @erro char(1);

SET @nome = 'bb';
SET @codigo = 97;
SET @endereco = 'RUA 1';
SET @telefone = '123678888';
SET @RG = '1234';
set @CPF = '7890';

EXEC @erro = ins_pessoa_fisica @codigo, @nome, @endereco, @telefone, @rg,  @cpf;

if @erro = '0'
	print 'deu certo';
else
	print 'deu errado';
GO 

