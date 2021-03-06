USE [DRP]
GO
/****** Object:  Table [dbo].[EventoCaptura]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[EventoCaptura]
GO
/****** Object:  Table [dbo].[EventoCaptura]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoCaptura](
	[IdEventoCaptura] [int] IDENTITY(1,1) NOT NULL,
	[IdPlaneacionCaptura] [int] NOT NULL,
	[Evento] [nvarchar](250) NULL,
	[IdUsuario] [int] NULL,
	[IdPuesto] [int] NULL,
	[IdPerfil] [int] NULL,
	[IdArea] [int] NULL,
	[Publico] [bit] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_EventoCaptura] PRIMARY KEY CLUSTERED 
(
	[IdEventoCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[EventoCaptura] ON 

INSERT [dbo].[EventoCaptura] ([IdEventoCaptura], [IdPlaneacionCaptura], [Evento], [IdUsuario], [IdPuesto], [IdPerfil], [IdArea], [Publico], [Activo]) VALUES (1, 1, N'Encuesta  Clima 2016', NULL, NULL, 1, NULL, 0, 1)
INSERT [dbo].[EventoCaptura] ([IdEventoCaptura], [IdPlaneacionCaptura], [Evento], [IdUsuario], [IdPuesto], [IdPerfil], [IdArea], [Publico], [Activo]) VALUES (2, 1, N'Encuesta  Clima  2017', NULL, NULL, 2, NULL, 0, 1)
INSERT [dbo].[EventoCaptura] ([IdEventoCaptura], [IdPlaneacionCaptura], [Evento], [IdUsuario], [IdPuesto], [IdPerfil], [IdArea], [Publico], [Activo]) VALUES (3, 2, N'Votacion 2018', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[EventoCaptura] ([IdEventoCaptura], [IdPlaneacionCaptura], [Evento], [IdUsuario], [IdPuesto], [IdPerfil], [IdArea], [Publico], [Activo]) VALUES (4, 3, N'Evaluacón  Candidato Gerente 2017', 1, 2, NULL, NULL, 0, 1)
INSERT [dbo].[EventoCaptura] ([IdEventoCaptura], [IdPlaneacionCaptura], [Evento], [IdUsuario], [IdPuesto], [IdPerfil], [IdArea], [Publico], [Activo]) VALUES (5, 4, N'Evaluacón  Objetivos  2017', NULL, NULL, NULL, 5, 0, 1)
SET IDENTITY_INSERT [dbo].[EventoCaptura] OFF
