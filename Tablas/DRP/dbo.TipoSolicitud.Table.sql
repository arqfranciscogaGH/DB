
/****** Object:  Table [dbo].[TipoSolicitud]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[TipoSolicitud]
GO
/****** Object:  Table [dbo].[TipoSolicitud]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSolicitud](
	[IdTipoSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoSolicitud] PRIMARY KEY CLUSTERED 
(
	[IdTipoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
