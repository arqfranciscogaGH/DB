
GO
/****** Object:  Index [PK_SesionUsuario]    Script Date: 27/01/2022 01:19:19 a. m. ******/
ALTER TABLE [dbo].[SesionUsuario] DROP CONSTRAINT [PK_SesionUsuario]
GO
/****** Object:  Table [dbo].[SesionUsuario]    Script Date: 27/01/2022 01:19:19 a. m. ******/
DROP TABLE [dbo].[SesionUsuario]
GO
/****** Object:  Table [dbo].[SesionUsuario]    Script Date: 27/01/2022 01:19:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SesionUsuario](
	[IdSesion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[LlaveSesion] [varchar](80) NULL,
	[CuentaUsuario] [varchar](100) NULL,
	[Tema] [varchar](30) NULL,
	[AgenteSesion] [varchar](250) NULL,
	[Dispositivo] [varchar](60) NULL,
	[Equipo] [varchar](60) NULL,
	[IdEstatusRegistro] [tinyint] NULL,
	[IdSuscriptor] [int] NULL,
	[IdIdioma] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SesionUsuario] ON 

SET IDENTITY_INSERT [dbo].[SesionUsuario] OFF
/****** Object:  Index [PK_SesionUsuario]    Script Date: 27/01/2022 01:19:21 a. m. ******/
ALTER TABLE [dbo].[SesionUsuario] ADD  CONSTRAINT [PK_SesionUsuario] PRIMARY KEY NONCLUSTERED 
(
	[IdSesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
