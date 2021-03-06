
ALTER TABLE [dbo].[Configuracion] DROP CONSTRAINT [FK_Configuracion_Aplicacion]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Configuracion]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracion](
	[IdConfiguracion] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](100) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[Tipo] [varchar](20) NULL,
	[IdAplicacion] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[IdConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Configuracion] ON 

INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (8, N'Sesiones', N'Sesiones', N'50', N'int', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (9, N'Intentos', N'Intentos', N'50', N'int', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (4371, N'DireccionInicio', N'Direccion Inicio', N'Inicio.aspx', N'string', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (4372, N'DireccionMenuPrincipal', N'Direccion Menu Principal', N'MenuPrincipal.aspx', N'string', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (5368, N'DiasParaExpirar', N'Dias para Expirar cuenta', N'30', N'int', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (5369, N'DiasAntesExpirar', N'Dias amtes de Expirar cuenta', N'3', N'int', 1, 1)
INSERT [dbo].[Configuracion] ([IdConfiguracion], [Id], [Descripcion], [Valor], [Tipo], [IdAplicacion], [Activo]) VALUES (6368, N'FlujoTrabajo_TipoMedicion', N'Tipo de Medicion  en FlujoTrabajo ', N'M', N'string', 4045, 1)
SET IDENTITY_INSERT [dbo].[Configuracion] OFF
ALTER TABLE [dbo].[Configuracion]  WITH CHECK ADD  CONSTRAINT [FK_Configuracion_Aplicacion] FOREIGN KEY([IdAplicacion])
REFERENCES [dbo].[Aplicacion] ([IdAplicacion])
GO
ALTER TABLE [dbo].[Configuracion] CHECK CONSTRAINT [FK_Configuracion_Aplicacion]
GO
