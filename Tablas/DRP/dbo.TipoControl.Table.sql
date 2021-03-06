
/****** Object:  Table [dbo].[TipoControl]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[TipoControl]
GO
/****** Object:  Table [dbo].[TipoControl]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoControl](
	[IdTipoControl] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NULL,
	[Prefijo] [nvarchar](10) NULL,
	[CssClass] [nvarchar](100) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoControl] PRIMARY KEY CLUSTERED 
(
	[IdTipoControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TipoControl] ON 

INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (1, N'Label', N'lbl', N'Etiqueta ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (2, N'TextBox  - CajaTexto', N'txt', N'CajaTexto BordeIzq  ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3, N'Etiqueta', N'lbl', N'Etiqueta ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4, N'DropDownList - Lista despegable', N'ddl', N'ListaDespegable  BordeIzq ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (5, N'RadioButtonList - Lista de  Opciones', N'rbl', N'ListaOpciones BordeIzq ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (6, N'CheckBox - Caja  de  verificación', N'cbo', N'CajaVerificacion BordeIzq  ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (7, N'EtiquetaColumna', N'lbl', N'EtiquetaColumna ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (8, N'RegularExpressionValidator', N'vex', N'Validador', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (9, N'RequiredFieldValidator', N'vob', N'Validador', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (10, N'Marco', N'mar', N'Marco', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (1003, N'Validador', N'val', N'Validador', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3002, N'MarcoOculto', N'mar', N'MarcoOculto', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3003, N'IconoFuente', N'ico', N'IconoFuente Sombra', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3004, N'Boton', N'btn', N'Boton ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3005, N'BotonBordes', N'btn', N'IconoFuente BordeArriba BordeAbajo ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3006, N'BotonBordeSuperior', N'btn', N'IconoFuente BordeArriba', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3007, N'BotonBordInferior', N'btn', N'IconoFuente BordeAbajo', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3008, N'BotonSombra', N'btn', N'Boton Sombra', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3009, N'BotonRedondo', N'btn', N'IconoFuente Redondo', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3010, N'BotonRedondoBordes', N'btn', N'IconoFuente Redondo BordeAbajo BordeArriba', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3011, N'BotonRedondoBorderSuperior', N'btn', N'IconoFuente  Redondo BordeArriba', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3012, N'BotonRedondoBorderInferior', N'btn', N'IconoFuente Redondo BordeAbajo', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3013, N'BotonRedondoSombra', N'btn', N'IconoFuente Redondo Sombra', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3014, N'BotonCirculo', N'btn', N'IconoFuente Circulo', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3015, N'BotonCirculoBordes', N'btn', N'IconoFuente Circulo BordeAbajo  BordeArriba', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3016, N'BotonCirculoBorderSuperior', N'btn', N'IconoFuente Circulo BordeArriba', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3017, N'BotonCirculoBorderInferior', N'btn', N'IconoFuente Circulo BordeAbajo', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3018, N'BotonCirculoSombra', N'btn', N'IconoFuente Circulo Sombra', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3019, N'TextBox  - CajaTexto con  Borde Inferior', N'txt', N'CajaTexto BordeAbajo ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3020, N'LabelBorderInferior', N'lbl', N'Etiqueta BordeAbajo ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3021, N'VentanaVacia', N'ven', N'Ventana Vacia ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3022, N'VentanaFlotante', N'ven', N'Ventana  Flotante ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3023, N'VentanaTransparente', N'ven', N'Ventana Transparente ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3024, N'VentanaNormal', N'ven', N'Ventana  Normal ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3025, N'VentanaRedonda', N'ven', N'Ventana Redonda ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (3026, N'VentanaPestana', N'ven', N'Ventana Pestana ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4026, N'IconoMinimizar', N'icp', N'IconoFuente Ch colorTema    icon-window-minimize', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4027, N'IconoMaximizar', N'icp', N'IconoFuente Ch colorTema    icon-window-maximize ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4028, N'IconoCerrar', N'icp', N'IconoFuente Ch colorTema  icon-window-close ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4029, N'IconoAvanzar', N'icp', N'IconoFuente Ch Fondo Sombra colorTema  icon-right', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4030, N'IconoRegresar', N'icp', N'IconoFuente Ch Fondo Sombra ColorTema  icon-left', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4031, N'IconoAgregar', N'icp', N'IconoFuente Med Fondo Sombra colorTema  icon-doc-add', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4032, N'IconoActualzar', N'icp', N'IconoFuente Med Fondo Sombra colorTema  icon-edit ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4033, N'IconoEliminar', N'icp', N'IconoFuente Med Fondo Sombra colorTema icon-trash-empty', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4034, N'IconoNuevo', N'icp', N'IconoFuente Med Fondo Sombra colorTema  icon-doc ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4035, N'IconoConsultar', N'icp', N'IconoFuente Med Fondo Sombra colorTema colorTema  icon-grid', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4036, N'IconoInicio', N'icp', N'', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4037, N'IconoIdioma', N'icp', N'', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4038, N'IconoTema', N'ico', N'', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4039, N'IconoGuardar', N'icp', N'IconoFuente Med Fondo Sombra Circulo colorTema icon-floppy-1', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4040, N'IconoCancelar', N'icp', N'IconoFuente Med Fondo Sombra Circulo colorTema icon-cancel ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4041, N'IconoFuenteSombra', N'ico', N'IconoFuente Med Sombra Circulo ', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4042, N'IconoSeleccionFiltro', N'icp', N'IconoFuente Ch colorTema icon-check', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4043, N'IconoAscendente', N'icp', N'IconoFuente Ch colorTema icon-up-big', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4044, N'IconoDescendente', N'icp', N'IconoFuente Ch colorTema icon-down-big', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4045, N'IconoAplicarFiltro', N'icp', N'IconoFuente Ch colorTema   icon-filter', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4046, N'IconoCancelarFiltro', N'icp', N'IconoFuente Ch colorTema icon-cancel', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4047, N'IconoResumir', N'icp', N'IconoFuente Ch colorTema icon-calc', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4048, N'IconoColumnas', N'ico', N'IconoFuente Med Fondo Sombra colorTema icon-columns', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (4049, N'IconoExportar', N'icp', N'IconoFuente Med Fondo Sombra colorTema colorTema  icon-file-excel', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (5048, N'CajaVerificacion ', N'cbl', N'CajaVerificacion BordeIzq  ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (6048, N'BotonAvanzar', N'btn', N'Boton  Ch Fondo Sombra  ColorTema  icon-right', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (6049, N'BotonRegresar', N'btn', N'Boton  Ch Fondo Sombra ColorTema  icon-left', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (6050, N'ListaPersonalizada', N'lisper', N'CajaTextoPersonalizada BordeIzq  ColorTema', 1)
INSERT [dbo].[TipoControl] ([IdTipoControl], [Nombre], [Prefijo], [CssClass], [Activo]) VALUES (6051, N'Arbol', N'arbol', NULL, 1)
SET IDENTITY_INSERT [dbo].[TipoControl] OFF
