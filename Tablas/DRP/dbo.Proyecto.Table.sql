

Sistema
Proyecto

ALTER TABLE [dbo].[Proyecto] DROP CONSTRAINT [FK_Proyecto_Sistema]
GO
ALTER TABLE [dbo].[Proyecto] DROP CONSTRAINT [FK_Proyecto_CuentaUsuario]
GO
ALTER TABLE [dbo].[Proyecto] DROP CONSTRAINT [FK_Proyecto_CentroCosto]
GO
ALTER TABLE [dbo].[Proyecto] DROP CONSTRAINT [FK_Proyecto_Area]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Proyecto]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaSolictud] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTerminacion] [smalldatetime] NULL,
	[IdSistema] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdSolictante] [int] NOT NULL,
	[IdCentroCosto] [int] NOT NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([IdArea])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Area]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_CentroCosto] FOREIGN KEY([IdCentroCosto])
REFERENCES [dbo].[CentroCosto] ([IdCentroCosto])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_CentroCosto]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_CuentaUsuario] FOREIGN KEY([IdSolictante])
REFERENCES [dbo].[CuentaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_CuentaUsuario]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Sistema] FOREIGN KEY([IdSistema])
REFERENCES [dbo].[Sistema] ([IdSistema])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Sistema]
GO
