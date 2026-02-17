-- Criar tabela de resumo
CREATE TABLE Vendas_Sumario (
    ID_Produto INT,
    Valor_Total money   )

-- Declarar o cursor
DECLARE cursor_vendas CURSOR FOR
SELECT v.ID_Produto, sum(p.Preco) T_preco, sum(v.Quant) T_quant
FROM Venda v INNER JOIN Produto p 
ON v.ID_Produto = p.ID_Produto
Group by v.Id_produto
Order by v.Id_produto;
