USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[NivelRed]    Script Date: 18/05/2022 08:50:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NivelRed]') AND type in (N'U'))
DROP TABLE [dbo].[NivelRed]
GO
/****** Object:  Table [dbo].[NivelRed]    Script Date: 18/05/2022 08:50:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[color] [varchar](20) NULL,
 CONSTRAINT [PK_NivelRed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[NivelRed] ON 

INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (1, N'', N'B', N'Bronze', 12.6, 12, 2, 0, 10000, N'', 1, N'B')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (2, N'', N'B+', N'Bronze', 16.2, 11, 2, 1, 10000, N'', 1, N'B+')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (3, N'', N'S', N'Silver', 18, 10, 2, 1, 25000, N'', 1, N'S')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (4, N'', N'S+', N'S+', 21.6, 9, 2, 1, 25000, N'', 1, N'S+')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (5, N'', N'G', N'Gold', 23.4, 8, 2, 1, 10000, N'', 1, N'G')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (6, N'', N'G+', N'Gold+', 27, 7, 2, 1, 10000, N'', 1, N'G+')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (7, N'', N'G++', N'Gold++', 30.6, 6, 2, 1, 10000, N'', 1, N'G++')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (8, N'', N'SA', N'Sapphire', 32.4, 5, 2, 1, 25000, N'', 1, N'SA')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (9, NULL, N'SA+', N'Sapphire+', 34.2, 4, 2, 1, 10000, N'', 1, N'SA+')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (10, NULL, N'P', N'Platinum', 36, 3, 2, 1, 10000, N'', 1, N'P')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (11, NULL, N'D', N'Diamond', 37.8, 2, 2, 1, 10000, N'', 1, N'D')
INSERT [dbo].[NivelRed] ([id], [llave], [clave], [nombre], [comision], [orden], [socios], [operaciones], [importes], [fechaEstatus], [estatus], [color]) VALUES (12, NULL, N'F', N'Franquicia KunGio', 45, 1, 2, 1, 10000, N'', 1, N'F')
SET IDENTITY_INSERT [dbo].[NivelRed] OFF
GO
