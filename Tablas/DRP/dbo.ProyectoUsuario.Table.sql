





ALTER TABLE [dbo].[ProyectoUsuario] DROP CONSTRAINT [FK_ProyectoUsuario_Proyecto]
GO
ALTER TABLE [dbo].[ProyectoUsuario] DROP CONSTRAINT [FK_ProyectoUsuario_CuentaUsuario]
GO
/****** Object:  Index [PK_ProyectoUsuario]    Script Date: 27/01/2022 01:40:26 a. m. ******/
ALTER TABLE [dbo].[ProyectoUsuario] DROP CONSTRAINT [PK_ProyectoUsuario]
GO
/****** Object:  Table [dbo].[ProyectoUsuario]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[ProyectoUsuario]
GO
/****** Object:  Table [dbo].[ProyectoUsuario]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProyectoUsuario](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Costo] [decimal](12, 2) NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [PK_ProyectoUsuario]    Script Date: 27/01/2022 01:40:28 a. m. ******/
ALTER TABLE [dbo].[ProyectoUsuario] ADD  CONSTRAINT [PK_ProyectoUsuario] PRIMARY KEY NONCLUSTERED 
(
	[IdProyecto] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProyectoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProyectoUsuario_CuentaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[CuentaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProyectoUsuario] CHECK CONSTRAINT [FK_ProyectoUsuario_CuentaUsuario]
GO
ALTER TABLE [dbo].[ProyectoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProyectoUsuario_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[ProyectoUsuario] CHECK CONSTRAINT [FK_ProyectoUsuario_Proyecto]
GO
