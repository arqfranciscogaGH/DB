
/****** Object:  Index [PK_GrupoUsuario]    Script Date: 27/01/2022 01:40:26 a. m. ******/
ALTER TABLE [dbo].[Grupo] DROP CONSTRAINT [PK_GrupoUsuario]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Grupo]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[IdSuscriptor] [int] NULL,
	[Privilegios] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (1, N'Administradores de  sistema', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (2, N'Giorgio', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (3, N'B&D', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (4, N'Cuauh', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (5, N'Soccer', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (6, N'Jc&Mar', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (7, N'Redes', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (8, N'L&R', 1, 2, N'')
SET IDENTITY_INSERT [dbo].[Grupo] OFF
/****** Object:  Index [PK_GrupoUsuario]    Script Date: 27/01/2022 01:40:28 a. m. ******/
ALTER TABLE [dbo].[Grupo] ADD  CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY NONCLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
