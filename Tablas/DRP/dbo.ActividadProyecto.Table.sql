


ALTER TABLE [dbo].[ActividadProyecto] DROP CONSTRAINT [FK_ActividadProyecto_TipoActividad]
GO
ALTER TABLE [dbo].[ActividadProyecto] DROP CONSTRAINT [FK_ActividadProyecto_Solicitud]
GO
ALTER TABLE [dbo].[ActividadProyecto] DROP CONSTRAINT [FK_ActividadProyecto_EstatusSolictud]
GO
ALTER TABLE [dbo].[ActividadProyecto] DROP CONSTRAINT [FK_ActividadProyecto_CuentaUsuario_solicitante]
GO
ALTER TABLE [dbo].[ActividadProyecto] DROP CONSTRAINT [FK_ActividadProyecto_CuentaUsuario]
GO
/****** Object:  Table [dbo].[ActividadProyecto]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[ActividadProyecto]
GO
/****** Object:  Table [dbo].[ActividadProyecto]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadProyecto](
	[IdActividadProyecto] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaSolictud] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTerminacion] [smalldatetime] NULL,
	[Planeado] [decimal](10, 2) NULL,
	[Aplicado] [decimal](10, 2) NULL,
	[IdTipoActividad] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[IdSolicitud] [int] NULL,
	[IdSolictante] [int] NOT NULL,
	[IdEstatusSolictud] [int] NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_ActividadProyecto] PRIMARY KEY CLUSTERED 
(
	[IdActividadProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[ActividadProyecto]  WITH CHECK ADD  CONSTRAINT [FK_ActividadProyecto_CuentaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[CuentaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ActividadProyecto] CHECK CONSTRAINT [FK_ActividadProyecto_CuentaUsuario]
GO
ALTER TABLE [dbo].[ActividadProyecto]  WITH CHECK ADD  CONSTRAINT [FK_ActividadProyecto_CuentaUsuario_solicitante] FOREIGN KEY([IdSolictante])
REFERENCES [dbo].[CuentaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ActividadProyecto] CHECK CONSTRAINT [FK_ActividadProyecto_CuentaUsuario_solicitante]
GO
ALTER TABLE [dbo].[ActividadProyecto]  WITH CHECK ADD  CONSTRAINT [FK_ActividadProyecto_EstatusSolictud] FOREIGN KEY([IdEstatusSolictud])
REFERENCES [dbo].[EstatusSolictud] ([IdEstatusSolictud])
GO
ALTER TABLE [dbo].[ActividadProyecto] CHECK CONSTRAINT [FK_ActividadProyecto_EstatusSolictud]
GO
ALTER TABLE [dbo].[ActividadProyecto]  WITH CHECK ADD  CONSTRAINT [FK_ActividadProyecto_Solicitud] FOREIGN KEY([IdSolicitud])
REFERENCES [dbo].[Solicitud] ([IdSolicitud])
GO
ALTER TABLE [dbo].[ActividadProyecto] CHECK CONSTRAINT [FK_ActividadProyecto_Solicitud]
GO
ALTER TABLE [dbo].[ActividadProyecto]  WITH CHECK ADD  CONSTRAINT [FK_ActividadProyecto_TipoActividad] FOREIGN KEY([IdTipoActividad])
REFERENCES [dbo].[TipoActividad] ([IdTipoActividad])
GO
ALTER TABLE [dbo].[ActividadProyecto] CHECK CONSTRAINT [FK_ActividadProyecto_TipoActividad]
GO
