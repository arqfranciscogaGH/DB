



/****** Object:  Table [dbo].[Pais]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Pais]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (1, N'Mexico')
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (2, N'Cuba')
