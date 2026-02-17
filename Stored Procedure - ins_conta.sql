create or alter procedure ins_conta
@codigo numeric(10,0), @numero numeric(8,0),
@tipo tinyint, @saldo money, @conjunta char(1)
as
begin 
begin transaction
insert into conta values (@numero, @tipo, @saldo, @conjunta)
if @@rowcount > 0 /* inserção de conta corrente bem sucedida */
	begin
	insert into cliente_conta values (@codigo, @numero, @tipo)
	if @@rowcount > 0
		begin
		commit transaction
		return 0
		end
	else
		begin 
		rollback transaction
		return 1
		end
	end
else
	begin
	rollback transaction
	return 1
	end
end
