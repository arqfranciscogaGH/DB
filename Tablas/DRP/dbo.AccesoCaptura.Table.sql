
/****** Object:  Table [dbo].[AccesoCaptura]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[AccesoCaptura]
GO
/****** Object:  Table [dbo].[AccesoCaptura]    Script Date: 27/01/2022 01:40:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccesoCaptura](
	[IdAccesoCaptura] [int] IDENTITY(1,1) NOT NULL,
	[IdDefinicionCaptura] [int] NULL,
	[Tipo] [varchar](30) NULL,
	[Acceso] [varchar](150) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_AccesoCaptura] PRIMARY KEY CLUSTERED 
(
	[IdAccesoCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccesoCaptura] ON 

INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (1, 7065, N'IdUsuario', N'1', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (2, 7065, N'IdPerfil', N'3', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (3, 7065, N'IdArea', N'2', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (4, 12, N'IdGrupo', N'2', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (5, 12, N'IdPerfil', N'1', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (6, 12, N'IdPuesto', N'1', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (7, 10, N'IdOtro', N'5080', 1)
INSERT [dbo].[AccesoCaptura] ([IdAccesoCaptura], [IdDefinicionCaptura], [Tipo], [Acceso], [Activo]) VALUES (8, 10, N'IdClasificacion', N'1', 1)
SET IDENTITY_INSERT [dbo].[AccesoCaptura] OFF
