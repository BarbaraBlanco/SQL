DECLARE @a int, @b int, @c int

-- Declarando o Cursor para percorrer os registros
DECLARE cursor_teste
CURSOR FOR  select c12,c13,c14 from tabelateste

-- Abrindo Cursor
OPEN cursor_teste

-- Lendo a primeira linha
FETCH NEXT FROM cursor_teste INTO @a, @b, @c

-- enquanto tem registros
WHILE @@FETCH_STATUS = 0 
BEGIN
     -- Executando a operação desejada               
    update tabelateste set c14 = @a+@b
     -- Lendo a próxima linha               
    FETCH NEXT FROM cursor_teste INTO @a, @b, @c
END

-- Fechando Cursor para leitura    
CLOSE cursor_teste
-- Finalizado o cursor    
DEALLOCATE cursor_teste
