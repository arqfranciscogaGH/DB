USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[m_USUARIO]    Script Date: 15/01/2022 10:20:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[m_USUARIO](
	[id] [int] NOT NULL,
	[nombre] [varchar](max) NULL,
	[cuenta] [varchar](100) NULL,
	[contrasena] [varchar](50) NULL,
	[perfiles] [nvarchar](max) NULL,
	[grupos] [nvarchar](max) NULL,
	[tipo] [varchar](max) NULL,
	[idUsuarioSuperior] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1, N'Administrador', N'admin', N'123', N'1', N'1', N'Kungio', 0)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (2, N'Jorge Arturo Rizo Espinosa', N'giorgio', N'123', N'1', N'2', N'Kungio', 1)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (4, N'Cuauhtemoc Baez Main', N'cuauhtemoc.baez', N'123', N'2', N'4', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1006, N'Victor Chavez Ramirez', N'victor.chavez', N'123', N'2', N'4', N'Bronze', 4)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1005, N'Ismael Jaramillo Lagunas', N'ismael.jaramillo', N'123', N'2', N'4', N'Bronze', 4)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1008, N'Ingrid Rodriguez Arcipreste', N'ingrid.rodriguez', N'123', N'2', N'4', N'Silver', 4)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1007, N'Elias Rafael Reyes Valdes', N'rafael.reyes', N'123', N'2', N'4', N'Silver', 4)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1009, N'Leon Sergio Martin Barri Gonzalez', N'marin.barri', N'123', N'2', N'4', N'Bronze', 1007)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1010, N'Claudia Patricia Rios Piña', N'claudia.rios', N'123', N'2', N'4', N'Bronze', 1009)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1011, N'Daniel Novoa', N'daniel.novoa', N'123', N'2', N'4', N'Bronze', 1010)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1012, N'Guadalupe Márquez Beltran', N'guadalupe.marquez', N'123', N'2', N'4', N'Bronze', 1008)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1015, N'Ricardo Esteban Velasco España', N'ricardo.velasco', N'123', N'2', N'2', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1016, N'Marco Antonio Robles Aroche', N'marco.robles', N'123', N'2', N'2', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1017, N'Ignacio Martinez Bautista', N'ignacio.martinez', N'123', N'2', N'3', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1018, N'Francisco Garcia Almaraz', N'Francisco.Garcia', N'123', N'2', N'3', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1019, N'Andres Arturo Romero Arenas', N'andres.romero', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1020, N'Alfonso Cuauhtemoc Hernandez Sandoval', N'alfonso.hernandez', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1021, N'Jose de Jesus Lopez Moran', N'jose.lopez', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1022, N'Angeles Jimenez Tenorio', N'angeles.jimenez', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1023, N'Isrrael Valverde Torres', N'isrrael.valverde', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1024, N'Veronica Ramirez Cruz', N'veronica.ramirez', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1025, N'Xavier Garcia Trejo', N'Xavier.García', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1026, N'Olivia Cazares Leyva', N'Olivia.cazares', N'123', N'2', N'2', N'Bronze', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1027, N'Noel Maldonado Ortiz', N'noel.maldonado', N'123', N'2', N'2', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1035, N'Desiree Yolotzin Hernandez Gomez', N'desiree.hernandez', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1036, N'Christopher Donovan Hernandez Gomez', N'Christopher.hernandez', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1037, N'Hugo Edmundo Sevilla Aldana', N'hugo.sevilla', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1038, N'Miguel Angel Aparicio Jasso', N'Miguel.jasso', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1039, N'Imelda Yolanda Carrillo Estrada', N'imelda.carrillo', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1040, N'Maria Isabel Rodriguez Sanchez', N'isabel.rodriguez', N'123', N'2', N'3', N'Bronze', 1017)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1028, N'Rodrigo Montes de Oca Soto', N'rodrigo.montes', N'123', N'2', N'7', N'Gold', 1014)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1029, N'Diana Paola Gonzalez Lozada', N'diana.gonzalez', N'123', N'2', N'7', N'Gold', 1014)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1030, N'Daniel Padilla Gomez', N'daniel.padilla', N'123', N'2', N'7', N'Gold', 1014)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1031, N'Jose Aurelio Gonzalez Mondragon', N'jose.gonzalez', N'123', N'2', N'7', N'Gold', 1014)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1041, N'Enrique Aaron Trujillo', N'enrique.trujillo', N'123', N'2', N'5', N'Silver', 1027)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1042, N'Valeria Luna Juarez', N'valeria.luna', N'123', N'2', N'5', N'Silver', 1027)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1044, N'Pablo Jesus Sanchez de la Cruz', N'pablo.sanchez', N'123', N'2', N'5', N'Bronze', 1042)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1045, N'Alan Aldahir Maldonado Lopez', N'alan.maldonado', N'123', N'2', N'5', N'Bronze', 1042)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1046, N'Juan Francisco Cisneros Flores', N'juan.cisneros', N'123', N'2', N'5', N'Silver', 1041)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1047, N'Sara Lopez Alfaro', N'sara.lopez', N'123', N'2', N'5', N'Bronze', 1041)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1032, N'Maria de Loreto Velazquez Cornejo', N'loreto.velazquez', N'123', N'2', N'8', N'Silver', 1015)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1043, N'Isaac Vazquez Diaz', N'isaac.vazquez', N'123', N'2', N'8', N'Bronze', 1032)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1033, N'Jose Manuel Rosaliano Mendez', N'jose.rosaliano', N'123', N'2', N'6', N'Bronze', 1016)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1034, N'Lorena Cureño', N'lorena.cureno', N'123', N'2', N'6', N'Bronze', 1016)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1014, N'Alejandra Ivonne Arzate Gonzalez', N'alexa.arzate', N'123', N'2', N'7', N'Gold', 2)
