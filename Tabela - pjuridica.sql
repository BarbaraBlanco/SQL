
CREATE TABLE [dbo].[pjuridica](
	[codigo] [int] NOT NULL,
	[cnpj] [char](15) NULL,
	[nfantasia] [char](100) NULL,
 CONSTRAINT [PK_pjuridica] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC ) ) ON [PRIMARY]
GO


