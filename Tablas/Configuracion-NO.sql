USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 08/01/2022 09:35:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
DROP TABLE Configuracion
GO
GO
CREATE TABLE [dbo].[Configuracion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[valor] [nvarchar](max) NULL,
	[tipo] [varchar](20) NULL,
	[idAplicacion] [int] NOT NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Configuracion] ON 

INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (1, N'', N'comision_Infonvit', N'% Comisión Infonavit', N'% Comisión Infonavit', N'3', N'double', 1, N'', 1)
INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (2, N'', N'comision_administradora', N'Comisión Administradora ', N'% Comisión Administradora', N'5.22', N'double', 1, N'', 1)
INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (3, N'', N'gastos_fiscales', N'Gastos Fiscales ', N'% Gastos Fiscales', N'5', N'double', 1, N'', 1)
INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (4, N'', N'Avaluo_verificaciones', N'Avalúo y Verificaciones ', N'Avalúo y Verificaciones', N'4176', N'double', 1, N'', 1)
INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (5, N'', N'comision_fianza', N'Comisión Fianza ', N'% Comisión Fianza', N'1', N'double', 1, N'', 1)
INSERT [dbo].[Configuracion] ([id], [llave], [clave], [nombre], [descripcion], [valor], [tipo], [idAplicacion], [fechaEstatus], [estatus]) VALUES (6, N'', N'comision_fidecomiso', N'Comisión Fidecomiso y Constructora ', N'% Comisión Fidecomiso y Constructora', N'18', N'double', 1, N'', 1)
SET IDENTITY_INSERT [dbo].[Configuracion] OFF
