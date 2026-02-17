-- Popula a tabela
DECLARE @a int = 1;
DECLARE @b char(50);
DECLARE @c numeric (6,2);
DECLARE @d int;

DECLARE @T_nomes TABLE (nome VARCHAR(50));
INSERT INTO @T_nomes VALUES ('laranja'), ('banana'), ('maca'), ('pera'), ('abacate'), ('limao'), ('acelora'), ('tomate'), ('goiaba'), ('manga');


-- Inserir as 100 produtos aleatórios 
BEGIN TRANSACTION -- inicia transação

WHILE (@a <= 10)
BEGIN
  -- Inserção
  SET @d = (SELECT FLOOR(1 + RAND() * 100));
  SET @b = (SELECT TOP 1 nome FROM @T_nomes ORDER BY NEWID());
  SET @c = (SELECT ROUND(RAND() * (500 - 10) + 10, 2));

  INSERT INTO Produto (cod, nome, preco, quant_emestoque, quant_minima) values (@a,@b, @c, @d*1.1, @d);

  SET @a = @a+1;
 END

commit; -- conclui transação
