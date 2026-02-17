-- Popula a tabela
DECLARE @aux INT = 0;
DECLARE @aux2 INT;
DECLARE @aux3 INT;

-- Inserir as 1000 vendas aleatórias
BEGIN TRANSACTION -- inicia transação

WHILE (@aux <= 1000)
BEGIN
  -- Inserção
  SET @aux = @aux+1;
  SET @aux2 = (SELECT FLOOR(1 + RAND() * 100));
  SET @aux3 = (SELECT FLOOR(1 + RAND() * 1000));

  INSERT INTO Venda (ID_Venda, ID_Produto, Quant)
  VALUES (@aux, @aux2, @aux3);
    
 END

commit; -- conclui transação