INSERT [dbo].[m_USUARIO] ([id], [nombre], [cuenta], [contrasena], [perfiles], [grupos], [tipo], [idUsuarioSuperior]) VALUES (1013, N'Martha Leticia Cordova Barrera', N'martha.cordova', N'123', NULL, N'4', N'Bronze', 1010)

--------COPIAR
   SELECT S.id,S.nombre,[cuenta],[contrasena] ,[perfiles] ,[grupos], s.tipo,S.idSuscriptor AS idUsuarioSuperior
   into m_USUARIO
   FROM [DB_A72B95_drp].[dbo].[Usuario] U
   INNER  JOIN SUSCRIPCION  S ON S.id=U.idSuscriptor

   ----------
delete  FROM  m_USUARIO where  id=1
SELECT * FROM  m_USUARIO


/****** Script for SelectTopNRows command from SSMS  ******/
	SELECT TOP 1000 [IdUsuario]
		  ,[Cuenta]
		  ,[Contrasena]
		  ,[IdEstacionTrabajo]
		  ,[IdUsuarioSuperior]
		  ,[FechaRegistro]
		  ,[FechaVigencia]
		  ,[FechaCambioEstatus]
		  ,[Tema]
		  ,[IdEstatusUsuario]
		  ,[Activo]
		  ,[IdSuscriptor]
		  ,[Sesiones]
		  ,[Intentos]
		  ,[IdIdioma]
		  ,[Perfiles]
		  ,[Grupos]
		  ,[Expira]
		  ,[Privilegios]
	  FROM [DRP].[dbo].[CuentaUsuario]

  ---inserar usuarios

  delete FROM [DRP].[dbo].[CuentaUsuario] where IdUsuario>1

  SET IDENTITY_INSERT [dbo].[CuentaUsuario] ON 

INSERT [dbo].[CuentaUsuario] (  [IdUsuario] ,[Cuenta] ,[Contrasena] ,[Perfiles] ,[Grupos],[IdUsuarioSuperior],[IdSuscriptor],[Tema],[Activo]  )
SELECT Id,[Cuenta] ,[Contrasena] ,'4' ,[Grupos],[IdUsuarioSuperior],2,'AzulColoresPasteles',1
FROM m_USUARIO 

SET IDENTITY_INSERT [dbo].[CuentaUsuario] OFF

  ---inserar Personas

