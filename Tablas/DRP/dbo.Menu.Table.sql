
/****** Object:  Table [dbo].[Menu]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](255) NULL,
	[Caracteristicas] [varchar](255) NULL,
	[IdModulo] [int] NULL,
	[IdSuscriptor] [int] NULL,
	[Tipo] [varchar](20) NULL,
	[MenuPrincipal] [varchar](2) NULL,
	[Marco] [varchar](20) NULL,
	[Tamano] [varchar](5) NULL,
	[Borde] [varchar](40) NULL,
	[Sombra] [varchar](20) NULL,
	[Efecto] [varchar](20) NULL,
	[MostrarTitulo] [varchar](2) NULL,
	[Activo] [bit] NULL,
	[ColorMenu] [varchar](40) NULL,
	[ColorMarco] [varchar](40) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (1, N'Menú Sitio', N'Orientacion=H;Tipo=Menu Animado ', 1, 1, N'Menu Animado', N'SI', N'Marco', NULL, NULL, N'Sombra', NULL, N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (11, N'Menú Principal', N'Orientacion=H;Tipo=Menu Lista; MenuPrincipal=SI', 1, 1, N'Menu Lista', N'SI', N'Marco', N'Ch', N'Borde', N'Sombra', N'Circulo', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (12, N'Submenú Seguridad', N'Orientacion=H;Tipo=Menu Lista', 1, 1, N'Menu Lista', N'NO', N'Marco', N'Gde', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (13, N'Submenú Catalogos', N'Orientacion=H;Tipo=Menu Lista', 1, 1, N'Menu Lista', N'NO', N'Marco', N'Gde', N'Ninguno', N'Ninguno', N'Ninguno', N'SI', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (14, N'Menú  Contenido', N'Orientacion=H;Tipo=Menu Animado ; MenuPrincipal=SI', 1, 1, N'Menu Animado', N'SI', N'Marco', N'Ch', N'Borde', N'Sombra', N'Circulo', N'NO', 1, N'ColorTema', N'colorAmarillo')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (214, N'Submenú  Configuración', N'Orientacion=H;Tipo=Menu Lista', 1, 1, N'Menu Lista', NULL, N'Marco', NULL, NULL, N'Sombra', NULL, N'NO', 1, NULL, NULL)
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (215, N'Acciones  Abc Botones', N'Tipo=Menu Botones; TipoMarco=Marco;TipoBoton=Boton', 1, 1, N'Boton', N'NO', N'Marco', N'Ch', N'BordeAbajo', N'Sombra', N'Ninguno', N'SI', 1, N'colorRojo', N'colorAzul')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (216, N'Acciones  Abc Iconos', N'Tipo=Menu Iconos ; TipoMarco=Marco;TipoBoton=IconoFuente', 1, 1, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (314, N'Acciones Idioma Iconos ', N'Tipo=Menu Iconos ; TipoMarco=Marco;TipoBoton=IconoFuente', 1, 1, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 1, N'colorAmarillo', N'colorAmarillo')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (414, N'Acciones Acceso', N'Tipo=Menu Botones; TipoMarco=Marco;TipoBoton=Boton', 1, 1, N'Boton', N'NO', N'MarcoOculto', N'Ch', N'Ninguno', N'Sombra', N'Redondo', N'NO', 1, N'ColorTema', N'colorTemaInvertido')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (415, N'Acciones Selección Perfil', N'Tipo=Menu Botones; TipoMarco=Marco;TipoBoton=Boton', 1, 1, N'Boton', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Redondo', N'SI', 1, N'ColorTema', N'colorAmarillo')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (514, N'Submenú Evaluación', N'Orientacion=H;Tipo=Menu Animado ; MenuPrincipal=SI', 1, 1, N'Menu Lista', N'NO', N'Marco', NULL, NULL, N'Sombra', NULL, N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (515, N'Acciones Consultor', N'Tipo=Menu Iconos ; TipoMarco=Marco;TipoBoton=IconoFuente', 1, 1, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (516, N'Submenú Sitio  ', N'Orientacion=H;Tipo=Menu Lista', 1, 1, N'Menu Lista', N'NO', N'Marco', N'Ch', N'Borde', N'Sombra', N'Circulo', N'NO', 1, N'colorAmarillo', N'colorAmarillo')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (517, N'Acciones Botones  Idioma', N'Tipo=Menu Botones; TipoMarco=Marco;TipoBoton=Boton', 1, 1, N'Boton', N'NO', N'Marco', N'Ch', N'BordeArriba', N'Sombra', N'Redondo', N'NO', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (522, N'Acciones Vista  Previa', NULL, 1, 1, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 0, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (1001, N'Submenú Flujo de trabajo', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'Borde', N'Sombra', N'Redondo', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (2002, N'Acciones Flujo de trabajo', NULL, 1, NULL, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Borde', N'Sombra', N'Circulo', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (2003, N'Submenú Estructura', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'Borde', N'Sombra', N'Redondo', N'NO', 1, N'colorAzulClaro', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (2004, N'Acciones  Diseño Flujo de  trabajo  ', NULL, 1, NULL, N'IconoFuente', N'NO', N'MarcoOculto', N'Ch', N'BordeAbajo', N'Sombra', N'Redondo', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (2008, N'Acciones Captura Variables', NULL, 1, NULL, N'IconoFuente', N'NO', N'MarcoOculto', N'Ch', N'BordeAbajo', N'Sombra', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (3008, N'Acciones Guardar', NULL, 1, NULL, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Circulo', N'NO', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (4008, N'Iconos Repuestas', NULL, 1, NULL, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'NO', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (4009, N'Acción  regresar', NULL, 1, NULL, N'IconoFuente', N'NO', N'Marco', N'Ch', N'Ninguno', N'Sombra', N'Ninguno', N'SI', 1, N'ColorTema', N'colorTemaTransparente')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5026, N'Menú Socio', N'Orientacion=H;Tipo=Menu Animado ; MenuPrincipal=SI', 1, 1, N'Menu Animado', N'SI', N'Marco', N'', N'Borde', N'Ninguno', N'', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5027, N'Submenú Catálagos', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'BordeAbajo', N'Ninguno', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5028, N'Submenú Consultas', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'BordeAbajo', N'Ninguno', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5029, N'Submenú Operaciones', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'BordeAbajo', N'Ninguno', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5030, N'Submenú Estadísticas', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', N'Ch', N'BordeAbajo', N'Ninguno', N'Ninguno', N'NO', 1, N'ColorTema', N'ColorTema')
INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (5031, N'Submenú  Socio', NULL, 1, NULL, N'Menu Lista', N'NO', N'Marco', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
