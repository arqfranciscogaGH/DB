

/****** Object:  Table [dbo].[Area]    Script Date: 07/04/2022 09:17:58 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP  TABLE [dbo].[ImagenCarrusel]
GO
CREATE TABLE [dbo].[ImagenCarrusel](
	[idImagen] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NULL,
	[titulo] [nvarchar] (max) NULL,
	[mensaje] [nvarchar] (max) NULL,
	[ruta] [nvarchar] (max) NULL,
	[idSuscriptor] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_ImagenCarrusel] PRIMARY KEY CLUSTERED 
(
	[idImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




