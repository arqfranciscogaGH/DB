
GO
/****** Object:  Index [PK_SesionUsuarioHistorial]    Script Date: 27/01/2022 01:19:19 a. m. ******/
ALTER TABLE [dbo].[SesionUsuarioHistorial] DROP CONSTRAINT [PK_SesionUsuarioHistorial]
GO
/****** Object:  Table [dbo].[SesionUsuarioHistorial]    Script Date: 27/01/2022 01:19:19 a. m. ******/
DROP TABLE [dbo].[SesionUsuarioHistorial]
GO
/****** Object:  Table [dbo].[SesionUsuarioHistorial]    Script Date: 27/01/2022 01:19:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SesionUsuarioHistorial](
	[IdSesionHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdSesion] [int] NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[LlaveSesion] [varchar](80) NULL,
	[CuentaUsuario] [varchar](100) NULL,
	[IdUsuario] [int] NULL,
	[AgenteSesion] [varchar](250) NULL,
	[Dispositivo] [varchar](60) NULL,
	[Equipo] [varchar](60) NULL,
	[IdSuscriptor] [int] NULL,
	[ClaveAplicacion] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SesionUsuarioHistorial] ON 

SET IDENTITY_INSERT [dbo].[SesionUsuarioHistorial] OFF
/****** Object:  Index [PK_SesionUsuarioHistorial]    Script Date: 27/01/2022 01:19:21 a. m. ******/
ALTER TABLE [dbo].[SesionUsuarioHistorial] ADD  CONSTRAINT [PK_SesionUsuarioHistorial] PRIMARY KEY NONCLUSTERED 
(
	[IdSesionHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
