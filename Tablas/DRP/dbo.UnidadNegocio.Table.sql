
/****** Object:  Table [dbo].[UnidadNegocio]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[UnidadNegocio]
GO
/****** Object:  Table [dbo].[UnidadNegocio]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadNegocio](
	[IdUnidadNegocio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[IdSuscriptor] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_UnidadNegocio] PRIMARY KEY CLUSTERED 
(
	[IdUnidadNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[UnidadNegocio] ON 

INSERT [dbo].[UnidadNegocio] ([IdUnidadNegocio], [Nombre], [Descripcion], [IdSuscriptor], [Activo]) VALUES (1, N'Tecnología', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[UnidadNegocio] OFF
