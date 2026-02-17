DECLARE @produto_id INT;
DECLARE @produto_preco money;
DECLARE @quantidade int;
DECLARE cursor2 CURSOR FOR 
SELECT id_produto, preco, quant FROM produto;

OPEN cursor2;
FETCH NEXT FROM cursor2 INTO @produto_id, @produto_preco, @quantidade;

SET TRANSACTION ISOLATION LEVEL Read Committed;
BEGIN TRANSACTION

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calcula o novo preço com 1% de aumento
    SET @produto_preco = @produto_preco * 1.01;
    -- Atualiza o preço na tabela de produtos
    UPDATE produto SET preco = @produto_preco WHERE id_produto = @produto_id;
    -- Mostra a alteração do preço
    PRINT CONCAT('Id:',@produto_id,' Preço atualizado para R$', @produto_preco, ' Quant:',@quantidade);
    FETCH NEXT FROM cursor2 INTO @produto_id, @produto_preco, @quantidade;
END;

Commit;
CLOSE cursor2;
DEALLOCATE cursor2;
