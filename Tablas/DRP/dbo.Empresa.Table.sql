
/****** Object:  Table [dbo].[Empresa]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Empresa]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([IdEmpresa], [Id], [Nombre], [Descripcion], [IdSuscriptor], [Activo]) VALUES (1, N'001', N'STI', N'STI', 1, 1)
INSERT [dbo].[Empresa] ([IdEmpresa], [Id], [Nombre], [Descripcion], [IdSuscriptor], [Activo]) VALUES (2, N'002', N'mapdata', N'mapdata', 1, 1)
SET IDENTITY_INSERT [dbo].[Empresa] OFF
