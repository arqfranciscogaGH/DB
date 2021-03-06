
/****** Object:  Index [PK_Perfil]    Script Date: 01/02/2022 12:17:08 a. m. ******/
ALTER TABLE [dbo].[Perfil] DROP CONSTRAINT [PK_Perfil]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 01/02/2022 12:17:08 a. m. ******/
DROP TABLE [dbo].[Perfil]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 01/02/2022 12:17:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Pagina] [varchar](100) NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL,
	[IdMenu] [int] NULL,
	[Privilegios] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Pagina], [IdSuscriptor], [Activo], [IdMenu], [Privilegios]) VALUES (1, N'Administrador Sistema', N'~/Paginas/AdministrarUsuarioV40.aspx', 1, 1, 11, N'75,48,55,33,1095,52,2096,2098,6118,3119,3107,3108,73,1096,74,1100,3118,1099,1101,1098,1097,42,6,7,8,34,27,56,3113,50,6125,80,2104')
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Pagina], [IdSuscriptor], [Activo], [IdMenu], [Privilegios]) VALUES (2, N'Administrador de Contenido', N'~/Paginas/AdministrarUsuarioV40.aspx', 1, 1, 14, N'75,33,1095,52,2096,2098,3107,3108,73,74,1100,3118,1101,6051,1098,1097,50,2104')
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Pagina], [IdSuscriptor], [Activo], [IdMenu], [Privilegios]) VALUES (3, N'Ejecutivo Financiero', N'~/Paginas/MenuPrincipal.aspx', 1, 1, 5026, N'75,33,1095,6118,3119,73,74,1100,3118,1099,1101,1098,1097')
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Pagina], [IdSuscriptor], [Activo], [IdMenu], [Privilegios]) VALUES (4, N'Socio', N'~/Paginas/MenuPrincipal.aspx', 1, 1, 5026, N'')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
/****** Object:  Index [PK_Perfil]    Script Date: 01/02/2022 12:17:08 a. m. ******/
ALTER TABLE [dbo].[Perfil] ADD  CONSTRAINT [PK_Perfil] PRIMARY KEY NONCLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
