
CREATE TABLE [dbo].[cliente_conta](
	[codigo] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_cliente_conta] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC,
	[numero] ASC,
	[tipo] ASC
) ) ON [PRIMARY]
GO


