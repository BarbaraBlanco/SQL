CREATE TABLE [dbo].[Produto]
(
[cod] [int] NOT NULL,
[nome] [char](50) NULL,
[preco] [real] NULL,
[quant_emestoque] [int] NULL,
[quant_minima] [int] NULL,
CONSTRAINT [PK_Produto] PRIMARY KEY
CLUSTERED ( [cod] ASC ) )