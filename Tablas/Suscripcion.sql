USE [DRP]
GO
/****** Object:  Index [PK_Suscripcion]    Script Date: 15/01/2022 10:12:48 a. m. ******/
ALTER TABLE [dbo].[Suscripcion] DROP CONSTRAINT [PK_Suscripcion]
GO
/****** Object:  Table [dbo].[Suscripcion]    Script Date: 15/01/2022 10:12:48 a. m. ******/
DROP TABLE [dbo].[Suscripcion]
GO
/****** Object:  Table [dbo].[Suscripcion]    Script Date: 15/01/2022 10:12:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suscripcion](
	[IdSuscriptor] [int] IDENTITY(1,1) NOT NULL,
	[NombreCorto] [varchar](50) NULL,
	[Tipo] [varchar](3) NULL,
	[FechaContratacion] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaVencimiento] [smalldatetime] NULL,
	[Servicios] [varchar](250) NULL,
	[NumeroUsuarios] [smallint] NULL,
	[IdPersona] [int] NULL,
	[Activo] [bit] NULL,
	[IdSuscriptorSuperior] [int] NULL,
	[Descripcion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Index [PK_Suscripcion]    Script Date: 15/01/2022 10:12:48 a. m. ******/
ALTER TABLE [dbo].[Suscripcion] ADD  CONSTRAINT [PK_Suscripcion] PRIMARY KEY NONCLUSTERED 
(
	[IdSuscriptor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


DELETE FROM  Suscripcion

SET IDENTITY_INSERT [dbo].[Suscripcion] ON 

INSERT [dbo].[Suscripcion] ([IdSuscriptor], [NombreCorto], [Tipo], [FechaContratacion], [FechaInicio], [FechaVencimiento], [Servicios], [NumeroUsuarios], [IdPersona], [Activo], [IdSuscriptorSuperior], [Descripcion]) VALUES (1, N'STI', N'V', CAST(0xAA6B0000 AS SmallDateTime), CAST(0xAA6B0000 AS SmallDateTime), CAST(0xAAE50000 AS SmallDateTime), N'', 1000, NULL, 1, 1, NULL)
INSERT [dbo].[Suscripcion] ([IdSuscriptor], [NombreCorto], [Tipo], [FechaContratacion], [FechaInicio], [FechaVencimiento], [Servicios], [NumeroUsuarios], [IdPersona], [Activo], [IdSuscriptorSuperior], [Descripcion]) VALUES (2, N'Kungio Coprporativo', N'E', NULL, NULL, NULL, N'A,T', 100, NULL, 1, 1, NULL)
INSERT [dbo].[Suscripcion] ([IdSuscriptor], [NombreCorto], [Tipo], [FechaContratacion], [FechaInicio], [FechaVencimiento], [Servicios], [NumeroUsuarios], [IdPersona], [Activo], [IdSuscriptorSuperior], [Descripcion]) VALUES (3, N'Call Center Valle Dorado', N'M', NULL, NULL, NULL, N'ADP,FT,CH', 100, NULL, 1, 1, NULL)

SET IDENTITY_INSERT [dbo].[Suscripcion] OFF


SELECT * FROM   Suscripcion

