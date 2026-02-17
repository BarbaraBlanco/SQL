CREATE TABLE Produto (
ID_Produto int NOT NULL,
Preco money NULL,
CONSTRAINT PK_Produto PRIMARY KEY CLUSTERED 
( ID_Produto ASC ) )


CREATE TABLE Venda (
ID_Venda int NOT NULL,
ID_Produto int NULL,
Quant int NULL,
CONSTRAINT PK_Venda PRIMARY KEY CLUSTERED 
( ID_Venda ASC ) )

ALTER TABLE Venda
WITH CHECK ADD  CONSTRAINT FK_Venda_Produto FOREIGN KEY(ID_Produto)
REFERENCES Produto (ID_Produto)
