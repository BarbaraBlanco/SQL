create procedure ins_pessoa_fisica
@codigo int, @nome char(60),
@endereco char(100),@telefone char(13), @rg char(15), @cpf char(15)
as 
begin 
begin transaction

insert into cliente 
values (@codigo, @nome, @endereco, @telefone, 0)
if @@rowcount > 0  /* insercao de cliente bem sucedida */
	begin
	insert into pfisica
	values (@codigo, @rg, @cpf)
	if  @@rowcount > 0  /* insercao de pessoa física bem sucedida */
		begin
		commit transaction
		return 0
		end
	Else 	
	    begin
		rollback transaction
		return 1
		end
	end
Else    
    begin
	    rollback transaction
	    return 1
	end
end
