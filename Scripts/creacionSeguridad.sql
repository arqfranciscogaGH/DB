--ALTER TABLE [dbo].[Configuracion] DROP CONSTRAINT [FK_Configuracion_Aplicacion]
--GO
--ALTER TABLE [dbo].[Area] DROP CONSTRAINT [FK_Area_CentroCosto]
--GO



--DROP TABLE [dbo].[ElementoCatalogo]
--GO
DROP TABLE [dbo].[Puesto]
GO

DROP TABLE [dbo].[Perfil]
GO

DROP TABLE [dbo].[Grupo]
GO

DROP TABLE [dbo].[Area]
GO


DROP TABLE [dbo].[Persona]
GO


DROP TABLE [dbo].[Configuracion]
GO

DROP TABLE NivelRed
GO

DROP TABLE Usuario
GO

DROP TABLE Suscripcion
GO



--CREATE TABLE [dbo].[ElementoCatalogo](
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	IdCatalogo [int] ,
--	IdValor [varchar](max) NULL,
--	Valor [varchar](max) NULL,
--	[orden] [int]  NULL,
--	IdIdioma [int] 

-- CONSTRAINT [PK_ElementoCatalogo] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--GO

--INSERT INTO ElementoCatalogo
--SELECT 7141, 'O', 'listo' ,1 ,1


--INSERT INTO ElementoCatalogo
--SELECT 7141, '1','Iniciado' ,2 ,1


--INSERT INTO ElementoCatalogo
--SELECT 7141, '1','Terminado' ,3 ,1


CREATE TABLE [dbo].[NivelRed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[comision] float NULL,
	[orden] [int]  NULL,
	[socios] [int]  NULL,
	[operaciones] [int]  NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL
 CONSTRAINT [PK_NivelRed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



CREATE TABLE [dbo].[Area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[idCentroCosto] [int] NULL,
	[idAreaSuperior] [int]  NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Grupo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[privilegios] [nvarchar](max) NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Perfil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[pagina] [varchar](100) NULL,
	[idMenu] [int] NULL,
	[privilegios] [nvarchar](max) NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




CREATE TABLE [dbo].[Puesto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[Configuracion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[IdValor] [varchar](max) NULL,
	[valor] [nvarchar](max) NULL,
	[tipo] [varchar](20) NULL,
	[idAplicacion] [int] NOT NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO





CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](100) NULL,
	[descricpion] [varchar](max) NULL,

	[idTipoPersona] [varchar](1) NULL,
	[idUsuario] [int] NULL,

	[apellidoPaterno] [varchar](100) NULL,
	[apellidoMaterno] [varchar](100) NULL,
	[rfc] [varchar](20) NULL,
	[curp] [varchar](30) NULL,
	[telefono] [varchar](10) NULL,
	[telefonoMovil] [varchar](10) NULL,
	[correo] [varchar](max) NULL,
	[genero] [varchar](1) NULL,

	[direccion] [varchar](max) NULL,

	[referencia] [varchar](max) NULL,
	[banco] [varchar](max) NULL,
	[cuentaBanco] [varchar](max) NULL,
	[importe] [int] NULL,
	[saldo] [int] NULL,

	[rutaFoto] [varchar](max) NULL,
	[urlFoto] [varchar](max) NULL,
	[fechaNacimiento] [varchar](10) NULL,
	[fecha] [varchar](10) NULL,
	[fechaEntrega] [varchar](10) NULL,
	[fechaRegistro] [varchar](10) NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



insert Persona
  select '','','Maria','des','t', 0, 'ap','am','rfc','crp','tel','tlemov1','coor','g','dir','ref','ban','cuenta',1,100,'','' ,'','','','',1,'',1

select * from Persona
go

CREATE TABLE [dbo].[Suscripcion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[fecha] [varchar](max) NULL,
	[tipo] [varchar](max) NULL,
	idNivelRed [int] NULL,
	[usuarios] [int] NULL,
	[equipos] [int] NULL,
	[negocios] [int] NULL,
	[costo] [int] NULL,
	[fechaInicio] [varchar](10) NULL,
	[fechaVencimiento] [varchar](10) NULL,
	[Informacion] [varchar](max) NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Suscripcion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

INSERT  into Suscripcion
SELECT  '','','Kungio',null, '', 1 ,0,0,0,0,null,null, '',0,'',1


 update [dbo].[suscripcion]
 set  idsuscriptor=1
 where  id>1

 select *   FROM [dbo].[suscripcion]



CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[fecha] [varchar](10) NULL,

	[cuenta] [varchar](100) NULL,
	[contrasena] [varchar](50) NULL,
	[perfiles] [nvarchar](max) NULL,
	[grupos] [nvarchar](max) NULL,
	[privilegios] [nvarchar](max) NULL,

	[idEstacionTrabajo] [varchar](50) NULL,
	[tema] [varchar](30) NULL,
	[idIdioma] [int] NULL,

	[sesiones] [int] NULL,
	[intentos] [int] NULL,
	[expira] [smallint] NULL,
    [fechaVigencia] [varchar](10) NULL,

	[idUsuarioSuperior] [int] NULL,
	[idSuscriptor] [int] NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

  insert Usuario
  select '','','Administrador','','admin', '123','p','g','pril','et','azul',1,3,0,0,'',1,1,'',1

  SELECT TOP 1000 [id]
      ,[llave]
      ,[clave]
      ,[nombre]
      ,[fecha]
      ,[cuenta]
      ,[contrasena]
      ,[perfiles]
      ,[grupos]
      ,[privilegios]
      ,[idEstacionTrabajo]
      ,[tema]
      ,[idIdioma]
      ,[sesiones]
      ,[intentos]
      ,[expira]
      ,[fechaVigencia]
      ,[idUsuarioSuperior]
      ,[idSuscriptor]
      ,[fechaEstatus]
      ,[estatus]
  FROM [dbo].[Usuario]

  
 select *   FROM [dbo].[Usuario]



-----------------
--CREATE TABLE [dbo].[CuentaUsuario](
--	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
--	[Cuenta] [varchar](100) NULL,
--	[Contrasena] [varchar](250) NULL,
--	[IdEstacionTrabajo] [varchar](50) NULL,
--	[IdUsuarioSuperior] [int] NULL,
--	[FechaRegistro] [smalldatetime] NULL,
--	[FechaVigencia] [smalldatetime] NULL,
--	[FechaCambioEstatus] [smalldatetime] NULL,
--	[Tema] [varchar](30) NULL,
--	[IdEstatusUsuario] [smallint] NULL,
--	[Activo] [tinyint] NULL,
--	[IdSuscriptor] [int] NULL,
--	[Sesiones] [int] NULL,
--	[Intentos] [int] NULL,
--	[IdIdioma] [int] NULL,
--	[Perfiles] [nvarchar](max) NULL,
--	[Grupos] [nvarchar](max) NULL,
--	[Expira] [bit] NULL,
--	[Privilegios] [nvarchar](max) NULL,
-- CONSTRAINT [PK_CuentaUsuario] PRIMARY KEY NONCLUSTERED 
--(
--	[IdUsuario] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--GO


--ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_CentroCosto] FOREIGN KEY([IdCentroCosto])
--REFERENCES [dbo].[CentroCosto] ([IdCentroCosto])
--GO
--ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_CentroCosto]
--GO
--ALTER TABLE [dbo].[Configuracion]  WITH CHECK ADD  CONSTRAINT [FK_Configuracion_Aplicacion] FOREIGN KEY([IdAplicacion])
--REFERENCES [dbo].[Aplicacion] ([IdAplicacion])
--GO
--ALTER TABLE [dbo].[Configuracion] CHECK CONSTRAINT [FK_Configuracion_Aplicacion]
--GO


truncate table  NivelRed

INSERT  into NivelRed
SELECT  '','','Bronze',10,1,2,1,'',1

INSERT  into NivelRed
SELECT  '','','Platinum',20,2,2,1,'',1

INSERT  into NivelRed
SELECT  '','','Gold',30,3,2,1,'',1

INSERT  into NivelRed
SELECT  '','','Pure Gold',35,4,2,1,'',1

INSERT  into NivelRed
SELECT  '','','Pure Gold',35,4,2,1,'',1

update NivelRed
set clave=nombre

SELECT * FROM  NivelRed

SET IDENTITY_INSERT PERFIL On

SELECT  ' ---  PERFIL'
INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (1, '','','Adminsitrador', '',NULL, '', 1, '', 1)

INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (2, '','','Socio', '',NULL, '', 1, '', 1)

INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (3, '','','Arquitecto', '',NULL, '', 1, '', 1)

INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (4, '','','Impresor', '',NULL, '', 1, '', 1)
 
INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (5, '','','Fideicomiso', '',NULL, '', 1, '', 1)

INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (6, '','','Gestor', '',NULL, '', 1, '', 1)

INSERT [dbo].[PERFIL] (id, [llave], [Clave], [Nombre], [Pagina], [IdMenu], [Privilegios], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (7, '','','Operador', '',NULL, '', 1, '', 1)


SET IDENTITY_INSERT PERFIL OFF

SELECT * FROM  PERFIL

SET IDENTITY_INSERT Area ON 

SELECT  ' ---  [Area]'
INSERT Area (id, [llave], [Clave], [Nombre], [IdCentroCosto], [IdAreaSuperior], IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (1, '','','Geeral', NULL,NULL, 1, '', 1)

SET IDENTITY_INSERT Area OFF
SELECT * FROM  Area

---------------------


SET IDENTITY_INSERT Grupo ON 

SELECT  ' --- Grupo '
INSERT Grupo (id, [llave], [Clave], [Nombre], [Privilegios],  IdSuscriptor,[fechaEstatus], [estatus]) 
VALUES (1, '','','General', NULL, 1, '', 1)

SET IDENTITY_INSERT Grupo OFF

SELECT * FROM  Grupo


