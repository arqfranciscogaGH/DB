
/****** Object:  Table [dbo].[ModuloSistema]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[ModuloSistema]
GO
/****** Object:  Table [dbo].[ModuloSistema]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuloSistema](
	[IdModuloSistema] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Activo] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ModuloSistema] ON 

INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1, N'Sitio', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (2, N'Nucleo', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (3, N'Seguridad', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (4, N'Configuración', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1001, N'Flujo de  trabajo', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1002, N'Operaciones', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1003, N'Captura   Información', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1004, N'Evaluación', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1005, N'Otros', 1)
INSERT [dbo].[ModuloSistema] ([IdModuloSistema], [Nombre], [Activo]) VALUES (1006, N'Estructura', 1)
SET IDENTITY_INSERT [dbo].[ModuloSistema] OFF
