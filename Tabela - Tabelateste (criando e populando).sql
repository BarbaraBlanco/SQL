-- Cria a tabela
CREATE TABLE [dbo].[tabelateste](
[c11] [numeric](18, 0) NOT NULL,
[c12] [numeric](18, 0) NULL,
[c13] [numeric](18, 0) NULL,
[c14] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ttabela1] PRIMARY KEY CLUSTERED ([c11] ASC)
) 
GO

-- Popula a tabela
DECLARE @id INT = 1;

-- Loop para inserir as 10000 linhas aleatórias
BEGIN TRANSACTION -- inicia transação

WHILE (@id <= 1000)
BEGIN
  -- Inserção
  INSERT INTO tabelateste (c11,c12,c13,c14)
  VALUES (@id, @id+1, @id*2, @id*3);

  SET @id = @id+1;
 END

commit; -- conclui transação
