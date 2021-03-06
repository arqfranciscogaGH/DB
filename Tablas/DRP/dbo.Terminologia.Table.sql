
/****** Object:  Table [dbo].[Terminologia]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Terminologia]
GO
/****** Object:  Table [dbo].[Terminologia]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Terminologia](
	[IdTerminologia] [int] IDENTITY(1,1) NOT NULL,
	[IdAplicacion] [int] NULL,
	[Clave] [varchar](50) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Terminologia] PRIMARY KEY CLUSTERED 
(
	[IdTerminologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Terminologia] ON 

INSERT [dbo].[Terminologia] ([IdTerminologia], [IdAplicacion], [Clave], [Nombre], [Activo]) VALUES (1, 1, N'1', N'Mensaje completo', 1)
INSERT [dbo].[Terminologia] ([IdTerminologia], [IdAplicacion], [Clave], [Nombre], [Activo]) VALUES (2, 2, N'2', N'Permiso', 1)
INSERT [dbo].[Terminologia] ([IdTerminologia], [IdAplicacion], [Clave], [Nombre], [Activo]) VALUES (3, 1, N'3', N'Elemento seleccionado ', 1)
SET IDENTITY_INSERT [dbo].[Terminologia] OFF
