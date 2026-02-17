-- Declarar o cursor
DECLARE cursor_vendas CURSOR FOR
SELECT v.ID_Produto, sum(p.Preco) T_preco, sum(v.Quant) T_quant
FROM Venda v INNER JOIN Produto p 
ON v.ID_Produto = p.ID_Produto
Group by v.Id_produto;

-- Declarar variáveis necessárias
DECLARE @ID_Produto INT
DECLARE @Quantidade INT
DECLARE @Preco MONEY
DECLARE @Valor_Total DECIMAL(10, 2)

-- Abrir o cursor
OPEN cursor_vendas

-- Ler a primeira linha do cursor (Produto Join Venda)
FETCH NEXT FROM cursor_vendas INTO @ID_Produto, @Preco, @Quantidade

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calcular o valor total da venda
    SET @Valor_Total = @Preco * @Quantidade
    
    -- Inserir o valor total na tabela de resumo
    INSERT INTO Vendas_Sumario (ID_Produto, Valor_Total)
    VALUES (@ID_Produto, @Valor_Total)
    
    -- Ler a próxima linha do cursor
    FETCH NEXT FROM cursor_vendas INTO @ID_Produto, @Preco, @Quantidade
END

-- Fechar o cursor
CLOSE cursor_vendas
DEALLOCATE cursor_vendas
