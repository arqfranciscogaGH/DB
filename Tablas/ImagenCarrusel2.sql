USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[ImagenCarrusel]    Script Date: 21/04/2022 11:30:09 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImagenCarrusel]') AND type in (N'U'))
DROP TABLE [dbo].[ImagenCarrusel]
GO
/****** Object:  Table [dbo].[ImagenCarrusel]    Script Date: 21/04/2022 11:30:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenCarrusel](
	[idImagen] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NULL,
	[titulo] [nvarchar](max) NULL,
	[mensaje] [nvarchar](max) NULL,
	[ruta] [nvarchar](max) NULL,
	[idSuscriptor] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_ImagenCarrusel] PRIMARY KEY CLUSTERED 
(
	[idImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ImagenCarrusel] ON 

INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (1, N'1_c.jpg', N'BIENVENIDO !! NOSOTROS  TE  ASESOREAMOS.', N'Estás a un clic de poder iniciar la remodelación de tu casa.', N'C:\r\Net\DRPKungio\Codigo\Sitio\Carrusel\1_c.jpg', 1, 1)
INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (2, N'2_c.jpg', N'BIENVENIDO !! NOSOTROS  TE  ASESOREAMOS.', N'Estás a un clic de poder iniciar la remodelación de tu casa.', N'C:\r\Net\DRPKungio\Codigo\Sitio\Carrusel\2_c.jpg', 1, 1)
INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (3, N'3_c.jpg', N'BIENVENIDO !! NOSOTROS  TE  ASESOREAMOS.', N'Estás a un clic de poder iniciar la remodelación de tu casa.', N'C:\r\Net\DRPKungio\Codigo\Sitio\Carrusel\3_c.jpg', 1, 1)
INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (4, N'4_kungio incio.jpg', N'Bienvenido a la mejor empresa  de servicio', N'Comunicate con nosotro  para  asesorte ', N'h:\root\home\arqfranciscoga-002\www\kungio\Carrusel\4_kungio incio.jpg', 1, 1)
INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (5, N'', N'', N'', N'', 1, 1)
INSERT [dbo].[ImagenCarrusel] ([idImagen], [nombre], [titulo], [mensaje], [ruta], [idSuscriptor], [activo]) VALUES (6, N'6_me pensiono.jpg', N'', N'', N'h:\root\home\arqfranciscoga-002\www\kungio\Carrusel\6_me pensiono.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[ImagenCarrusel] OFF
GO
