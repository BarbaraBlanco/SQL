CREATE TABLE Produto (
ID_Produto int NOT NULL,
Preco money NULL,
Quant int,
CONSTRAINT PK_Produto 
PRIMARY KEY CLUSTERED 
(ID_Produto ASC ))
