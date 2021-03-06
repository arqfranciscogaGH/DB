
/****** Object:  Table [dbo].[NivelRed]    Script Date: 27/01/2022 01:07:48 a. m. ******/
DROP TABLE [dbo].[NivelRed]
GO
/****** Object:  Table [dbo].[NivelRed]    Script Date: 27/01/2022 01:07:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[NivelRed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[comision] [float] NULL,
	[orden] [int] NULL,
	[socios] [int] NULL,
	[operaciones] [int] NULL,
	[importes] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_NivelRed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NivelRed] ON 

INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus]) VALUES (1, N'', N'B', N'Bronze', 10, 1, 2, 1,25000, N'', 1)
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes],[fechaEstatus], [estatus]) VALUES (2, N'', N'S', N'Silver', 20, 2, 2, 1,25000, N'', 1)
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes],[fechaEstatus], [estatus]) VALUES (3, N'', N'G', N'Gold', 30, 3, 2, 1,25000, N'', 1)
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus]) VALUES (4, N'', N'PG', N'Pure Gold', 35, 4, 2, 1,25000, N'', 1)
SET IDENTITY_INSERT [dbo].[NivelRed] OFF


SELECT *FROM  NivelRed