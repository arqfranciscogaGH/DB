
/****** Object:  Table [dbo].[Privilegio]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Privilegio]
GO
/****** Object:  Table [dbo].[Privilegio]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Privilegio](
	[IdPrivilegio] [int] IDENTITY(1,1) NOT NULL,
	[IdAplicacion] [int] NULL,
	[Clave] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Permiso] [varchar](max) NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Privilegio] PRIMARY KEY CLUSTERED 
(
	[IdPrivilegio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Privilegio] ON 

INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6, 3039, N'6', N'Ingresar a Menú Grupo', N'C', 1, 1, N'Ingresar a Menú Grupo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (7, 3040, N'7', N'Ingresar a Menú Perfil', N'C', 1, 1, N'Ingresar a Menú Perfil')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8, 6049, N'8', N'Ingresar a Menú Privilegios ', N'C', 1, 1, N'Ingresar a Menú Privilegios ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (27, 3041, N'27', N'Ingresar a Menú Usuarios', N'C', 1, 1, N'Ingresar a Menú Usuarios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (32, 1, N'32', N'Ingresar a  Menú Seguridad', N'C', 1, 0, N'Ingresar a  Menú Seguridad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (33, 1023, N'33', N'Ingresar a Menú Catálogos', N'A,M,E,C', 1, 1, N'Ingresar a Menú Catálogos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (34, 4043, N'34', N'Ingresar a Menú Suscripción', N'C', 1, 1, N'Ingresar a Menú Suscripción')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (42, 3035, N'42', N'Ingresar a Menú Aplicación', N'C', 1, 1, N'Ingresar a Menú Aplicación')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (44, 6050, N'44', N'', N'A,M,E,C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (48, 6070, N'48', N'Administración de Respuestas', N'A,C,E,M', 1, 1, N'Administración de Respuestas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (50, 1, N'50', N'Ingresar a Menú Operaciones', N'C', 1, 1, N'Ingresar a Menú Operaciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (51, 1016, N'51', N'Ingresar a Parámetros de Configuración', N'C', 1, 1, N'Ingresar a Parámetros de Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (52, 1016, N'52', N'AMEC  Parámetros Configuración', N'A,M,E,C', 1, 1, N'AMEC  Parámetros Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (53, 1016, N'53', N'Modificar  Parámetros Configuración', N'M,C', 1, 1, N'Modificar  Parámetros Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (54, 1016, N'54', N'Consultar Parámetros Configuración', N'C', 1, 1, N'Consultar Parámetros Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (55, 2025, N'55', N'Ingresar a Menú de Menús', N'C', 1, 1, N'Ingresar a Menú de Menús')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (56, 1, N'56', N'Ingresar a  Menú Configuración', N'C', 1, 1, N'Ingresar a  Menú Configuración ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (73, 5049, N'73', N'Ingresar Evaluación', N'A,M,E,C', 1, 1, N'Ingresar Evaluación')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (74, 1021, N'74', N'Ingresar Captura Variables Flujo', N'A,M,E,C', 1, 1, N'Ingresar Captura Variables Flujo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (75, 5050, N'75', N'Ingresar Captura información', N'A,M,E,C', 1, 1, N'Ingresar Captura información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (80, 1, N'80', N'Ingresar a Menús de Sitio', N'C', 1, 1, N'Ingresar a Menús de Sitio')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (82, 6050, N'82', N' 
', N'A,M,E,C', 1, 0, N'
')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (84, 6050, N'84', N'
', N'A,M,E,C', 1, 0, N' ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (88, 6050, N'88', N' ', N'A,M,E,C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1095, 2023, N'1095', N'Ingresar a Menú de Cuestionarios', N'C', 1, 1, N'Ingresar a Menú de Cuestionarios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1096, 6055, N'1096', N'Ingresar a  Administración de Flujo  de  trabajo', N'A,M,E,C', 1, 1, N'Ingresar a  Administración de Flujo  de  trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1097, 6050, N'1097', N'Ingresar Ver flujo de trabajo', N'C', 1, 1, N'Ingresar Ver flujo de trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1098, 6051, N'1098', N'Ingresar Seguimiento', N'C', 1, 1, N'Ingresar Seguimiento')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1099, 3042, N'1099', N'Ingresar Mis Pendientes', N'C,M', 1, 1, N'Ingresar Mis Pendientes')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1100, 6053, N'1100', N'Ingresar Consultar Historial', N'C', 1, 1, N'Ingresar Consultar Historial')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1101, 3034, N'1101', N'Ingresar Registrar Actividad ', N'A,M,E,C', 1, 1, N'Ingresar Registrar Actividad ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2096, 3032, N'2096', N'Ingresar a Menú de Planeación  Captura', N'C', 1, 1, N'Ingresar a Menú de Planeación  Captura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2098, 3033, N'2098', N'Ingresar a Menú Acciones preguntas', N'C', 1, 1, N'Ingresar a Menú Acciones preguntas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2099, 0, N'2099', N'', N'C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2102, 6053, N'2102', N'Iniciar Actividad', N'M,C', 1, 0, N'Iniciar Actividad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2103, 6053, N'2103', N'Terminar Actividad', N'M,C', 1, 0, N'Terminar Actividad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2104, 1, N'2104', N'Ingresar a Seguridad', N'C', 1, 1, N'Ingresar a Seguridad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2105, 6052, N'2105', N'Ingresar a Menú Aplcación', N'C', 1, 0, N'Ingresar a Menú Aplcación')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3107, 3037, N'3107', N'Ingresar a Área', N'A,M,E,C', 1, 1, N'Ingresar a Área')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3108, 4044, N'3108', N'Ingresar a Puesto', N'A,M,E,C', 1, 1, N'Ingresar a Puesto')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3109, 6057, N'3109', N'Ingresar a Empleado', N'A,M,E,C', 1, 1, N'Ingresar a Empleado')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3110, 1, N'3110', N'Ingresar a  Estructura', N'C', 1, 1, N'Ingresar a  Estructura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3113, 1, N'3113', N'Ingresar a Menú Flujo de Trabajo', N'C', 1, 1, N'Ingresar a Menú Flujo de Trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3118, 4047, N'3118', N'Ingresar Estadísticas de Flujo', N'C', 1, 1, N'Ingresar Estadísticas de Flujo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3119, 6067, N'3119', N'Ingresar Idioma', N'M,C', 1, 1, N'Ingresar Idioma')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3123, 6053, N'3123', N'Asignar Responsable', N'M,C', 1, 0, N'Asignar Responsable')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6118, 6067, N'6118', N'Ingresar a Tema', N'M,C', 1, 1, N'Ingresar a Tema')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6125, 1, N'6125', N'Ingresar a Menú Principal', N'C', 1, 1, N'Ingresar a Menú Principal')
SET IDENTITY_INSERT [dbo].[Privilegio] OFF
