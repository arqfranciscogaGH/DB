
/****** Object:  Table [dbo].[RespuestaCaptura]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[RespuestaCaptura]
GO
/****** Object:  Table [dbo].[RespuestaCaptura]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespuestaCaptura](
	[IdRespuestaCaptura] [int] IDENTITY(1,1) NOT NULL,
	[IdCaptura] [int] NULL,
	[IdCuestionario] [int] NULL,
	[IdPropiedadControl] [int] NULL,
	[Respuesta] [varchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaActuaizacion] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[Version] [smallint] NULL,
	[Activo] [bit] NULL,
	[RespuestaLista] [varchar](max) NULL,
 CONSTRAINT [PK_RespuestaCaptura] PRIMARY KEY CLUSTERED 
(
	[IdRespuestaCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaCaptura] ON 

INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10180, 8023, 10048, 17377, N'', CAST(0x0000AA7F017B1EEE AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10181, 8023, 10048, 17378, NULL, CAST(0x0000AA7F017B1EF2 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10182, 8023, 10048, 17379, N'', CAST(0x0000AA7F017B1EF5 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10183, 8024, 10048, 17377, N'', CAST(0x0000AA7F018002E8 AS DateTime), CAST(0x0000AA7F018119BD AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10184, 8024, 10048, 17378, NULL, CAST(0x0000AA7F018002F0 AS DateTime), CAST(0x0000AA7F018119C3 AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10185, 8024, 10048, 17379, N'', CAST(0x0000AA7F018002F3 AS DateTime), CAST(0x0000AA7F018119C5 AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10186, 8024, 10048, 17380, N'1', CAST(0x0000AA7F018002F5 AS DateTime), CAST(0x0000AA7F018119C8 AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10188, 8025, 12055, 16374, N'', CAST(0x0000AAB00162BFB2 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10189, 8025, 12055, 16374, N'', CAST(0x0000AAB00164DAB8 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10190, 8029, 10048, 17377, N'XXXXX', CAST(0x0000AADA0156895D AS DateTime), CAST(0x0000AADA0157A234 AS DateTime), NULL, 2, 1, N'')
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10191, 8029, 10048, 17378, N' icon-adult', CAST(0x0000AADA01568962 AS DateTime), CAST(0x0000AADA0157A234 AS DateTime), NULL, 2, 1, N'adult')
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10192, 8029, 10048, 17379, N'2', CAST(0x0000AADA01568962 AS DateTime), CAST(0x0000AADA0157A246 AS DateTime), NULL, 2, 1, N'Inglés')
INSERT [dbo].[RespuestaCaptura] ([IdRespuestaCaptura], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [Respuesta], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10193, 8029, 10048, 17380, N'', CAST(0x0000AADA01568966 AS DateTime), CAST(0x0000AADA0157A246 AS DateTime), NULL, 2, 1, N'')
SET IDENTITY_INSERT [dbo].[RespuestaCaptura] OFF