SELECT TOP 1000 [IdPersona]
      ,[IdTipoPersona]
      ,[RFC]
      ,[FechaNacimiento]
      ,[Curp]
      ,[Nombre]
      ,[ApellidoPaterno]
      ,[ApellidoMaterno]
      ,[Genero]
      ,[Correo]
      ,[Telefono]
      ,[TelefonoMovil]
      ,[Saldo]
      ,[IdSuscriptor]
      ,[IdUsuario]
      ,[Activo]
  FROM [DRP].[dbo].[Persona]

    delete FROM [DRP].[dbo].[Persona] where [IdPersona]>0

  SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] (  [IdPersona] ,[Nombre] ,[IdUsuario] ,[IdTipoPersona], [IdSuscriptor],[Activo]  )
SELECT Id,Nombre,Id ,substring(tipo,1,1),2,1
FROM m_USUARIO 

SET IDENTITY_INSERT [dbo].[Persona] OFF

select   [IdPersona],U.IdUsuario,U.IdUsuarioSuperior , [Cuenta]   ,[Nombre] ,[IdTipoPersona] FROM [CuentaUsuario] U
   INNER  JOIN [Persona] P ON P.[IdUsuario]=U.[IdUsuario]

   ---- CONSULTAS 

   SELECT TOP (1000) [IdUsuario]
      --,[Cuenta]
      --,[Contrasena]
      --,[IdEstacionTrabajo]
      --,[IdUsuarioSuperior]
      --,[FechaRegistro]
      --,[FechaVigencia]
      --,[FechaCambioEstatus]
      --,[Tema]
      --,[IdEstatusUsuario]
      --,[Activo]
      --,[IdSuscriptor]
      --,[Sesiones]
      --,[Intentos]
      --,[IdIdioma]
      --,[Perfiles]
      --,[Grupos]
      --,[Expira]
      --,[Privilegios]
	 , *
  FROM [CuentaUsuario]   U LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos	
 --- WHERE  CUENTA='ismael.jaramillo'
  ORDER BY  1

  select   [IdPersona],U.IdUsuario,U.IdUsuarioSuperior , [Cuenta]   ,[Nombre] ,[IdTipoPersona] FROM [CuentaUsuario] U
   INNER  JOIN [Persona] P ON P.[IdUsuario]=U.[IdUsuario]
   ORDER BY  2

  	 SELECT S.ID,s.idSuscriptor  AS SUP, S.TIPO, * FROM USUARIO U  INNER JOIN Suscripcion_app  S  ON  S.ID= U.idSuscriptor    
	--- WHERE  CUENTA='ismael.jaramillo'
	 ORDER  BY 1
	 
  SELECT  * FROM USUARIO
  SELECT  * FROM Suscripcion
  SELECT  * FROM Suscripcion_app

  SELECT  * FROM Persona
  SELECT  * FROM Persona_APP


   SELECT  * FROM Cliente   where  idSocio=1

    SELECT  * FROM CuentaUsuario  where  IdUsuario=1041
   SELECT  * FROM Persona  where IdPersona=1041 

 UPDATE Persona
 SET IdUsuario=1041
 where IdPersona=1041 
      UPDATE   Cliente
   SET idSuscriptor=2

   UPDATE   Cliente
   SET idSocio=2
    where  id in  ( 80 , 81 )

	   UPDATE   Cliente
   SET idSocio=2
    where  idSocio in  ( 0)


	select  * FROM [CuentaUsuario]   where grupos='1'

	update   [CuentaUsuario] 
	set grupos='2'
	where grupos='1'

 SELECT TOP (1000) [IdGrupo]
      ,[Nombre]
      ,[Activo]
      ,[IdSuscriptor]
      ,[Privilegios]
  FROM [DB_A72B95_drp].[dbo].[Grupo]



  	select  * from   dbo.ObtenerListaPorNombreValor ('')
EXEC VerTramite  'LINEAIV',0,1

	EXEC VerDashBoard  'LINEAIV',0,1


exec  ConsultarMisPendientes 'LINEAIV','',1


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3',1


EXEC VerProductividadVencidas 'LINEAIV','',1

EXEC Seguimiento 'LINEAIV','01907402703',1

VerEstadisticasFlujoPorVistaDetallePorFiltro

VerProductividadVencidasdDetalle






	 