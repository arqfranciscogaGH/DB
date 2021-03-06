
ALTER TABLE [dbo].[Area] DROP CONSTRAINT [FK_Area_CentroCosto]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Area]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[IdCentroCosto] [int] NULL,
	[IdAreaSuperior] [int] NOT NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (5, N'General', N'General', 6, 5, 1, 1)
INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (8, N'Tecnología ', N'Tecnología ', NULL, 0, 1, 1)
INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (12, N'Contabilidad', N'Contabilidad', 6, 5, 1, 1)
INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (13, N'Operaciones', N'Operaciones', 6, 5, 1, 1)
INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (1007, N'aaa', N'aaaa', 6, 5, 1, 0)
INSERT [dbo].[Area] ([IdArea], [Nombre], [Descripcion], [IdCentroCosto], [IdAreaSuperior], [IdSuscriptor], [Activo]) VALUES (2009, N'Ventas', N'Ventas', 6, 5, 6, 1)
SET IDENTITY_INSERT [dbo].[Area] OFF
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_CentroCosto] FOREIGN KEY([IdCentroCosto])
REFERENCES [dbo].[CentroCosto] ([IdCentroCosto])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_CentroCosto]
GO
