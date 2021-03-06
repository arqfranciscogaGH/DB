
/****** Object:  Table [dbo].[AccionControl]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[AccionControl]
GO
/****** Object:  Table [dbo].[AccionControl]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccionControl](
	[IdAccionControl] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedadControlOrigen] [int] NOT NULL,
	[IdPropiedadControlAfectado] [int] NOT NULL,
	[Accion] [nvarchar](50) NULL,
	[OperadorCondicion] [nvarchar](20) NULL,
	[ValorCondicion] [nvarchar](255) NULL,
	[ArgumentoCondicion] [nvarchar](255) NULL,
	[Activo] [bit] NULL,
	[IdCuestionarioOrigen] [int] NULL,
	[IdCuestionarioAfectado] [int] NULL,
 CONSTRAINT [PK_PropiedadControl_IdAccionControl] PRIMARY KEY CLUSTERED 
(
	[IdAccionControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AccionControl] ON 

INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2, 2049, 2053, N'CAMBIARLISTA', N'>=', N'10', N'2', 1, 2012, 2012)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3, 2049, 2060, N'CAMBIARCOLOR', N'<=', N'20', N'colorAzul', 1, 2012, 2012)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (4, 2049, 2059, N'CAMBIARCOLOR', N'=', N'10', N'colorVerde', 1, 2012, 2013)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (5, 2060, 2049, N'CAMBIARCOLOR', N'=', N'10', N'colorVerde', 1, 2012, 2012)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1002, 5132, 9234, N'CAMBIARLISTA', N'=', N'CAMBIARLISTA', N'3098', 1, 7023, 7023)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1004, 9235, 9238, N'ACTUALIZARLISTA', N'NA', N'', N'colorAzul', 1, 7023, 7023)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1005, 9239, 9240, N'ACTUALIZARLISTA', N'NA', N'', N'2', 1, 7023, 7023)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1009, 9242, 9243, N'ACTUALIZARLISTA', N'=', N'', N'colorAzul', 1, 9043, 9043)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1010, 9243, 9244, N'ACTUALIZARLISTA', N'=', N'', N'2', 1, 9043, 9043)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1011, 9271, 9271, N'CAMBIARLISTA', N'NA', N'', N'2', 1, 9047, 9047)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (1012, 9274, 9275, N'ACTUALIZARLISTA', N'NA', N'', N'ColorTema', 1, 9047, 9047)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2011, 10322, 10323, N'CAMBIARLISTA', N'=', N'IdGrupo', N'5142', 1, 10054, 10054)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2012, 10322, 10323, N'CAMBIARLISTA', N'=', N'IdPerfil', N'5144', 1, 10054, 10054)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2013, 10322, 10323, N'CAMBIARLISTA', N'=', N'IdArea', N'5140', 1, 10054, 10054)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2014, 10322, 10323, N'CAMBIARLISTA', N'=', N'IdPuesto', N'7148', 1, 10054, 10054)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2015, 10322, 10323, N'CAMBIARLISTA', N'=', N'IdUsuario', N'7147', 1, 10054, 10054)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2016, 11373, 11374, N'CAMBIARLISTA', N'=', N'IdUsuario', N'7147', 1, 11055, 11055)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2017, 11373, 11374, N'CAMBIARLISTA', N'=', N'IdPerfil', N'5144', 1, 11055, 11055)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2018, 11373, 11374, N'CAMBIARLISTA', N'=', N'IdArea', N'5140', 1, 11055, 11055)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2019, 11373, 11374, N'CAMBIARLISTA', N'=', N'IdGrupo', N'5142', 1, 11055, 11055)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (2020, 11373, 11374, N'CAMBIARLISTA', N'=', N'IdPuesto', N'7148', 1, 11055, 11055)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3016, 9273, 9274, N'ACTUALIZARLISTA', N'NA', N'', N'ColorTema', 1, 9047, 9047)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3017, 10325, 10326, N'ACTUALIZARLISTA', N'!*', N'', N'colorAmarillo', 1, 10056, 10056)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3018, 10367, 10368, N'ACTUALIZARLISTA', N'!*', N'', N'colorAmarillo', 1, 10057, 10057)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3019, 9218, 9219, N'CAMBIARLISTA', N'=', N'TipoPeriodo', N'5131', 1, 9039, 9039)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3020, 9219, 9220, N'CAMBIARLISTA', N'=', N'Mensual', N'7151', 1, 9039, 9039)
INSERT [dbo].[AccionControl] ([IdAccionControl], [IdPropiedadControlOrigen], [IdPropiedadControlAfectado], [Accion], [OperadorCondicion], [ValorCondicion], [ArgumentoCondicion], [Activo], [IdCuestionarioOrigen], [IdCuestionarioAfectado]) VALUES (3021, 9219, 9220, N'CAMBIARLISTA', N'=', N'Diario', N'7150', 1, 9039, 9039)
SET IDENTITY_INSERT [dbo].[AccionControl] OFF
