
/****** Object:  Table [dbo].[ClasificacionCaptura]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[ClasificacionCaptura]
GO
/****** Object:  Table [dbo].[ClasificacionCaptura]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClasificacionCaptura](
	[IdClasificacionCaptura] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](150) NULL,
	[Titulo] [nvarchar](250) NULL,
	[IdTipoCaptura] [int] NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL,
	[Argumentos] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClasificacionDcoumental] PRIMARY KEY CLUSTERED 
(
	[IdClasificacionCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ClasificacionCaptura] ON 

INSERT [dbo].[ClasificacionCaptura] ([IdClasificacionCaptura], [Id], [Titulo], [IdTipoCaptura], [IdSuscriptor], [Activo], [Argumentos]) VALUES (1, N'1', N'uno', 1, 1, 1, NULL)
INSERT [dbo].[ClasificacionCaptura] ([IdClasificacionCaptura], [Id], [Titulo], [IdTipoCaptura], [IdSuscriptor], [Activo], [Argumentos]) VALUES (2, N'2', N'dos', 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[ClasificacionCaptura] OFF
