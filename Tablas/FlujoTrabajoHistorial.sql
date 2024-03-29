
/****** Object:  Table [dbo].[FlujoTrabajoHistorial]    Script Date: 03/03/2022 11:24:32 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FlujoTrabajoHistorial]') AND type in (N'U'))
DROP TABLE [dbo].[FlujoTrabajoHistorial]
GO
/****** Object:  Table [dbo].[FlujoTrabajoHistorial]    Script Date: 03/03/2022 11:24:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlujoTrabajoHistorial](
	[IdHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdTarea] [int] NULL,
	[IdActividad] [int] NULL,
	[IdEstatus] [int] NULL,
	[IdInstancia] [int] NULL,
	[FechaRegistro] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTernimacion] [smalldatetime] NULL,
	[Identificador] [nvarchar](150) NULL,
	[Referencia] [nvarchar](150) NULL,
	[Observacion] [nvarchar](max) NULL,
	[IdUsuario] [int] NULL,
	[IdSuscriptor] [int] NULL,
	[IdPerfil] [nvarchar](100) NULL,
	[IdEquipo] [nvarchar](100) NULL,
	[Resultado] [nvarchar](max) NULL,
	[TiempoActividad] [int] NULL,
	[IdEstatusTarea] [nvarchar](20) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoHistorial] PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FlujoTrabajoHistorial] ON 
INSERT [dbo].[FlujoTrabajoHistorial] ([IdHistorial], [IdFlujoTrabajo], [IdTarea], [IdActividad], [IdEstatus], [IdInstancia], [FechaRegistro], [FechaInicio], [FechaTernimacion], [Identificador], [Referencia], [Observacion], [IdUsuario], [IdPerfil], [IdEquipo], [Resultado], [TiempoActividad], [IdEstatusTarea], [Activo]) VALUES (2033, 10, 1, 1, NULL, 87, CAST(N'2022-01-13T21:50:00' AS SmallDateTime), CAST(N'2022-01-13T21:50:00' AS SmallDateTime), NULL, N'3', N'1', N'', N'', N'', N'', N'', 0, N'1', 1)
SET IDENTITY_INSERT [dbo].[FlujoTrabajoHistorial] OFF
GO
