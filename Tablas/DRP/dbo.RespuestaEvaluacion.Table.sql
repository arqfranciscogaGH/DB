
/****** Object:  Table [dbo].[RespuestaEvaluacion]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[RespuestaEvaluacion]
GO
/****** Object:  Table [dbo].[RespuestaEvaluacion]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespuestaEvaluacion](
	[IdRespuestaEvaluacion] [int] IDENTITY(1,1) NOT NULL,
	[IdCaptura] [int] NULL,
	[IdCuestionario] [int] NULL,
	[IdPropiedadControl] [int] NULL,
	[IdRespuestaPregunta] [int] NULL,
	[Respuesta] [varchar](max) NULL,
	[Ponderacion] [decimal](6, 2) NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaActuaizacion] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[Version] [smallint] NULL,
	[Activo] [bit] NULL,
	[RespuestaLista] [varchar](max) NULL,
 CONSTRAINT [PK_RespuestaEvaluacion] PRIMARY KEY CLUSTERED 
(
	[IdRespuestaEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestaEvaluacion] ON 

INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (1, 8027, 12055, 16374, NULL, N'', NULL, CAST(0x0000AAB0017B59AA AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (2, 8028, 12055, 16374, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FA5F8 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (3, 8028, 12055, 16375, 0, N'1', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB15C AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (4, 8028, 12055, 16376, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB279 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (5, 8028, 12055, 16377, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB488 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (6, 8028, 12055, 17374, 0, NULL, CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB544 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (7, 8028, 12055, 17375, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB584 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (8, 8028, 12055, 17376, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAB0017FB753 AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (9, 8019, 12055, 16374, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAC60164E361 AS DateTime), CAST(0x0000AAD801798F7F AS DateTime), NULL, 5, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (10, 8019, 12055, 16375, 0, N'Español', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAC60164E51C AS DateTime), CAST(0x0000AAD8017B8C37 AS DateTime), NULL, 5, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (11, 8019, 12055, 16376, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAC60164E655 AS DateTime), CAST(0x0000AAD8017B8DC2 AS DateTime), NULL, 5, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (12, 8019, 12055, 16377, 0, N'', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAC60164E813 AS DateTime), CAST(0x0000AAD8017B8F02 AS DateTime), NULL, 6, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (13, 8019, 12055, 17376, 1002, N'FGA ', CAST(1.00 AS Decimal(6, 2)), CAST(0x0000AAC60164ED66 AS DateTime), CAST(0x0000AAD8017B93F8 AS DateTime), NULL, 6, 1, NULL)
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (14, 8020, 12055, 16374, 1, N'1', CAST(1.00 AS Decimal(6, 2)), CAST(0x0000AAD90165519E AS DateTime), CAST(0x0000AAD90179057F AS DateTime), NULL, 3, 1, N'a)  Uno')
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (15, 8020, 12055, 16375, 0, N'2', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAD9016830B9 AS DateTime), CAST(0x0000AAD9017908E5 AS DateTime), NULL, 3, 1, N'Inglés')
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (16, 8020, 12055, 16376, 0, N'3025,3026', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAD901684C31 AS DateTime), CAST(0x0000AAD901790AAF AS DateTime), NULL, 3, 1, N'VentanaRedonda,VentanaPestana')
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (17, 8020, 12055, 16377, 0, N'!=', CAST(0.00 AS Decimal(6, 2)), CAST(0x0000AAD901684DBA AS DateTime), CAST(0x0000AAD901790BAD AS DateTime), NULL, 3, 1, N'Diferente')
INSERT [dbo].[RespuestaEvaluacion] ([IdRespuestaEvaluacion], [IdCaptura], [IdCuestionario], [IdPropiedadControl], [IdRespuestaPregunta], [Respuesta], [Ponderacion], [FechaRegistro], [FechaActuaizacion], [IdUsuario], [Version], [Activo], [RespuestaLista]) VALUES (18, 8020, 12055, 17376, 1002, N'FGA XXX', CAST(1.00 AS Decimal(6, 2)), CAST(0x0000AAD901684EAE AS DateTime), CAST(0x0000AAD901790D25 AS DateTime), NULL, 3, 1, N'')
SET IDENTITY_INSERT [dbo].[RespuestaEvaluacion] OFF
