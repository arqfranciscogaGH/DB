
/****** Object:  Table [dbo].[Pregunta]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Pregunta]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Pregunta](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdContenedor] [int] NULL,
	[IdPropiedadControl] [int] NULL,
	[Clave] [varchar](max) NULL,
	[Descripcion] [varchar](max) NULL,
	[Orden] [int] NULL,
	[Icono] [varchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
