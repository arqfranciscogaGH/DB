USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[Privilegio]    Script Date: 26/05/2022 10:33:17 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Privilegio]') AND type in (N'U'))
DROP TABLE [dbo].[Privilegio]
GO
/****** Object:  Table [dbo].[Privilegio]    Script Date: 26/05/2022 10:33:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Privilegio] ON 

INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6, 1, N'6', N'Ingresar a Grupo', N'C', 1, 1, N'Ingresar a Grupo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (7, 1, N'7', N'Ingresar a Perfil', N'C', 1, 1, N'Ingresar a Perfil')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8, 1, N'8', N'Ingresar a Privilegios ', N'C', 1, 1, N'Ingresar a Privilegios ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (27, 1, N'27', N'Ingresar a Usuarios', N'C', 1, 1, N'Ingresar a Usuarios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (32, 1, N'32', N'Ingresar a  Seguridad', N'C', 1, 1, N'Ingresar a  Seguridad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (44, 6050, N'44', N'', N'A,M,E,C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (48, 6070, N'48', N'Administración de Respuestas', N'A,C,E,M', 1, 0, N'Administración de Respuestas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (50, 1, N'50', N'Ingresar a Menús de Sitio', N'C', 1, 1, N'Ingresar a Menús de Sitio')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (51, 1, N'51', N'Ingresar a Franquicia', N'C', 1, 1, N'Ingresar a Franquicia')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (52, 1, N'52', N'Ingresar a Parámetros Configuración', N'C', 1, 1, N'Ingresar a Parámetros Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (53, 1, N'53', N'Ingresar a Catálogos', N'C', 1, 1, N'Ingresar a Catálogos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (55, 1, N'55', N'Ingresar a Menus', N'C', 1, 1, N'Ingresar a Menus')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (56, 1, N'56', N'Ingresar a  Configuración', N'C', 1, 1, N'Ingresar a  Menú Configuración ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (73, 5049, N'73', N'Ingresar Evaluación', N'A,M,E,C', 1, 0, N'Ingresar Evaluación')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (74, 1021, N'74', N'Ingresar Captura Variables Flujo', N'A,M,E,C', 1, 0, N'Ingresar Captura Variables Flujo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (75, 5050, N'75', N'Ingresar Captura información', N'A,M,E,C', 1, 0, N'Ingresar Captura información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (80, 1, N'80', N'Ingresar a Operaciones', N'C', 1, 1, N'Ingresar a Operaciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (82, 6050, N'82', N' 
', N'A,M,E,C', 1, 0, N'
')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (84, 6050, N'84', N'
', N'A,M,E,C', 1, 0, N' ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (88, 6050, N'88', N' ', N'A,M,E,C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1095, 1, N'1095', N'Ingresar a Cuestionarios captura ', N'C', 1, 1, N'Ingresar a Cuestionarios captura ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1096, 6055, N'1096', N'Ingresar a  Administración de Flujo  de  trabajo', N'A,M,E,C', 1, 0, N'Ingresar a  Administración de Flujo  de  trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1097, 6050, N'1097', N'Ingresar Ver flujo de trabajo', N'C', 1, 0, N'Ingresar Ver flujo de trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1098, 6051, N'1098', N'Ingresar Seguimiento', N'C', 1, 0, N'Ingresar Seguimiento')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1099, 3042, N'1099', N'Ingresar Mis Pendientes', N'C,M', 1, 0, N'Ingresar Mis Pendientes')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1100, 6053, N'1100', N'Ingresar Consultar Historial', N'C', 1, 0, N'Ingresar Consultar Historial')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (1101, 3034, N'1101', N'Ingresar Registrar Actividad ', N'A,M,E,C', 1, 0, N'Ingresar Registrar Actividad ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2096, 1, N'2096', N'Ingresar a Acciones Captura', N'C', 1, 1, N'Ingresar a Acciones Captura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2098, 1, N'2098', N'Ingresar a Menú Acciones preguntas', N'C', 1, 1, N'Ingresar a Menú Acciones preguntas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2099, 0, N'2099', N'', N'C', 1, 0, N'')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2102, 6053, N'2102', N'Iniciar Actividad', N'M,C', 1, 0, N'Iniciar Actividad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2103, 6053, N'2103', N'Terminar Actividad', N'M,C', 1, 0, N'Terminar Actividad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2104, 1, N'2104', N'Ingresar a Seguridad', N'C', 1, 1, N'Ingresar a Seguridad')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2105, 1, N'2105', N'Ingresar a Menú Aplcación', N'C', 1, 1, N'Ingresar a Menú Aplcación')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (2220, 1, N'2220', N'Ingresar a Catálogos', N'C', 1, 1, N'Ingresar a Catálogos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3107, 1, N'3107', N'Ingresar a Área', N'C', 1, 1, N'Ingresar a Área')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3108, 1, N'3108', N'Ingresar a Puesto', N'C', 1, 1, N'Ingresar a Puesto')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3109, 1, N'3109', N'Ingresar a Empleado', N'A,M,E,C', 1, 0, N'Ingresar a Empleado')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3110, 1, N'3110', N'Ingresar a  Estructura', N'C', 1, 1, N'Ingresar a  Estructura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3113, 1, N'3113', N'Ingresar a Menú Flujo de Trabajo', N'C', 1, 0, N'Ingresar a Menú Flujo de Trabajo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3118, 4047, N'3118', N'Ingresar Estadísticas de Flujo', N'C', 1, 0, N'Ingresar Estadísticas de Flujo')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3119, 6067, N'3119', N'Ingresar Idioma', N'M,C', 1, 0, N'Ingresar Idioma')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (3123, 6053, N'3123', N'Asignar Responsable', N'M,C', 1, 0, N'Asignar Responsable')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6118, 1, N'6118', N'Ingresar a Tema', N'C', 1, 1, N'Ingresar a Tema')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6125, 1, N'6125', N'Ingresar a Menú Principal', N'C', 1, 1, N'Ingresar a Menú Principal')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6156, 1016, N'6156', N'Consultar Parámetros de Configuración', N'C', 1, 1, N'Consultar Parámetros de Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6157, 1016, N'6157', N'Administración Parámetros de Configuración', N'A,M,E,C', 1, 1, N'Administración Parámetros de Configuración')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6158, 3039, N'6158', N'Consultar Suscripciones ', N'C', 1, 1, N'Consultar Suscripciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6159, 3039, N'6159', N'Administración Grupos', N'A,M,E,C', 1, 1, N'Administración Grupos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6160, 3041, N'6160', N'Consultar  Usuarios', N'C', 1, 1, N'Consultar  Usuarios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6161, 3041, N'6161', N'Administración  Usuarios', N'A,M,E,C', 1, 1, N'Administración  Usuarios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6162, 3035, N'6162', N'Consultar Aplicaciones', N'C', 1, 1, N'Consultar Aplicaciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6163, 3035, N'6163', N'Administración Aplicaciones', N'A,M,E,C', 1, 1, N'Administración Aplicaciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6164, 4043, N'6164', N'Consultar Suscripciones ', N'C', 1, 1, N'Consultar Suscripciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6165, 4043, N'6165', N'Administración Suscripciones', N'A,M,E,C', 1, 1, N'Administración Suscripciones')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6168, 2025, N'6168', N'Consultar Menús', N'C', 1, 1, N'Consultar Menús')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6169, 2025, N'6169', N'Administración Menús', N'A,M,E,C', 1, 1, N'Administración Menús')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6176, 7072, N'6176', N'Consultar Clientes', N'C', 1, 1, N'Consultar Clientes')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6177, 7072, N'6177', N'Administración Clientes', N'A,M,E,C', 1, 1, N'Administración Clientes')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6178, 3033, N'6178', N'Consultar Acciones Captura', N'C', 1, 1, N'Consultar Acciones Captura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6179, 3033, N'6179', N'Administración Acciones Captura', N'A,M,E,C', 1, 1, N'Administración Acciones Captura')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6182, 3032, N'6182', N'Consultar Planeación Captura Información', N'C', 1, 1, N'Consultar Planeación Captura Información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6183, 3032, N'6183', N'Administración Planeación Captura Información', N'A,M,E,C', 1, 1, N'Administración Planeación Captura Información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6184, 2023, N'6184', N'Consultar Captura Información', N'C', 1, 1, N'Consultar Captura Información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6185, 2023, N'6185', N'Administración Captura Información', N'A,M,E,C', 1, 1, N'Administración Captura Información')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6186, 3040, N'6186', N'Consultar Perfiles', N'C', 1, 1, N'Consultar Perfiles')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6187, 3040, N'6187', N'Administración Perfiles', N'A,M,E,C', 1, 1, N'Administración Perfiles')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6188, 6049, N'6188', N'Consultar Privilegios', N'C', 1, 1, N'Consultar Privilegios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6189, 6049, N'6189', N'Administración Privilegios', N'A,M,E,C', 1, 1, N'Administración Privilegios')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6190, 1023, N'6190', N'Consultar Catálogos', N'C', 1, 1, N'Consultar Catálogos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6191, 1023, N'6191', N'Administración Catálogos', N'A,M,E,C', 1, 1, N'Administración Catálogos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6192, 4044, N'6192', N'Consultar Puestos', N'C', 1, 1, N'Consultar Puestos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6193, 4044, N'6193', N'Administración Puestos', N'A,M,E,C', 1, 1, N'Administración Puestos')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6194, 3037, N'6194', N'Consultar Áreas', N'C', 1, 1, N'Consultar Áreas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (6195, 3037, N'6195', N'Administración Áreas', N'A,M,E,C', 1, 1, N'Administración Áreas')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8141, 1, N'8141', N'Ingresar a Prospectos/Clientes  ', N'C', 1, 1, N'Ingresar a Prospectos/Clientes  ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8156, 1, N'8156', N'Ingresar a Operaciones  ', N'C', 1, 1, N'Ingresar a Operaciones  ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8157, 1, N'8157', N'Ingresar a Consultas  ', N'C', 1, 1, N'Ingresar a Consultas  ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [Clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre]) VALUES (8158, 1, N'8158', N'Ingresar a Estadísticas  ', N'C', 1, 1, N'Ingresar a Estadísticas  ')
SET IDENTITY_INSERT [dbo].[Privilegio] OFF
GO
