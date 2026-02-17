
CREATE TABLE [dbo].[Cliente](
	[codigo] [int] NOT NULL,
	[nome] [char](60) NULL,
	[endereco] [char](100) NULL,
	[telefone] [char](13) NULL,
	[tipo] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC) )
GO


