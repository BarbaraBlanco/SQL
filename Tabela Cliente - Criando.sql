-- Cria a tabela "cliente"
CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(50),
  sobrenome VARCHAR(50),
  endereco VARCHAR(100),
  data_aniversario DATE,
  genero VARCHAR(10),
  escolaridade VARCHAR(20)
);