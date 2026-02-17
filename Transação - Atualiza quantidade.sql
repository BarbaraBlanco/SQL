DECLARE @produto_id INT;
DECLARE @produto_preco money;
DECLARE @quantidade int;
DECLARE cursor3 CURSOR FOR 
SELECT id_produto, preco, quant FROM produto;
OPEN cursor3;
FETCH NEXT FROM cursor3 INTO @produto_id, @produto_preco, @quantidade;

SET TRANSACTION ISOLATION LEVEL Read Committed;
BEGIN TRANSACTION

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calcula a nova quantidade com 1% de aumento
    SET @quantidade = @quantidade * 1.01;
    -- Atualiza a quantidade na tabela de produtos
    UPDATE produto SET quant = @quantidade WHERE id_produto = @produto_id;
    -- Mostra a alteração da quantidade
    PRINT CONCAT('Id:',@produto_id,' Preço R$', @produto_preco, ' Quant atualizada:',@quantidade);
    FETCH NEXT FROM cursor3 INTO @produto_id, @produto_preco, @quantidade;
END;

Commit;
CLOSE cursor3;
DEALLOCATE cursor3;
