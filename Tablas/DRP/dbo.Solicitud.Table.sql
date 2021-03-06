
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_TipoSolicitud]
GO
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_Proyecto]
GO
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_Area]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Solicitud]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaSolictud] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTerminacion] [smalldatetime] NULL,
	[IdTipoSolicitud] [int] NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdSolictante] [int] NOT NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([IdArea])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Area]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Proyecto]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_TipoSolicitud] FOREIGN KEY([IdTipoSolicitud])
REFERENCES [dbo].[TipoSolicitud] ([IdTipoSolicitud])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_TipoSolicitud]
GO
