create table HashTable (
    id int identify(1,1) primary key,
    posicao int,        -- resultado do hash
    valor int,          -- valor real
    proximo_id int null -- id do proximo elemento (simulando encadeamento)
);

-- Inserir primeiro valor (sem encadeamento ainda)
INSERT INTO HashTable (posicao, valor)
VALUES (12 % 5, 12); -- hash = 2

-- Inserir segundo valor que vai colidir
INSERT INTO HashTable (posicao, valor)
VALUES (7 % 5, 7);  -- hash = 2

-- Atualiza o encadeamento do primeiro
UPDATE HashTable
SET proximo_id = 2
WHERE id = 1;

-- Inserir terceiro valor que colide de novo
INSERT INTO HashTable (posicao, valor)
VALUES (22 % 5, 22);  -- hash = 2

-- Atualiza o encadeamento do segundo
UPDATE HashTable
SET proximo_id = 3
WHERE id = 2;