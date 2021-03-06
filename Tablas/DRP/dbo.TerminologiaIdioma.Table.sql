
/****** Object:  Table [dbo].[TerminologiaIdioma]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[TerminologiaIdioma]
GO
/****** Object:  Table [dbo].[TerminologiaIdioma]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TerminologiaIdioma](
	[IdTerminologiaIdioma] [int] IDENTITY(1,1) NOT NULL,
	[IdTerminologia] [int] NULL,
	[IdIdioma] [int] NULL,
	[Texto] [varchar](max) NULL,
	[Activo] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[TerminologiaIdioma] ADD [Titulo] [varchar](max) NULL
 CONSTRAINT [PK_TerminologiaIdioma] PRIMARY KEY CLUSTERED 
(
	[IdTerminologiaIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TerminologiaIdioma] ON 

INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (1, 1, 1, N'La  operación se realizó completa', 1, N'Operación')
INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (2, 1, 2, N'
The operation was completed', 1, N'Operation')
INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (3, 2, 1, N' No tiene permiso a la  funcionalidad, consulte con el Admisnitrador', 1, N'Permisos')
INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (4, 2, 2, N'
You do not have permission to the functionality, check with the Admisnitrator', 1, N'Permission')
INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (5, 3, 1, N'Se  ha seleccionado el elemento', 1, N'Elemento seleccionado ')
INSERT [dbo].[TerminologiaIdioma] ([IdTerminologiaIdioma], [IdTerminologia], [IdIdioma], [Texto], [Activo], [Titulo]) VALUES (6, 3, 2, N'Item has been selected', 1, N'Item selected')
SET IDENTITY_INSERT [dbo].[TerminologiaIdioma] OFF
