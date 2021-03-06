
/****** Object:  Table [dbo].[RespuestaPregunta]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[RespuestaPregunta]
GO
/****** Object:  Table [dbo].[RespuestaPregunta]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespuestaPregunta](
	[IdRespuestaPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCuestionario] [int] NULL,
	[IdPropiedadControl] [int] NULL,
	[Respuesta] [varchar](max) NULL,
	[Descripcion] [varchar](max) NULL,
	[Icono] [varchar](max) NULL,
	[Orden] [int] NULL,
	[Ponderacion] [decimal](6, 2) NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_RespuestaPregunta] PRIMARY KEY CLUSTERED 
(
	[IdRespuestaPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaPregunta] ON 

INSERT [dbo].[RespuestaPregunta] ([IdRespuestaPregunta], [IdCuestionario], [IdPropiedadControl], [Respuesta], [Descripcion], [Icono], [Orden], [Ponderacion], [FechaRegistro], [Activo]) VALUES (1, 12055, 16374, N'a)', N'a)  Uno', N' icon-acrobat', 1, CAST(1.00 AS Decimal(6, 2)), NULL, 1)
INSERT [dbo].[RespuestaPregunta] ([IdRespuestaPregunta], [IdCuestionario], [IdPropiedadControl], [Respuesta], [Descripcion], [Icono], [Orden], [Ponderacion], [FechaRegistro], [Activo]) VALUES (2, 12055, 16374, N'', N'b)  Dos', N' icon-address', 2, CAST(0.00 AS Decimal(6, 2)), NULL, 1)
INSERT [dbo].[RespuestaPregunta] ([IdRespuestaPregunta], [IdCuestionario], [IdPropiedadControl], [Respuesta], [Descripcion], [Icono], [Orden], [Ponderacion], [FechaRegistro], [Activo]) VALUES (3, 12055, 16374, N'', N'c)  Tres', N' icon-address-book', 3, CAST(0.00 AS Decimal(6, 2)), NULL, 1)
INSERT [dbo].[RespuestaPregunta] ([IdRespuestaPregunta], [IdCuestionario], [IdPropiedadControl], [Respuesta], [Descripcion], [Icono], [Orden], [Ponderacion], [FechaRegistro], [Activo]) VALUES (1002, 12055, 17376, N'FGA', N'Respuesta  Correcta', N'', 1, CAST(1.00 AS Decimal(6, 2)), NULL, 1)
SET IDENTITY_INSERT [dbo].[RespuestaPregunta] OFF
