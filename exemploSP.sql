create procedure sp_inserir_valor_hash_encadeado
    @valor int

as
    begin 
        declare @posicao int = valor % 5;
        declare @ultimo_id int;

        -- verifica se já existe algum valor na posição (colisão)
        select top 1 @ultimo_id = id;
        from HashTable
        where posicao = @posicao and proximo_id is null
        order by id desc;

        -- insere novo valor
        insert into HashTable (posicao, valor)
        values(@posicao, @valor);

        declare @novo_id int = scope_identify();

        -- se houver colisão, atualiza o encadeamento
        if @ultimo_id is not null
        begin 
            update HashTable
            set proximo_id = @novo_id
            where id = @ultimo_id;
        end 
    end;


-- Como usar:
    exec sp_inserir_valor_hash_encadeado 12;
    exec sp_inserir_valor_hash_encadeado 7;
    exec sp_inserir_valor_hash_encadeado 22;

-- Consultar:
    select * from HashTable order by posicao, id;

-- Resultado esperado:
    id	    posicao	valor	proximo_id
    1	    2	    12	    2
    2	    2	    7	    3
    3	    2	    22	    NULL