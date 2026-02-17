-- Popula a tabela
DECLARE @aux INT = 1;

-- Inserir as 100 produtos aleatórios 
BEGIN TRANSACTION -- inicia transação

WHILE (@aux <= 100)
BEGIN
  -- Inserção
  INSERT INTO Produto (ID_Produto, preco)
  VALUES (@aux, @aux*1.1);

  SET @aux = @aux+1;
 END

commit; -- conclui transação
