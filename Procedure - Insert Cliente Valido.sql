CREATE PROCEDURE [dbo].[proc_teste9]
-- parametros
@a char(60), 
@b int, 
@c char(120), 
@d char(11),
@erro char(1) OUTPUT

AS
BEGIN
	if dbo.CPF_VALIDO(@d) = 'S'  /* chamada de função de verificação de CPF */
	begin
		INSERT INTO dbo.Cliente (Cod_Cl, Nome, Endereco, CPF) values (@b, @a, @c, @d);
		set @erro = '0';
	end
	else
	begin
		set @erro = '1';
	end
	return
END
