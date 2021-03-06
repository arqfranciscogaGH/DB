
/****** Object:  Table [dbo].[ErrorPersonalizado]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[ErrorPersonalizado]
GO
/****** Object:  Table [dbo].[ErrorPersonalizado]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorPersonalizado](
	[IdError] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [nvarchar](10) NULL,
	[Severidad] [nvarchar](10) NULL,
	[Mensaje] [nvarchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
	[IdIdioma] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[IdError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ErrorPersonalizado] ON 

INSERT [dbo].[ErrorPersonalizado] ([IdError], [Clave], [Severidad], [Mensaje], [FechaCreacion], [IdIdioma], [Activo]) VALUES (1, N'INC', N'Baja', N'Se presento una incidencia, fué registrada  y sera notificado al área de  soporte, intente  nuevamente por favor', CAST(0x0000AA4E01612D74 AS DateTime), 1, 1)
INSERT [dbo].[ErrorPersonalizado] ([IdError], [Clave], [Severidad], [Mensaje], [FechaCreacion], [IdIdioma], [Activo]) VALUES (2, N'INC', N'Baja', N'An incident was filed, it was registered and you will be notified to the support area, try again please', CAST(0x0000AA4E01669FAA AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[ErrorPersonalizado] OFF
