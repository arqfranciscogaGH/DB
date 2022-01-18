USE [db_a72b95_drpk]
GO

/****** Object:  Table [dbo].[Configuracion]    Script Date: 13/01/2022 12:59:47 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF

DROP TABLE [dbo].[Prospecto]

GO

CREATE TABLE [dbo].[Prospecto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[idAplicacion] [int] NOT NULL,
	idSesionOperacion  [int] NOT NULL,

	[idUsuario] [int] NOT NULL,
	[idSucrsal] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
	[idSupervisorTurno] [int] NOT NULL,

	[nombre] [varchar](max) NULL,
	[aPaterno] [varchar](max) NULL,
	[aMaterno] [varchar](max) NULL,
	[noSeguridad] [varchar](max) NULL,
	[curp] [varchar](max) NULL,
	[genero] [varchar](1) NULL,
	[capacidadPago] [varchar](max) NULL,
	[numeroMovil] [varchar](max) NULL,
	[correo] [varchar](max) NULL,

	[interesado] [varchar](1) NULL,
	[serviciosInteres] [varchar](max) NULL,

	[fechaRegistro] [varchar](10) NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Prospecto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


