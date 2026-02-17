create procedure trans_completa
@codigo int, @nome char(60),@endereco char(100),
@telefone char(13),@rg char(50),@cpf char(15),
@numero int,  /* atributo de conta */
@valor_cc money,   /* atributo de conta corrente */
@valor_poup money,   /* atributos de conta poupança */
@conjunta char(1)  /* atributo de conta */

as
begin
DECLARE @retorno int;

begin transaction

exec @retorno = ins_pessoa_fisica @codigo, @nome, @endereco, @telefone, @rg, @cpf

if @retorno = 0  /* inserção de cliente pessoa física bem sucedida */
	begin
	exec @retorno = ins_conta @codigo, @numero, 0, @valor_cc, @conjunta
	if @retorno = 0  /* inserção de conta corrente bem sucedida - TIPO 0*/
		commit transaction
	else   
		rollback transaction
	end
end