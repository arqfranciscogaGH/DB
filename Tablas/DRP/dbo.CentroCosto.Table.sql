
ALTER TABLE [dbo].[CentroCosto] DROP CONSTRAINT [FK_CentroCosto_UnidadNegocio]
GO
/****** Object:  Table [dbo].[CentroCosto]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[CentroCosto]
GO
/****** Object:  Table [dbo].[CentroCosto]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentroCosto](
	[IdCentroCosto] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [nvarchar](10) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Presupuesto] [decimal](12, 2) NULL,
	[Gasto] [decimal](12, 2) NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTerminacion] [smalldatetime] NULL,
	[IdUnidadNegocio] [int] NOT NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_CentroCostro] PRIMARY KEY CLUSTERED 
(
	[IdCentroCosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CentroCosto] ON 

INSERT [dbo].[CentroCosto] ([IdCentroCosto], [Clave], [Nombre], [Descripcion], [Presupuesto], [Gasto], [FechaInicio], [FechaTerminacion], [IdUnidadNegocio], [IdSuscriptor], [Activo]) VALUES (6, N'001', N'General', N'General', CAST(100000.00 AS Decimal(12, 2)), CAST(1000.00 AS Decimal(12, 2)), NULL, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[CentroCosto] OFF
ALTER TABLE [dbo].[CentroCosto]  WITH CHECK ADD  CONSTRAINT [FK_CentroCosto_UnidadNegocio] FOREIGN KEY([IdUnidadNegocio])
REFERENCES [dbo].[UnidadNegocio] ([IdUnidadNegocio])
GO
ALTER TABLE [dbo].[CentroCosto] CHECK CONSTRAINT [FK_CentroCosto_UnidadNegocio]
GO
