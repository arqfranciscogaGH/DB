
/****** Object:  Table [dbo].[Sistema]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Sistema]
GO
/****** Object:  Table [dbo].[Sistema]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sistema](
	[IdSistema] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
	[IdAutorCreacion] [int] NULL,
	[FechaActualizacion] [datetime] NULL,
	[IdAutorActualizacion] [int] NULL,
	[IdSuscripcion] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Sistema] PRIMARY KEY CLUSTERED 
(
	[IdSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Sistema] ON 

INSERT [dbo].[Sistema] ([IdSistema], [Nombre], [Descripcion], [FechaCreacion], [IdAutorCreacion], [FechaActualizacion], [IdAutorActualizacion], [IdSuscripcion], [Activo]) VALUES (1, N'MAPS EC', N'MAPS EC', CAST(0x0000A62D0182CD3F AS DateTime), 0, CAST(0x0000A62D0182CD3F AS DateTime), 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Sistema] OFF
