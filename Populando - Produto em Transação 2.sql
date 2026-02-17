-- Popula a tabela
DECLARE @aux int = 1000000;
DeCLARE @aux2 int;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION -- inicia transação

WHILE (@aux < 2000000)
BEGIN
  -- Inserção
  SET @aux = @aux+1;
  SET @aux2 = (SELECT FLOOR(1 + RAND() * 100));

  INSERT INTO Produto (ID_Produto, preco, Quant)
  VALUES (@aux, @aux*1.1, @aux2);

END

commit; -- conclui transação
