
/****** Object:  Table [dbo].[ModuloSistema]    Script Date: 08/01/2022 09:23:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
DROP TABLE ModuloSistema
GO
CREATE TABLE [dbo].[ModuloSistema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [varchar](30) NULL,
	[llave] [nvarchar](max) NULL,
	[nombre] [varchar](100) NULL,
    [fechaEstatus] [datetime] NULL,
    [estatus] [smallint] NULL,
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ModuloSistema] ON 

INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1, N'Sitio', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (2, N'Nucleo', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (3, N'Seguridad', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (4, N'Configuración', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1001, N'Flujo de  trabajo', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1002, N'Operaciones', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1003, N'Captura   Información', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1004, N'Evaluación', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1005, N'Otros', 1)
INSERT [dbo].[ModuloSistema] ([id], [Nombre], [Estatus]) VALUES (1006, N'Estructura', 1)
SET IDENTITY_INSERT [dbo].[ModuloSistema] OFF
