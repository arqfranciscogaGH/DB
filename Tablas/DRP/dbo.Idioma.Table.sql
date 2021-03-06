
/****** Object:  Table [dbo].[Idioma]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Idioma]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[IdIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](50) NULL,
	[Cultura] [nvarchar](30) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[IdIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([IdIdioma], [Titulo], [Cultura], [Activo]) VALUES (1, N'Español', N'es-MX', 1)
INSERT [dbo].[Idioma] ([IdIdioma], [Titulo], [Cultura], [Activo]) VALUES (2, N'Ingles', N'en-US', 1)
SET IDENTITY_INSERT [dbo].[Idioma] OFF
