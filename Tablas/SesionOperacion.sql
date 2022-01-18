USE [db_a72b95_drpk]
GO

/****** Object:  Table [dbo].[Configuracion]    Script Date: 13/01/2022 12:59:47 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[SesionOperacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[idAplicacion] [int] NOT NULL,
	[accion] [varchar](max) NULL,
	[idUsuario] [int] NOT NULL,
	[idSucrsal] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
	[idSupervisorTurno] [int] NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fechaRegistro] [varchar](10) NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_SesionOperacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


