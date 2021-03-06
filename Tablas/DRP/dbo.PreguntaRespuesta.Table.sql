


/****** Object:  Table [dbo].[PreguntaRespuesta]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[PreguntaRespuesta]
GO
/****** Object:  Table [dbo].[PreguntaRespuesta]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PreguntaRespuesta](
	[IdPreguntaRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdCuestionario] [int] NULL,
	[IdPropiedadControl] [int] NULL,
	[Respuesta] [varchar](max) NULL,
	[Descripcion] [varchar](max) NULL,
	[Orden] [int] NULL,
	[Ponderacion] [decimal](6, 2) NULL,
	[FechaRegistro] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_PreguntaRespuesta] PRIMARY KEY CLUSTERED 
(
	[IdPreguntaRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
