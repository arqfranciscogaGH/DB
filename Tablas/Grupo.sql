USE [DRP]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 15/01/2022 09:58:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	---[Clave] [varchar](60) NULL,
	[Privilegios] [nvarchar](max) NULL,
	[IdSuscriptor] [int] NULL,
    ---[FechaEstatus] smalldatetime ,
	---[Estatus] smalldatetime ,
	[Activo] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Index [PK_GrupoUsuario]    Script Date: 15/01/2022 09:58:17 a. m. ******/
ALTER TABLE [dbo].[Grupo] ADD  CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY NONCLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


DELETE FROM  Grupo
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (1, N'Administradores de  sistema', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (2, N'Giorgio', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (3, N'B&D', 1, 2,  N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (4, N'Cuauh', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (5, N'Soccer', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (6, N'Jc&Mar', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (7, N'Redes', 1, 2, N'')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [Activo], [IdSuscriptor], [Privilegios]) VALUES (8, N'L&R', 1, 2, N'')

SET IDENTITY_INSERT [dbo].[Grupo] OFF

SELECT * FROM  Grupo