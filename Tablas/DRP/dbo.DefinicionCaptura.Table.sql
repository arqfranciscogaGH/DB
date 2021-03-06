
/****** Object:  Table [dbo].[DefinicionCaptura]    Script Date: 09/02/2022 12:23:34 a. m. ******/
DROP TABLE [dbo].[DefinicionCaptura]
GO
/****** Object:  Table [dbo].[DefinicionCaptura]    Script Date: 09/02/2022 12:23:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefinicionCaptura](
	[IdDefinicionCaptura] [int] IDENTITY(1,1) NOT NULL,
	[IdPlaneacionCaptura] [int] NOT NULL,
	[IdContenedor] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Publico] [bit] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_DefinicionCaptura] PRIMARY KEY CLUSTERED 
(
	[IdDefinicionCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DefinicionCaptura] ON 

INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (1, 1, 2011, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (2, 2, 2012, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3, 2, 2013, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4, 2, 2012, 1, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (5, 2, 2013, 111, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (8, 2, 2013, 1, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (9, 2, 2013, 1, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (10, 2, 2013, 1, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (11, 1, 2014, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (12, 3, 1, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (19, 5, 5022, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (1018, 6, 6021, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (1019, 7, 6022, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (1022, 8, 2011, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (1023, 9, 2011, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (2020, 1002, 7021, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (2021, 1003, 7022, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3022, 1002, 8029, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3026, 1003, 8028, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3027, 1004, 8034, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3028, 1006, 8035, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3031, 1007, 9039, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3034, 1007, 9040, 2, 1, 0)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3036, 1008, 9040, 3, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3037, 0, 1, 1, 0, 0)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3040, 2, 2013, 111, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3041, 1011, 2013, 111, 0, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3042, 1012, 7023, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3043, 1013, 9043, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3044, 1014, 9044, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3045, 1015, 9045, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3046, 1016, 9038, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3047, 1016, 8036, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3048, 1017, 9036, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3049, 1018, 9037, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3050, 1016, 9047, 3, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3051, 1016, 9046, 4, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3052, 1016, 9048, 5, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (3053, 1016, 9049, 6, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4045, 1019, 10046, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4046, 2015, 10045, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4047, 2016, 9043, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4048, 2017, 10047, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4049, 2018, 10049, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4050, 2018, 10050, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4051, 2018, 10051, 3, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4055, 2018, 10054, 5, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4056, 2019, 10050, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4062, 2020, 10051, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4064, 2021, 10054, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4065, 2022, 10049, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4066, 2022, 10055, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4067, 2022, 10050, 3, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4068, 2022, 10056, 4, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4069, 2020, 10057, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (4070, 2019, 10056, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (5065, 3022, 11055, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (6065, 4022, 13055, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7065, 5022, 12055, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7066, 5023, 13057, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7067, 5024, 13056, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7068, 1018, 13058, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7069, 1017, 13059, 2, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7070, 1016, 13060, 7, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7071, 5025, 13061, 1, 1, 1)
INSERT [dbo].[DefinicionCaptura] ([IdDefinicionCaptura], [IdPlaneacionCaptura], [IdContenedor], [Orden], [Publico], [Activo]) VALUES (7100, 5500, 15000, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[DefinicionCaptura] OFF
