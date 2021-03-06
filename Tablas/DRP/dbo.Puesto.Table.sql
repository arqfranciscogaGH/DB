
/****** Object:  Index [PK_Puesto]    Script Date: 27/01/2022 01:40:26 a. m. ******/
ALTER TABLE [dbo].[Puesto] DROP CONSTRAINT [PK_Puesto]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Puesto](
	[IdPuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[IdSuscriptor] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Puesto] ON 

INSERT [dbo].[Puesto] ([IdPuesto], [Nombre], [Activo], [IdSuscriptor]) VALUES (1, N'Socio', 1, 1)
INSERT [dbo].[Puesto] ([IdPuesto], [Nombre], [Activo], [IdSuscriptor]) VALUES (2, N'Ejecutivo financiero', 1, 1)
INSERT [dbo].[Puesto] ([IdPuesto], [Nombre], [Activo], [IdSuscriptor]) VALUES (3, N'Gerente', 1, 1)
INSERT [dbo].[Puesto] ([IdPuesto], [Nombre], [Activo], [IdSuscriptor]) VALUES (4, N'Director', 1, 1)
INSERT [dbo].[Puesto] ([IdPuesto], [Nombre], [Activo], [IdSuscriptor]) VALUES (5, N'Administrador de Proyecto', 1, 1)
SET IDENTITY_INSERT [dbo].[Puesto] OFF
/****** Object:  Index [PK_Puesto]    Script Date: 27/01/2022 01:40:28 a. m. ******/
ALTER TABLE [dbo].[Puesto] ADD  CONSTRAINT [PK_Puesto] PRIMARY KEY NONCLUSTERED 
(
	[IdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
