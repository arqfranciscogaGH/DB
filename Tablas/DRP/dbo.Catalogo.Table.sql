
/****** Object:  Index [PK_Catalogo]    Script Date: 27/01/2022 01:40:26 a. m. ******/
ALTER TABLE [dbo].[Catalogo] DROP CONSTRAINT [PK_Catalogo]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Catalogo]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogo](
	[IdCatalogo] [int] IDENTITY(1,1) NOT NULL,
	[IdAplicacion] [int] NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](max) NULL,
	[Tipo] [varchar](1) NULL,
	[Sql] [varchar](max) NULL,
	[Activo] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo] ON 

INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (2, 10, N'Idioma', N'Idioma ', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3, 10, N'Tipo Autentificacion ', N'Tipos  de  Autentificación  ', N'C', N'Escriba SQL ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (4, 10, N'Ninguno', N'Ninguno', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (23, 10, N'Módulo Sistema', N'Módulo Sistema', N'S', N' SELECT * FROM  ( select  IdModuloSistema as Id ,Nombre as Valor from  ModuloSistema where  activo=1   ) AS CONSULTA  ORDER  BY 2', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (25, 10, N'Cultura', N'Cultura', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (27, 10, N'Tema ', N'Lista de temas ', N'', N'Escriba SQL ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (31, 10, N'Tipo Consulta', N'Tipo Consulta', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (50, 10, N'Tipo de dato  en configuración', N'Tipo de dato  en configuración', N'C', N' ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3120, 10, N'Comando', N'Comando', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (2082, 10, N'Tipo de Control', N'Tipo de Control', N'S', N'   SELECT TOP 1000  IdTipoControl as Id, Nombre as Valor  FROM [TipoControl] where  Prefijo in ( ''txt'',''ddl'',''rbl'',''cbo'',''cbl'' , ''lisper'', ''arbol'')  and Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (2083, 10, N'Tipo Validación', N'Tipo Validación', N'S', N' SELECT TOP 1000 [IdTipoValidacion] as Id,[Nombre] as Valor   FROM [TipoValidacion] where Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3122, 10, N'Tamaño', N'Tamaño', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (58, 1, N'', N'', N'S', N'SELECT  ClaveEstado ,Nombre FROM ESTADO', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3107, 10, N'TipoComando', N'Tipo de Comando', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3087, 10, N'SiNo', N'Opciones SiNo', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3088, 10, N'TipoLista', N'Tipo Lista', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3089, 10, N'layout', N'Opciones de layout', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3090, 10, N'PosicionMenu', N'Opciones de Posicion Menu', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3096, 10, N'Color', N'Opciones de Color', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3108, 10, N'Orientacion', N'Orientacion', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3091, 10, N'TipoBoton', N'Tipo de  Boton', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3092, 10, N'direccion', N'Opciones de direccion', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3093, 10, N'Columnas', N'Opciones de Columnas', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3094, 10, N'Vistas', N'Opciones de Vistas', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3095, 10, N'IdMenu', N'Menús en captura', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3098, 10, N'Lista  Catálogo', N'Lista  Catálogo', N'S', N'      SELECT * FROM  ( select  IdCatalogo as Id ,Descripcion as Valor from  Catalogo where  activo=1  and  IdAplicacion=10 ) AS CONSULTA  ORDER  BY 2', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3109, 10, N'TipoMenu', N'Tipo de  Menu', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3126, 10, N'Imagen', N'Imagen de icomo', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (1081, 10, N'Tipo de ventana', N'Tipo de ventana', N'S', N' SELECT TOP 1000  IdTipoControl as Id, Nombre as Valor
 FROM [TipoControl]
 where  nombre  like  ''%ven%''', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (4126, 10, N'NavegacionPestanas', N'Navegacion Pestañas', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5127, 10, N'Cuestionarios', N'Cuestionarios', N'S', N'SELECT TOP 1000  IdContenedor as Id, Titulo as Valor  FROM [ContenedorControl] where  Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5128, 10, N'Aplicaciones', N'Aplicaciones', N'S', N'  SELECT TOP 1000  IdAplicacion as Id, Descripcion as Valor  FROM [Aplicacion] where  Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5132, 10, N'Operador', N'Operador', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5133, 10, N'Accion control', N'Accion control', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5134, 10, N'Cuestioarios', N'Cuestioarios', N'S', N'SELECT TOP 1000 [IdContenedor] as  Id, [Titulo] as Valor   FROM [ContenedorControl] where  Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5135, 10, N'Preguntas', N'Preguntas', N'S', N'SELECT * FROM 
(SELECT TOP 1000 [IdPropiedadControl] as Id,  [Titulo] as Valor, IdContenedor as Filtro   FROM [PropiedadControl] where  Activo=1  ) AS CONSULTA 
', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5136, 10, N'Flujo Trabajo', N'Flujo Trabajo', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdFlujoTrabajo as Id,  Nombre as Valor   FROM FlujoTrabajo where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5137, 10, N'Actividad Flujo Trabajo', N'Actividad Flujo Trabajo', N'S', N'	   SELECT * FROM  (SELECT TOP 1000 A.IdActividad as Id,  A.Nombre as Valor, A.IdFlujoTrabajo as Filtro   FROM  FlujoTrabajoTarea T
	   INNER JOIN   FlujoTrabajoActividad A  ON  T.IdActividad=A.IdActividad   
	    where A.Activo=1 AND T.Activo=1  ) AS CONSULTA', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5138, 10, N'Estatus por Actividad Flujo Trabajo', N'Estatus por Actividad Flujo Trabajo', N'S', N'
  	   SELECT DISTINCT * FROM  (SELECT TOP 1000 E.IdEstatus as Id,  E.Nombre as Valor, T.IdActividad as Filtro   FROM  FlujoTrabajoTarea T 
	   INNER JOIN   FlujoTrabajoTareaEstatus AE  ON  T.IdTarea=AE.IdTarea   
	   INNER JOIN   FlujoTrabajoActividad A  ON  T.IdActividad=A.IdActividad   
	   INNER JOIN   FlujoTrabajoEstatus E  ON  E.IdEstatus=AE.IdEstatus  where  E.Activo=1 AND A.Activo=1 AND T.Activo=1  ) AS CONSULTA  ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5139, 10, N'TipoAplicacion', N'Tipo Aplicación', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5140, 10, N'Äreas', N'Äreas', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdArea as Id,  Nombre as Valor   FROM AREA where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5149, 10, N'Estado', N'Estado', N'S', N'SELECT TOP 1000  * FROM  (SELECT ClaveEstado as Id,  Nombre as Valor   FROM Estado  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5152, 10, N'Municipio', N'Municipio', N'S', N'SELECT TOP 1000 * FROM  (SELECT ClaveMunicipio as Id,  Nombre as Valor, ClaveEstado AS Filtro   FROM MUNICIPIO  ) AS CONSULTA 
', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5153, 10, N'Localidad', N'Localidad', N'S', N'
SELECT TOP 1000 * FROM  (SELECT  ClaveLocalidad as Id,  Nombre as Valor, ClaveMunicipio AS Filtro   FROM LOCALIDAD  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (6140, 10, N'Suscripcion', N'Suscripcion', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdSuscriptor as Id,  NombreCorto as Valor   FROM Suscripcion where  Activo=1  ) AS CONSULTA ORDER  BY 1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7139, 10, N'Tipo Suscripción', N'TipoSuscripcion', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7141, 10, N'Id Estatus Tarea', N'IdEstatusTarea', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7143, 10, N'Acción  Tarea', N'Acción  Tarea', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7144, 10, N'Tipo Responsable', N'Tipo Responsable', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7145, 10, N'Clasificación  tarea', N'Clasificación  tarea', N'S', N'SELECT TOP 1000 * FROM  ( SELECT IdFlujoTrabajoClasificacion AS Id, Nombre  AS  Valor, IdFlujoTrabajo  AS Filtro    FROM FlujoTrabajoClasificacion   where  Activo= 1    ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7146, 10, N'TareaAEjecutar', N'Tarea a Ejecutar ', N'S', N'SELECT TOP 1000 * FROM  ( SELECT IdTarea AS Id, Nombre  AS  Valor, T.IdFlujoTrabajo  AS Filtro   FROM FlujoTrabajoTarea T INNER JOIN FlujoTrabajoActividad A ON  T.IdActividad=A.IdActividad where  T.Activo= 1  UNION SELECT  ''0''  AS Id, ''Ninguna'' AS  Valor, ''2'' AS Filtro    ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7149, 10, N'Modo', N'Modo', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7150, 10, N'Cátalogo dias', N'Cátalogo dias', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (8149, 10, N'TipoActividad', N'Tipo Actividad', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9149, 10, N'Idioma', N'Idioma ', N'', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9150, 10, N'Menú Principal', N'Menú Principal', N'S', N'
 SELECT TOP 1000 * FROM  (select  IdMenu as Id, Titulo  as Valor FROM  Menu WHERE MenuPrincipal=''SI''   ) AS CONSULTA', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9154, 10, N'Suscripcion', N'Suscripción', N'S', N'        SELECT * FROM  (SELECT TOP 1000 IdSuscriptor as Id,   NombreCorto as Valor   FROM Suscripcion where  Activo=1  ) AS CONSULTA ORDER  BY 1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9155, 10, N'Privilegio menús', N'Privilegio menús', N'S', N'SELECT * FROM  (SELECT TOP 1000 IdPrivilegio as Id, P.Clave + '' ''  + P.Descripcion + '' , Permiso: ''+ P.Permiso  as Valor, P.IdAplicacion as Filtro   FROM Privilegio P INNER JOIN  Aplicacion A  ON P.IdAplicacion=A.IdAplicacion WHERE  P.Activo=1  AND (A.Tipo=''PAGINA'' OR  A.Tipo=''SITIO'' ) AND P.Permiso LIKE ''%C%'' ) AS CONSULTA ORDER  BY 2', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9156, 10, N'', N'', N'S', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9157, 10, N'Clasificación  Privilegios', N'Clasificación  Privilegios', N'S', N'SELECT * FROM  (SELECT TOP 1000 A.IdAplicacion as Id,A.Descripcion  as Valor, A.IdModuloSistema as Filtro   FROM  Aplicacion A  WHERE  A.Activo=1  AND (A.Tipo=''CARPETA'' OR  A.Tipo=''SITIO''  OR  A.Tipo=''PAGINA'' OR  A.Tipo=''CONTROL'')  ) AS CONSULTA ORDER  BY 2', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (10159, 10, N'Nivelde red', N'Nivelde red', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (10157, 10, N'Privilegios por tipo', N'Privilegios asignados por tipo', N'S', N'exec ObtenerPrivilegiosPorTipo  ''@TipoElemento'',@IdElemento', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (10160, 10, N'Socio Superior', N'Socio Superior', N'S', N'
SELECT * FROM  (SELECT TOP 1000 Idusuario as Id,   Nombre as Valor   FROM Persona where  Activo=1  ) AS CONSULTA ORDER  BY 2', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3100, 10, N'Marco', N'Marco ', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5141, 10, N'Centros de Costos', N'Centros de Costos', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdCentroCosto as Id,  Nombre as Valor   FROM CentroCosto where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7140, 10, N'Servicios', N'Servicios', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7142, 10, N'PlaneacionCaptura', N'Planeacion de Captura', N'S', N'SELECT TOP 1000 IdPlaneacionCaptura AS  Id   , Descripcion  as Valor   FROM PlaneacionCaptura WHERE  Activo=1', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7151, 10, N'Cátalogo Mes', N'Cátalogo Mes', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (54, 1, N'', N'', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3123, 10, N'Efecto', N'Efecto', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3124, 10, N'Borde', N'Borde', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (3125, 10, N'Sombra', N'Sombra', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5129, 10, N'TipoCaptura', N'Tipo de  Captura', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5130, 10, N'TipoEvento', N'Tipo de Evento', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5131, 10, N'Periodicidad', N'Periodicidad', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5142, 10, N'Grupo', N'Grupo', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdGrupo as Id,  Nombre as Valor   FROM Grupo where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5144, 10, N'Perfil', N'Perfil', N'S', N'
  SELECT * FROM  (SELECT TOP 1000 IdPerfil as Id,  Nombre as Valor   FROM Perfil where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5145, 10, N'Estatus  Empleado', N'Estatus  Empleado', N'C', NULL, 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5146, 10, N'Empresas', N'Empresas', N'S', N'
  SELECT * FROM  (SELECT TOP 1000 IdEmpresa as Id,  Nombre as Valor   FROM Empresa where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7147, 10, N'CuentaUsuario', N'CuentaUsuario', N'S', N'SELECT * FROM  (SELECT TOP 1000 Cuenta as Id,  Nombre + '' '' +  ApellidoPaterno + '' '' + ApellidoMaterno as Valor   FROM CuentaUsuario  c inner  join  Persona p   on  c.IdUsuario=p.IdUsuario where  c.Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (7148, 10, N'Puesto', N'Puesto', N'S', N'  SELECT * FROM  (SELECT TOP 1000 IdPuesto as Id,  Nombre as Valor   FROM Puesto where  Activo=1  ) AS CONSULTA ', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5154, 10, N'Genero', N'Genero', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (5155, 10, N'Tipo de Domicilio', N'TipoDomicilio', N'C', N'', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9152, 10, N'Jefe Inmediato', N'Jefe Inmediato', N'S', N'SELECT TOP 1000 * FROM  (SELECT  IdEmpleado as Id,  +Isnull(Nombre,'' '') +Isnull(ApellidoPaterno,'' '')++Isnull(ApellidoMaterno,'' '')  as Valor, IdArea AS Filtro,C.IdSuscriptor   FROM Empleado E
INNER JOIN  CuentaUsuario C ON E.IdUsuario=C.IdUsuario
INNER JOIN  Persona P ON C.IdUsuario=P.IdUsuario
 ) AS CONSULTA', 1)
INSERT [dbo].[Catalogo] ([IdCatalogo], [IdAplicacion], [Nombre], [Descripcion], [Tipo], [Sql], [Activo]) VALUES (9153, 10, N'Tipo Privilegio', N'Tipo Privilegio', N'C', N'', 1)
SET IDENTITY_INSERT [dbo].[Catalogo] OFF
/****** Object:  Index [PK_Catalogo]    Script Date: 27/01/2022 01:40:28 a. m. ******/
ALTER TABLE [dbo].[Catalogo] ADD  CONSTRAINT [PK_Catalogo] PRIMARY KEY NONCLUSTERED 
(
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
