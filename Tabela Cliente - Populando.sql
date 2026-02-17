
-- Define as listas de nomes, endereços e escolaridades
DECLARE @T_nomes TABLE (nome VARCHAR(50));
INSERT INTO @T_nomes VALUES ('Ana'), ('Bianca'), ('Caio'), ('Daniel'), ('Eduarda'), ('Fernanda'), ('Gabriel'), ('Helena'), ('Igor'), ('Julia');

DECLARE @T_sobrenomes TABLE (sobrenome VARCHAR(50));
INSERT INTO @T_sobrenomes VALUES ('Silva'), ('Santos'), ('Oliveira'), ('Souza'), ('Ferreira'), ('Lima'), ('Alves'), ('Pereira'), ('Ribeiro'), ('Costa');

DECLARE @T_enderecos TABLE (endereco VARCHAR(100));
INSERT INTO @T_enderecos VALUES ('Rua A, 123'), ('Rua B, 456'), ('Rua C, 789'), ('Avenida X, 321'), ('Avenida Y, 654'), ('Avenida Z, 987');

DECLARE @T_escolaridades TABLE (escolaridade VARCHAR(20));
INSERT INTO @T_escolaridades VALUES ('Fundamental'), ('Médio'), ('Superior');

-- Define as datas de aniversário inicial e final
DECLARE @data_inicial DATE = '1950-01-01';
DECLARE @data_final DATE = '2010-12-31';

-- Inicializa uma variável para o ID
DECLARE @teste_transacao INT;
DECLARE @id INT = 1;
DECLARE @nome VARCHAR(50);
DECLARE @sobrenome VARCHAR(50);
DECLARE @endereco VARCHAR(100);
DECLARE @escolaridade VARCHAR(20);
DECLARE @data_aniversario DATE;
DECLARE @genero VARCHAR(10)

-- Loop para inserir as linhas aleatórias
WHILE (@id <= 1000000)
BEGIN
  SET @nome = (SELECT TOP 1 nome FROM @T_nomes ORDER BY NEWID());
  SET @sobrenome = (SELECT TOP 1 sobrenome FROM @T_sobrenomes ORDER BY NEWID());
  SET @endereco = (SELECT TOP 1 endereco FROM @T_enderecos ORDER BY NEWID());
  SET @escolaridade = (SELECT TOP 1 escolaridade FROM @T_escolaridades ORDER BY NEWID());
  SET @data_aniversario = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % (DATEDIFF(DAY, @data_inicial, @data_final) + 1), @data_inicial);
  SET @genero = CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'Feminino'ELSE 'Masculino' END;

  -- abrindo uma transação
  SET @teste_transacao = @id%1000;
  if @teste_transacao = 0
      begin transaction;

  -- Inserção
  INSERT INTO cliente (id, nome, sobrenome, endereco, data_aniversario, genero, escolaridade)
  VALUES (@id, @nome, @sobrenome, @endereco, @data_aniversario, @genero, @escolaridade);

  -- Avaliando situação de transação
  SET @teste_transacao = @id%1000;
  if @teste_transacao = 0
	commit;

  SET @id = @id+1;
  END
  commit;