/*
USE [DRP]
GO
*/
---  TABLAS

--use  DB_A5E6A3_arqfranciscoga
 --- use  DB_A72B95_drp

DROP TABLE [dbo].FlujoTrabajoDocumento
GO

DROP TABLE [dbo].Documento
GO

DROP TABLE [dbo].[FlujoTrabajoVariable]
GO

DROP TABLE [dbo].[FlujoTrabajoTareaEstatus]
GO

DROP TABLE [dbo].[FlujoTrabajoTarea]
GO

DROP TABLE [dbo].[FlujoTrabajoResponsableActividad]
GO
DROP TABLE [dbo].[FlujoTrabajoAsignacionActividad]
GO
DROP TABLE [dbo].[FlujoTrabajoInstancia]
GO

DROP TABLE [dbo].[FlujoTrabajoHistorial]
GO

DROP TABLE [dbo].[FlujoTrabajoEstatus]
GO

DROP TABLE [dbo].[FlujoTrabajoClasificacion]
GO



DROP TABLE [dbo].[FlujoTrabajoActividad]
GO

DROP TABLE [dbo].[FlujoTrabajo]
GO


---- creacion
CREATE TABLE [dbo].[Documento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](100) NULL,
	[llave] [nvarchar](max) NULL,
	[nombre] [nvarchar](250) NULL,
	[orden] [int]  NULL,
	[idActividad] [int]  NULL,
	[idAccion] [nvarchar](max) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlujoTrabajoDocumento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDocumento] [int],
	[idReferencia] [int],
	[idActividad] [int]  NULL,
	[idAccion] [nvarchar](max) NULL,
	[ruta] [nvarchar](max) NULL,
	[fechaEstatus] [smalldatetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_FlujoTrabajoDocumento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


Insert into Documento  select '','','CURP',1,0,'',1
Insert into Documento  select '','','Acta Nacimiento',2,0,'',1
Insert into Documento  select '','','Comprobante domicilio',3,0,'',1
Insert into Documento  select '','','Predial',4,0,'',1

Insert into FlujoTrabajoDocumento select 1,1,NULL,NULL,'','',1


DROP  PROCEDURE [dbo].[ConsultarDocumentosFlujoTrabajo] 
GO
CREATE PROCEDURE   [dbo].[ConsultarDocumentosFlujoTrabajo]
(
	@Ideferencia  int =0
)
AS
	SELECT isnull(fd.id,0) as id,d.id as idDocumento, clave,nombre,fd.idActividad,fd.idAccion, ruta, fechaEstatus,D.estatus FROM Documento  d
	LEFT  OUTER JOIN  FlujoTrabajoDocumento  fd ON fd.idDocumento=d.id AND fd.idreferencia=@Ideferencia 
	WHERE   d.estatus=1 
	ORDER BY orden

GO

SELECT * FROM Documento
SELECT * FROM FlujoTrabajoDocumento  
delete FROM FlujoTrabajoDocumento  where  id>1
exec ConsultarDocumentosFlujoTrabajo 1
	SELECT isnull(fd.id,0) as id ,d.id as idDocumento, clave,nombre,fd.idActividad,fd.idAccion, ruta, fechaEstatus,D.estatus FROM Documento  d
	LEFT  OUTER JOIN  FlujoTrabajoDocumento  fd ON fd.idDocumento=d.id  AND fd.idreferencia=1
	WHERE   d.estatus=1   
	ORDER BY orden

exec ConsultarDocumentosFlujoTrabajo 1

go

CREATE TABLE [dbo].[FTAvanzarActividad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](100) NULL,
	[identificador] [nvarchar](250) NULL,
	[idAccion] [nvarchar](max) NULL,
	[idTarea] [int] NULL,
	[claveEstatus] [nvarchar](250) NULL,
	[parametros]  [nvarchar](max) NULL,
	[variables]  [nvarchar](max) NULL,
	[llave] [nvarchar](max) NULL,
 CONSTRAINT [PK_FTAvanzarActividad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlujoTrabajo](
	[IdFlujoTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[NumeroVersion] [int] NULL,
	[Clave] [nvarchar](100) NULL,
	[Nombre] [nvarchar](250) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTerninacion] [smalldatetime] NULL,
	[IdFlujoTrabajoAnterior] [int] NULL,
	[IdSuscriptor] [int] NULL,
	[IdPlaneacionCaptura] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajo] PRIMARY KEY CLUSTERED 
(
	[IdFlujoTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[FlujoTrabajoActividad](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[Clave] [nvarchar](20) NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Tipo] [nvarchar](30) NULL,
	[Comando] [nvarchar](max) NULL,
	[Parametros] [nvarchar](max) NULL,
	[Fecha] [smalldatetime] NULL,
	TiempoLimite INT,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoActividad] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlujoTrabajoClasificacion](
	[IdFlujoTrabajoClasificacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NULL,
	[Orden] [int] NULL,
	[IdFlujoTrabajo] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoClasificacion] PRIMARY KEY CLUSTERED 
(
	[IdFlujoTrabajoClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[FlujoTrabajoEstatus](
	[IdEstatus] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[Clave] [nvarchar](20) NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoEstatus] PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlujoTrabajoTarea](
	[IdTarea] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdFlujoTrabajoClasificacion] [int] NULL,
	[Orden] [int] NULL,
	[IdActividad] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoTarea] PRIMARY KEY CLUSTERED 
(
	[IdTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[FlujoTrabajoTareaEstatus](
	[IdTareaEstatus] [int] IDENTITY(1,1) NOT NULL,
	[IdTarea] [int] NOT NULL,
	[FlujoBasico] [bit] NULL,
	[Accion] [varchar](10) NULL,
	[Variable] [nvarchar](250) NULL,
	[Operador] [nvarchar](10) NULL,
	[Valor] [nvarchar](250) NULL,
	[IdEstatus] [int] NULL,
	[IdTareaSiguiente] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoTareaEstatus] PRIMARY KEY CLUSTERED 
(
	[IdTareaEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
CREATE TABLE [dbo].[FlujoTrabajoHistorial](
	[IdHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdTarea] [int] NULL,
	[IdActividad] [int] NULL,
	[IdEstatus] [int] NULL,
	[IdInstancia] [int] NULL,
	[FechaRegistro] [smalldatetime] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTernimacion] [smalldatetime] NULL,
	[Identificador] [nvarchar](150) NULL,
	[Referencia] [nvarchar](150) NULL,
	[Observacion] [nvarchar](max) NULL,
	[IdUsuario] [nvarchar](100) NULL,
	[IdPerfil] [nvarchar](100) NULL,
	[IdEquipo] [nvarchar](100) NULL,
	[Resultado] [nvarchar](max) NULL,
	[TiempoActividad] [int] NULL,
	[IdEstatusTarea] [nvarchar](20) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoHistorial] PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[FlujoTrabajoInstancia](
	[IdInstancia] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdTarea] [int] NULL,
	[IdActividad] [int] NULL,
	[IdEstatus] [int] NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaTernimacion] [smalldatetime] NULL,
	[Identificador] [nvarchar](150) NULL,

	[Nombre] [nvarchar](250) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Clasificacion] [nvarchar](max) NULL,
	[Importe] decimal(16,2) NULL,
	[Numero] int NULL,

	[Referencia] [nvarchar](150) NULL,
	[Variables] [nvarchar](max) NULL,
	[IdUsuario] [nvarchar](100) NULL,
	[IdPerfil] [nvarchar](100) NULL,
	[IdEquipo] [nvarchar](100) NULL,
	[IdEstatusTarea] [nvarchar](20) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoInstancia] PRIMARY KEY CLUSTERED 
(
	[IdInstancia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[FlujoTrabajoResponsableActividad](
	[IdResponsableActividad] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdTarea] [int] NULL,
	[Tipo] [varchar](max) NULL,
	[IdResponsable] [nvarchar](max) NULL,
	[IdResponsableTexto] [nvarchar](max) NULL,
	[Principal] [bit] NULL,
	[Activo] [bit] NULL,

 CONSTRAINT [PK_FlujoTrabajoResponsableActividad] PRIMARY KEY CLUSTERED 
(
	[IdResponsableActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[FlujoTrabajoAsignacionActividad](
	[IdAsignacionActividad] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdTarea] [int] NULL,
	[IdInstancia] [int] NULL,
	[Tipo] [varchar](max) NULL,
	[IdResponsable] [nvarchar](max) NULL,
	[IdResponsableTexto] [nvarchar](max) NULL,
	[FechaAsignacion] [smalldatetime] NULL,
	[IdUsuarioAsigno] [nvarchar](100) NULL,
	[Activo] [bit] NULL,

 CONSTRAINT [PK_FlujoTrabajoAsignacionActividad] PRIMARY KEY CLUSTERED 
(
	[IdAsignacionActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO


CREATE TABLE [dbo].[FlujoTrabajoVariable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int]  NOT NULL,
    [IdInstancia]  [int] NOT NULL,
	[Variable] [nvarchar](max) NULL,
	[Valor] [nvarchar](max) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_FlujoTrabajoVariable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



---   PROCEDIMIENTOS

DROP  FUNCTION [dbo].ObtenerListaPorNombreValorEspecial
GO
create  FUNCTION [dbo].ObtenerListaPorNombreValorEspecial ( @lista VARCHAR(MAX), @separadorVariable as CHAR(1)=':',@separadorLista as CHAR(1)=',')
RETURNS
@returnList TABLE (Variable [nvarchar] (max) , Valor [nvarchar] (max)  )
AS
BEGIN
	 DECLARE  
			 @elemento NVARCHAR(max),
			 @name NVARCHAR(max),
			 @valor NVARCHAR(max),
			 @pos INT,
			 @pos2 INT
	 --- WHILE CHARINDEX(@separadorLista, @lista) > 0
	 WHILE LEN(@lista) > 0
	 BEGIN
		  SET @pos  = CHARINDEX(@separadorLista, @lista)  
		  IF @pos>0
		  BEGIN
			  SET @elemento = rtrim(ltrim(SUBSTRING(@lista, 1, @pos-1)))
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
			  SET @lista = SUBSTRING(@lista, @pos+1, LEN(@lista)-@pos)
		   END
		   ELSE
		   BEGIN
		      SET @elemento = @lista
			  SET @lista = ''
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
		   END 
	 END
	 RETURN
END
GO

DROP  FUNCTION [dbo].ObtenerListaPorNombreValor 
GO
create  FUNCTION [dbo].ObtenerListaPorNombreValor ( @lista VARCHAR(MAX))
RETURNS
@returnList TABLE (Variable [nvarchar] (max) , Valor [nvarchar] (max)  )
AS
BEGIN
	 DECLARE  
	         @separadorVariable as CHAR(1)=':',
			 @separadorLista as CHAR(1)=',',
			 @elemento NVARCHAR(max),
			 @name NVARCHAR(max),
			 @valor NVARCHAR(max),
			 @pos INT,
			 @pos2 INT
	 --- WHILE CHARINDEX(@separadorLista, @lista) > 0
	 WHILE LEN(@lista) > 0
	 BEGIN
		  SET @pos  = CHARINDEX(@separadorLista, @lista)  
		  IF @pos>0
		  BEGIN
			  SET @elemento = rtrim(ltrim(SUBSTRING(@lista, 1, @pos-1)))
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
			  SET @lista = SUBSTRING(@lista, @pos+1, LEN(@lista)-@pos)
		   END
		   ELSE
		   BEGIN
		      SET @elemento = @lista
			  SET @lista = ''
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
		   END 
	 END
	 RETURN
END
GO
select * FROM  dbo.ObtenerListaPorNombreValor ('nombre:fga,importe:10, refrencia : 999' 
select * FROM  dbo.ObtenerListaPorNombreValorEspecial ('nombre=fga,importe:10, refrencia = 999','=',',') 


DROP  FUNCTION [dbo].[ObtenerFlujoTrabajo] 
GO
create  FUNCTION [dbo].[ObtenerFlujoTrabajo] (@Clave nvarchar(100),@NumeroVersion int=0 )  
RETURNS int  
WITH EXECUTE AS CALLER  
AS  
BEGIN  
    DECLARE @IdFlujoTrabajo int;  
	IF @NumeroVersion=0
		SELECT  @IdFlujoTrabajo=ISNULL(MAX(IdFlujoTrabajo),0)  FROM   FlujoTrabajo with (NOLOCK) WHERE  Clave=@Clave AND Activo=1
	ELSE
		SELECT  @IdFlujoTrabajo=ISNULL(MAX(IdFlujoTrabajo),0)  FROM   FlujoTrabajo with (NOLOCK) WHERE  Clave=@Clave AND NumeroVersion=@NumeroVersion AND Activo=1

    RETURN(@IdFlujoTrabajo);  
END
GO

DROP  FUNCTION [dbo].[ObtenerLista] 
GO
create  FUNCTION [dbo].[ObtenerLista] ( @lista VARCHAR(MAX), @separador as CHAR(1))
RETURNS
@returnList TABLE (elemento [nvarchar] (100))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(@separador, @lista) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(@separador, @lista)  
  SELECT @name = rtrim(ltrim(SUBSTRING(@lista, 1, @pos-1)))
  
  INSERT INTO @returnList 
  SELECT @name

  SELECT @lista = SUBSTRING(@lista, @pos+1, LEN(@lista)-@pos)
 END

 INSERT INTO @returnList
 SELECT @lista

 RETURN
END

GO
select * FROM  dbo.ObtenerLista ('@IdPerfil,2',',') 


DROP  PROCEDURE [dbo].[InsertarFlujoTrabajoHistorial] 
GO
CREATE PROCEDURE   [dbo].[InsertarFlujoTrabajoHistorial]
(
	@IdFlujoTrabajo  int =0,
	@IdTarea  int =0,
	@IdActividad  int =0,
	@IdEstatus  int =0,
	@IdInstancia int =0,
	@FechaRegistro SMALLDATETIME ,
	@FechaInicio SMALLDATETIME ,
	@FechaTernimacion SMALLDATETIME ,
    @Identificador nvarchar(150),
	@Referencia nvarchar(150)='' ,
	@Observacion nvarchar (max)='',
	@IdUsuario nvarchar (100)='' ,
	@IdPerfil nvarchar (100)='' ,
	@IdEquipo nvarchar(100)='',
	@Resultado	  nvarchar (max)=''  ,

	@TiempoActividad int =0,

	@IdEstatusTarea nvarchar(20)='',
	@Activo smallint   

)
AS


DECLARE  @IdHistorialFlujoTrabajo int
			--- Inserta  Historial
		INSERT   FlujoTrabajoHistorial WITH (ROWLOCK)
			(
			IdFlujoTrabajo  ,
			IdTarea,
			IdActividad ,
			IdEstatus  ,
			IdInstancia ,
			FechaRegistro,
			FechaInicio  ,
			FechaTernimacion  ,
			Identificador  ,
			Referencia ,
			Observacion,
			IdUsuario  ,
			IdPerfil ,
			IdEquipo ,
			Resultado	   ,
			TiempoActividad ,
			IdEstatusTarea ,
			Activo   
		)
		VALUES
		(

			@IdFlujoTrabajo  ,
			@IdTarea,
			@IdActividad ,
			@IdEstatus  ,
			@IdInstancia ,
			@FechaRegistro,
			@FechaInicio  ,
			@FechaTernimacion  ,
			@Identificador  ,
			@Referencia ,
			@Observacion,
			@IdUsuario  ,
			@IdPerfil ,
			@IdEquipo ,
			@Resultado  ,
			@TiempoActividad ,
			@IdEstatusTarea ,
			@Activo   
		)
		SET @IdHistorialFlujoTrabajo=@@IDENTITY
	  RETURN @IdHistorialFlujoTrabajo
GO


DROP  PROCEDURE [dbo].[InsertarFlujoTrabajoInstancia] 
GO
CREATE PROCEDURE   [dbo].[InsertarFlujoTrabajoInstancia]

(
	@IdFlujoTrabajo  int =0,
	@IdTarea  int =0,
	@IdActividad  int =0,
	@IdEstatus  int =0,
	@FechaInicio SMALLDATETIME ,
	@FechaTernimacion SMALLDATETIME ,
    @Identificador nvarchar(150),

	@Nombre nvarchar (250) ,
	@Descripcion nvarchar (max) ,
	@Clasificacion nvarchar(max) ,
	@Importe decimal(16,2) ,
	@Numero  int ,

	@Referencia nvarchar(150)='' ,
	@Variables nvarchar (max)='',
	@IdUsuario nvarchar (100)='' ,
	@IdPerfil nvarchar (100)='' ,
	@IdEquipo nvarchar(100)='',
	@IdEstatusTarea nvarchar(20)='',
	@Activo smallint   

)
AS
DECLARE  @IdInstancia int
			--- Inserta  Historial
		INSERT   FlujoTrabajoInstancia WITH (ROWLOCK)
			(
			IdFlujoTrabajo  ,
			IdTarea  ,
			IdActividad ,
			IdEstatus ,
			FechaInicio  ,
			FechaTernimacion  ,
			Identificador  ,

			Nombre ,
			Descripcion ,
			Clasificacion ,
			Importe,
			Numero  ,

			Referencia ,
			Variables,
			IdUsuario  ,
			IdPerfil ,
			IdEquipo ,
			IdEstatusTarea ,
			Activo   
		)
		VALUES
		(

			@IdFlujoTrabajo  ,
			@IdTarea,
			@IdActividad ,
			@IdEstatus ,
			@FechaInicio  ,
			@FechaTernimacion  ,
			@Identificador  ,

			@Nombre ,
			@Descripcion ,
			@Clasificacion ,
			@Importe,
			@Numero  ,

			@Referencia ,
			@Variables ,
			@IdUsuario  ,
			@IdPerfil ,
			@IdEquipo ,
			@IdEstatusTarea ,
			@Activo   
		)
		SET @IdInstancia=@@IDENTITY
	  RETURN @IdInstancia
go

DROP PROCEDURE EvaluarCondicionFlujo
GO
CREATE PROCEDURE EvaluarCondicionFlujo
 @IdFlujoTrabajo int,
 @IdInstancia INT=0
as
DECLARE tables_cursor CURSOR  
   FOR  
	SELECT te.Valor, te.Operador, v.Valor,te.IdEstatus,e.Clave FROM  FlujoTrabajoInstancia I
	LEFT OUTER  JOIN  FlujoTrabajoVariable v ON v.IdInstancia= @IdInstancia
	LEFT OUTER  JOIN FlujoTrabajoTareaEstatus  te ON te.IdTarea=I.IdTarea
	LEFT OUTER  JOIN  FlujoTrabajoEstatus e  ON e.IdEstatus=te.IdEstatus
	WHERE  I.IdInstancia=@IdInstancia   AND te.Variable=v.Variable   
   
     
OPEN tables_cursor;  
DECLARE @ValorTarea nvarchar(max);
DECLARE @ValorVariable nvarchar(max);  
DECLARE @Operador nvarchar(10);  
DECLARE @IdEstatus int;  
DECLARE @Clave nvarchar(20);  
DECLARE @ClaveSeleccionado nvarchar(20)='';  
FETCH NEXT FROM tables_cursor INTO @ValorTarea, @Operador,@ValorVariable,@IdEstatus,@Clave;  
WHILE (@@FETCH_STATUS <> -1)  
BEGIN;  
   PRINT @ValorVariable
   PRINT @ValorTarea
   PRINT @Operador
   PRINT @Clave
   IF ( NOT @Operador IS NULL AND   RTRIM(LTRIM(@Operador)) <> '' )   AND ( NOT @ValorTarea IS NULL AND   RTRIM(LTRIM(@ValorTarea)) <> ''   )
   BEGIN
	   IF RTRIM(LTRIM(@Operador)) = '='  AND @ValorVariable = @ValorTarea
	   BEGIN
			PRINT 'Operador = ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '>'  AND @ValorVariable > @ValorTarea
	   BEGIN
			PRINT 'Operador > ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '>='  AND @ValorVariable >= @ValorTarea
	   BEGIN
			PRINT 'Operador >= ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '<'  AND @ValorVariable < @ValorTarea
	   BEGIN
			PRINT 'Operador < ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '<='  AND @ValorVariable <= @ValorTarea
	   BEGIN
			PRINT 'Operador <= ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '<>'  AND @ValorVariable <> @ValorTarea
	   BEGIN
			PRINT 'Operador <> ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = 'like'  AND @ValorVariable like  '%'+@ValorTarea+'%'
	   BEGIN
			PRINT 'Operador like ';  
			SET @ClaveSeleccionado=@Clave
	   END
	   IF RTRIM(LTRIM(@Operador)) = '!like'  AND @ValorVariable  not like  '%'+@ValorTarea+'%'
	   BEGIN
			PRINT 'Operador !like ';  
			SET @ClaveSeleccionado=@Clave
	   END
   END
   FETCH NEXT FROM tables_cursor INTO  @ValorTarea, @Operador,@ValorVariable,@IdEstatus,@Clave;  
END;  
PRINT '-----Estatus  seleccionado POR CONDICION ';  
PRINT '@ClavEstatus : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @ClaveSeleccionado),'') +'  @@IdEstatus : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdEstatus),0)  

CLOSE tables_cursor;  
DEALLOCATE tables_cursor;  

RETURN @ClaveSeleccionado
GO  


DROP PROCEDURE [dbo].[AsignarResponsable]
GO

CREATE  PROCEDURE   [dbo].[AsignarResponsable]
    @IdFlujoTrabajo int=0,
	@IdInstancia int=0,
    @Identificador nvarchar(150) ,
	@IdTarea INT,
	@TipoAsignacion varchar(20), --- Usuario , Perfil, IdArea ,IdArea, IdPuesto
	@IdResponsable nvarchar (150) ,
	@IdUsuarioAsigno nvarchar (100) ,
	@IdResponsableTexto nvarchar (150) 
AS

IF ( @IdInstancia >0  OR @IdInstancia  IS NOT  NULL ) AND  ( @IdTarea>0  OR @IdTarea IS NOT  NULL   )
BEGIN
	INSERT   FlujoTrabajoAsignacionActividad WITH (ROWLOCK)
	SELECT @IdFlujoTrabajo,@IdTarea,@IdInstancia,@TipoAsignacion ,@IdResponsable,getdate(),@IdUsuarioAsigno,1,@IdResponsableTexto
END
GO



ALTER PROCEDURE  [dbo].[AvanzarActividad]
    @ClaveFlujo nvarchar(100) = NULL,
    @Identificador nvarchar(150),
	@IdAccion nvarchar(20)='',
	@IdTarea INT=0 ,
	@ClavEstatus  nvarchar (20)= NULL ,
	@Parametros nvarchar (max)='',
	@Variables nvarchar (max)=''

	--,@TipoAsignacion varchar(20)=NULL, --- Usuario , Perfil, IdArea ,IdArea, IdPuesto
	--@IdResponsable nvarchar (150) =NULL,
	--@IdResponsableTexto nvarchar (150) =NULL
AS
DECLARE	 @IdFlujoTrabajo INT=0 , @NumeroVersion int=0 
DECLARE  @IdInstancia INT=0,  @IdHistorial INT=0 
DECLARE  @IdActividad INT =0, 	@IdEstatus INT =0
DECLARE  @IdTareaSig INT=0 , @IdActividadSig INT =0, 	@IdEstatusSig INT =0
DECLARE  @IdEstatusTareaUlt nvarchar(20)='' , 	@IdEstatusTarea nvarchar(20)='0', @Activo smallint  =1, @TiempoActividad int =0
   
DECLARE @AccionTarea  nvarchar(10)='', @FechaRegistro smalldatetime=GETDATE()
DECLARE
	@FechaInicio smalldatetime = NULL,
	@FechaTernimacion smalldatetime= NULL ,
	@Observacion nvarchar (max)='',
	@Resultado	  nvarchar (max)=''  ,
	@Nombre nvarchar (250) ='',
	@Descripcion nvarchar (max) ='',
	@Clasificacion nvarchar(max) ='',
	@Importe decimal(16,2) = NULL ,
	@Numero  int  =NULL ,
	@Referencia nvarchar(150)='',
	@IdUsuario nvarchar (100)='' ,
	@IdPerfil nvarchar (100)='' ,
	@IdEquipo nvarchar(100)=''
SET NOCOUNT ON
IF @Parametros IS NOT  NULL  AND @Parametros<>''
BEGIN
		SELECT  @FechaInicio=Convert(date,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@FechaInicio' AND valor<>''

		SELECT  @FechaTernimacion=Convert(date,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@FechaTernimacion' AND valor<>''

		SELECT  @Observacion=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Observacion' 

		SELECT  @Resultado=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Resultado' 

		SELECT  @Nombre=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Nombre' 

		SELECT  @Descripcion=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Descripcion'
	
		SELECT  @Clasificacion=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Clasificacion' 

		SELECT  @Referencia=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Referencia'

		SELECT  @Numero=Convert(int,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Numero' 

		SELECT  @Importe=Convert(decimal(16,2),valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@Importe'  

		SELECT  @IdUsuario=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@IdUsuario'  

		SELECT  @IdPerfil=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@IdPerfil'  

		SELECT  @IdEquipo=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(Variable)='@IdEquipo'  

		PRINT '----------------PARAMETROS---------------- '
		PRINT ' @Identificador: ' +  @Identificador
		PRINT ' FechaInicio:' + ISNULL(CONVERT ( VARCHAR(MAX), @FechaInicio),'')  +' , FechaTernimacion: ' + ISNULL(CONVERT ( VARCHAR(MAX), @FechaTernimacion),'')
		PRINT ' @IdUsuario: ' + @IdUsuario + ' , @IdPerfil : ' + @IdPerfil  + ', @IdEquipo: ' +  @IdEquipo +' , @Observacion: ' + @Observacion +' , @@Resultado: ' + @Resultado
		PRINT ' @Nombre: ' +  @Nombre  + ' , @Descripcion: ' +   @Descripcion   + ', @Clasificacion: ' +    @Clasificacion  + ' , @Referencia: ' +    @Referencia  
		PRINT ' @Importe: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @Importe),'')    + ' , @Numero: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @Numero),0 )  

END
IF @Identificador IS NOT  NULL  AND @Identificador<>''
BEGIN
	PRINT  '----------------OBTENER INSTANCIA----------------'
	SELECT  @IdFlujoTrabajo =ISNULL(F.IdFlujoTrabajo,0),@IdInstancia=ISNULL(I.IdInstancia,0) 
	FROM  FlujoTrabajo  F WITH (NOLOCK) 
	LEFT  OUTER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo  =I.IdFlujoTrabajo
	WHERE I.Identificador=@Identificador AND  F.Clave=@ClaveFlujo
	PRINT 'INSTANCIA : @IdFlujoTrabajo : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdFlujoTrabajo),0)    + ' , @IdInstancia: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdInstancia),0 )  + ' , @IdTarea: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdTarea),0 )  

	IF  @IdInstancia= 0
	BEGIN

		SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@ClaveFlujo,@NumeroVersion)  

		PRINT ' ------NO HAY INSTANCIA-----------OBTENER  TAREA   INICIAL DEL FLUJO BASICO--------------' 
		SELECT TOP 1  @IdTarea=ISNULL(AE.IdTarea,0) , @IdActividad=ISNULL(IdActividad,0) 
		FROM FlujoTrabajoTarea A WITH (NOLOCK) 
		LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE ON AE.IdTarea=A.IdTarea
		WHERE   IdFlujoTrabajo=@IdFlujoTrabajo AND   FlujoBasico =1  
		ORDER BY Orden 

		PRINT ' @IdFlujoTrabajo : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdFlujoTrabajo),0)    + ' , @IdTarea: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdTarea),0 )  + ' , @IdActividad: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdActividad),0 )  

		IF  NOT @FechaInicio  IS NULL OR @FechaInicio <>'' 
			SET  @FechaRegistro=@FechaInicio

		SET @IdInstancia=0
			exec @IdInstancia=InsertarFlujoTrabajoInstancia
			@IdFlujoTrabajo ,@IdTarea ,@IdActividad ,null ,
			@FechaInicio  ,	@FechaTernimacion  ,
			@Identificador,@Nombre,@Descripcion,@Clasificacion,	@Importe, @Numero,@Referencia , @Variables,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,
			@IdEstatusTarea , @Activo 
		PRINT 'INSERT: @IdInstancia : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdInstancia),0)   
		exec @IdHistorial=InsertarFlujoTrabajoHistorial
			@IdFlujoTrabajo ,@IdTarea ,@IdActividad ,null ,
			@IdInstancia ,
			@FechaRegistro,@FechaInicio  ,	@FechaTernimacion  ,
			@Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
			0 ,	@IdEstatusTarea ,	@Activo 
		PRINT 'INSERT: @IdHistorial : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdHistorial),0)   
		IF @Variables IS NOT  NULL  AND @Variables<>''
		BEGIN
			PRINT 'inserta variables:' +@Variables
			INSERT  INTO FlujoTrabajoVariable
			SELECT @IdFlujoTrabajo,@IdInstancia,* ,1 FROM  dbo.ObtenerListaPorNombreValor (@Variables) 
		END
	END

	IF  @IdInstancia> 0 AND ( @IdAccion='INICIAR')   --- or  @IdAccion='TERMINAR'
	BEGIN
		PRINT ' ---------INICIAR    --------'
 		---  obtiene  fechas INICIAL  no se  proporciona
		IF  @FechaInicio IS NULL OR @FechaInicio ='' 
			SET @FechaInicio=GETDATE()
		SET @IdEstatusTarea='1'

		--- ACTUALZAR TAREA CO ESTATUS   INICIADA
		IF  @IdTarea= 0 OR @IdTarea IS NULL
		BEGIN
					--- ACTUALZAR INSTANCIA TAREA EN INICIADA
			UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
			SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=@FechaInicio
			WHERE IdInstancia=@IdInstancia 

			UPDATE FlujoTrabajoHistorial WITH (ROWLOCK)
			SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=@FechaInicio
			WHERE IdInstancia=@IdInstancia AND  ( IdEstatusTarea  IS NULl OR IdEstatusTarea=0 )
		END
		ELSE
		BEGIN
			--- ACTUALZAR INSTANCIA TAREA EN INICIADA
			UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
			SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=@FechaInicio
			WHERE IdInstancia=@IdInstancia AND IdTarea=@IdTarea 

			UPDATE FlujoTrabajoHistorial WITH (ROWLOCK)
			SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=@FechaInicio
			WHERE IdInstancia=@IdInstancia AND IdTarea=@IdTarea AND   ( IdEstatusTarea  IS NULl OR IdEstatusTarea=0 )
		END

		PRINT 'UPDATE: @IdEstatusTarea : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdEstatusTarea),0)   +  ' @FechaInicio : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @FechaInicio),0)  

		--IF ( @TipoAsignacion IS NOT NULL AND @TipoAsignacion<>'' )  AND ( @IdResponsable IS NOT NULL AND @IdResponsable<>'') AND  @IdTarea IS NOT NULL
		--BEGIN
		--	SET @IdEstatusTarea='2'
		--	EXEC AsignarResponsable  @IdFlujoTrabajo,@IdInstancia,@Identificador,@IdTarea,@TipoAsignacion,@IdResponsable,@IdUsuario,@IdResponsableTexto
		--END

	END
	IF @IdInstancia>= 0 AND @IdAccion='MODIFICAR'  
	BEGIN
		UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
		SET Nombre=@Nombre, Importe=@Importe, Referencia=@Referencia, Variables=@Variables
		WHERE IdInstancia=@IdInstancia 
	END
	IF @IdInstancia>= 0 AND @IdAccion='TERMINAR'  
	BEGIN
		PRINT ' -------TERMINAR  -----------'
		--IF (@IdTarea IS NULL OR @IdTarea= 0	) 
		--	SET @IdTarea=@IdTareaSig 

		SET @IdEstatusTarea='3'	
			
 		---  obtiene  fechas FINAL  no se  proporciona
		IF ( @FechaTernimacion IS NULL OR @FechaTernimacion ='' )
			SET @FechaTernimacion=GETDATE()

		PRINT 'UPDATE: @IdEstatusTarea : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdEstatusTarea),0)   +  ' @FechaTernimacion : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @FechaTernimacion),0)  

		DECLARE @medida  varchar(2)='dd'

		IF  @TiempoActividad=0
			SET @TiempoActividad=1

		--  Actualziar  estatus  de actividad  actual
		IF (	@ClavEstatus IS NOT  NULL AND @ClavEstatus<>''  ) 
		BEGIN
			PRINT '------------OBTENER ESTATTUS PROPORCIONADO----------------'
			IF  @IdTarea= 0 OR @IdTarea IS NULL
				SELECT TOP 1  @IdTarea=T.IdTarea, @IdActividad=ISNULL(T.IdActividad,0) ,	@IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0) ,@AccionTarea=Accion
				FROM FlujoTrabajoTarea  T WITH (NOLOCK) 
				LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK) ON AE.IdTarea=T.IdTarea	
				LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
				WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo AND  ( Clave=@ClavEstatus  )   AND T.ACTIVO= 1
			ELSE
				SELECT TOP 1  @IdTarea=T.IdTarea, @IdActividad=ISNULL(T.IdActividad,0) ,	@IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0) ,@AccionTarea=Accion
				FROM FlujoTrabajoTarea  T WITH (NOLOCK) 
				LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK) ON AE.IdTarea=T.IdTarea	
				LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
				WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo AND T.IdTarea=@IdTarea AND ( Clave=@ClavEstatus  )   AND T.ACTIVO= 1
		END
		ELSE
		BEGIN
			IF (@IdTareaSig=0 )
			BEGIN
				PRINT '------------OBTENER  ESTATUS EVALUANDO CONDICIONES----------------'
				EXEC @ClavEstatus= EvaluarCondicionFlujo @IdFlujoTrabajo, @IdInstancia
				IF (@ClavEstatus IS NOT NULL /*AND  @IdEstatusSig<> ''	*/ ) 
				BEGIN
 					SELECT TOP 1 @IdTarea=T.IdTarea, @IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0)  ,@AccionTarea=Accion,  @ClavEstatus=E.Clave
					FROM FlujoTrabajoTarea T WITH (NOLOCK) 
					LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE WITH (NOLOCK)  ON AE.IdTarea=T.IdTarea
					LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
					WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo AND  T.IdTarea=@IdTarea   AND  ( Clave=@ClavEstatus  )   AND AE.ACTIVO= 1
				END
			END
			IF (@IdTareaSig=0 )
				BEGIN
					PRINT '------------OBTENER SIGUIENTE TAREA  Y  ESTATUS SIGUIENTE  DEL FLUJO BASICO  DE LA TAREA  ACTUAL ----------------'
					IF  @IdTarea= 0 OR @IdTarea IS NULL
						SELECT TOP 1  @IdTarea=T.IdTarea, @IdActividad=ISNULL(T.IdActividad,0) ,	@IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0) ,@AccionTarea=Accion, @ClavEstatus=E.Clave
						FROM  FlujoTrabajoHistorial H
						LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=H.IdTarea
						LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE WITH (NOLOCK)  ON AE.IdTarea=T.IdTarea
						LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
						WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo  AND H.IdInstancia=@IdInstancia AND   FlujoBasico in (1 ) AND AE.ACTIVO= 1 AND H.IdEstatusTarea IN ('1')
						ORDER BY Orden 
					ELSE
						SELECT TOP 1  @IdTarea=T.IdTarea, @IdActividad=ISNULL(T.IdActividad,0) ,	@IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0) ,@AccionTarea=Accion, @ClavEstatus=E.Clave
						FROM  FlujoTrabajoHistorial H
						LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=H.IdTarea
						LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE WITH (NOLOCK)  ON AE.IdTarea=T.IdTarea
						LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
						WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo  AND H.IdInstancia=@IdInstancia AND T.IdTarea=@IdTarea  AND   FlujoBasico in (1 ) AND AE.ACTIVO= 1 AND H.IdEstatusTarea IN ('1')
						ORDER BY Orden 

			END
		END
		PRINT '@ClavEstatus : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @ClavEstatus),'')  
		PRINT 'AREA SIGUIENTE  :  @IdTarea' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdTarea),0) + ' @IdActividad' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdActividad),0)  + + ' @IdTareaSig' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdTareaSig),0)  + ' @IdEstatusSig' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdEstatusSig),0)  + ' @AccionTarea' +  ISNULL(CONVERT ( VARCHAR(MAX), @AccionTarea),0) 
		PRINT  ' INSERTAR ACTIVIDADES SIGUIENTES  POR ESTATUS   '	


		PRINT  ' UPDATE  ESTATUS DETAREA  EN  INSTANCIA'		
		---  ACTUALIZAR   EL ULTIMO ESTATUS  EN  INSTANCIA 
		UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
		SET  IdTarea= @IdTarea,IdActividad =@IdActividad , IdEstatusTarea=@IdEstatusTarea, FechaTernimacion=@FechaTernimacion
		,IdEstatus=@IdEstatusSig
		WHERE IdInstancia=@IdInstancia

		PRINT  ' UPDATE  ESTATUS DE TAREA HISTORIAL'	
		UPDATE H
		SET H.IdEstatus=E.IdEstatus  , H.FechaTernimacion=	@FechaTernimacion ,  H.IdEstatusTarea=@IdEstatusTarea, 
		IdUsuario= @IdUsuario ,IdPerfil=@IdPerfil ,IdEquipo=@IdEquipo, Observacion=@Observacion, Resultado=@Resultado,
		H.TiempoActividad= CASE  @medida 
			WHEN 'mi' THEN IIF(DATEDIFF (mi, H.FechaRegistro,@FechaTernimacion )=0,1,  DATEDIFF (mi, H.FechaRegistro,@FechaTernimacion ))
			WHEN 'hh' THEN IIF(DATEDIFF (hh, H.FechaRegistro,@FechaTernimacion )=0,1,  DATEDIFF (hh, H.FechaRegistro,@FechaTernimacion ))
			WHEN 'dd' THEN IIF(DATEDIFF (dd, H.FechaRegistro,@FechaTernimacion )=0,1,  DATEDIFF (dd, H.FechaRegistro,@FechaTernimacion ))
		END 
		FROM FlujoTrabajoHistorial H
		LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON H.IdTarea=T.IdTarea
		LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK) ON AE.IdTarea=T.IdTarea	
		LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
		WHERE   H.IdFlujoTrabajo=@IdFlujoTrabajo AND  H.IdInstancia=@IdInstancia AND H.IdTarea=@IdTarea  AND  ( Clave=@ClavEstatus  )   AND T.ACTIVO= 1  AND H.IdEstatusTarea IN ('1')
		
		--- INSERTAR  SIGUIENTE  TAREA
		IF(   ( NOT @AccionTarea='TERMINA' AND  NOT @AccionTarea='CONTINUA' ) AND @IdTareaSig>0  )
		BEGIN
			IF  NOT EXISTS (
			SELECT * from  FlujoTrabajoHistorial WHERE  IdInstancia=@IdInstancia AND  IdEstatusTarea IN ('0','1')  AND IdTarea  iN  (
			SELECT DISTINCT ISNULL(AE.IdTareaSiguiente,0)
			FROM FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK)
			LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
			LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=AE.IdTareaSiguiente
			WHERE    T.IdFlujoTrabajo=@IdFlujoTrabajo AND  ( Clave=@ClavEstatus )   AND T.ACTIVO= 1
			))
				INSERT  INTO FlujoTrabajoHistorial
				SELECT DISTINCT @IdFlujoTrabajo,ISNULL(AE.IdTareaSiguiente,0), ISNULL(T.IdActividad,0),NULL, @IdInstancia , @FechaRegistro, NULL , NULL, @Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
				0 ,	0 ,	@Activo 
				FROM FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK)
				LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
				LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=AE.IdTareaSiguiente
				WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo   AND  ( Clave=@ClavEstatus  )   AND T.ACTIVO= 1
		END
		ELSE IF ( @AccionTarea='CONTINUA'  AND @IdTareaSig>0  )
		BEGIN
			IF  NOT EXISTS (
			SELECT * from  FlujoTrabajoHistorial WHERE  IdInstancia=@IdInstancia AND IdEstatusTarea IN ('0','1')  AND IdTarea  iN  (
			SELECT DISTINCT ISNULL(AE.IdTareaSiguiente,0)
			FROM FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK)
			LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
			LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=AE.IdTareaSiguiente
			WHERE    T.IdFlujoTrabajo=@IdFlujoTrabajo   AND  ( Clave=@ClavEstatus )   AND T.ACTIVO= 1
			))
			BEGIN
				PRINT 'NO EXISTE '
				INSERT  INTO FlujoTrabajoHistorial
				SELECT DISTINCT @IdFlujoTrabajo,ISNULL(AE.IdTareaSiguiente,0), ISNULL(T.IdActividad,0),NULL, @IdInstancia , @FechaRegistro, NULL , NULL, @Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
				0 ,	0 ,	@Activo 
				FROM FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK)
				LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
				LEFT OUTER JOIN FlujoTrabajoTarea  T WITH (NOLOCK) ON T.IdTarea=AE.IdTareaSiguiente
				WHERE   T.IdFlujoTrabajo=@IdFlujoTrabajo  AND  ( Clave=@ClavEstatus  )   AND T.ACTIVO= 1
			END
			ELSE 
				PRINT 'EXISTE '

		END
	END
END
SELECT  1  as id,  @ClaveFlujo AS clave , @Identificador AS identificador,	@IdAccion AS idAccion ,	@IdTarea AS idTarea ,	@ClavEstatus  AS clavEstatus ,	@Parametros AS parametros ,	@Variables as variables, '' AS llave
GO





DROP PROCEDURE [dbo].[AvanzarActividadANTERIOR]
GO

CREATE PROCEDURE  [dbo].[AvanzarActividadANTERIOR]
    @Identificador nvarchar(150),
    @ClaveFlujo nvarchar(100) = NULL,
	@ClaveActividad  nvarchar (20)= NULL ,
	@ClavEstatus  nvarchar (20)= NULL ,

	@FechaInicio smalldatetime = NULL,
	@FechaTernimacion smalldatetime= NULL ,
	@Nombre nvarchar (250) ,
	@Descripcion nvarchar (max) ,
	@Clasificacion nvarchar(max) ,
	@Importe decimal(16,2) ,
	@Numero  int ,
	@Referencia nvarchar(150)='' ,
	@Variables nvarchar (max)='',
	@Observacion nvarchar (max)='',
	@IdUsuario nvarchar (100)='' ,
	@IdPerfil nvarchar (100)='' ,
	@IdEquipo nvarchar(100)='',
	@Resultado	  nvarchar (max)=''  ,
	@IdAccion nvarchar(20)='',
	@TiempoActividad int =0,
	@TipoAsignacion varchar(20)=NULL, --- Usuario , Perfil, IdArea ,IdArea, IdPuesto
	@IdResponsable nvarchar (150) =NULL,
	@IdResponsableTexto nvarchar (150) =NULL
AS
DECLARE	 @IdFlujoTrabajo INT=0 , @NumeroVersion int=0 
DECLARE  @IdInstancia INT=0,  @IdHistorial INT=0 
DECLARE  @IdTarea INT=0 , @IdActividad INT =0, 	@IdEstatus INT =0
DECLARE  @IdTareaSig INT=0 , @IdActividadSig INT =0, 	@IdEstatusSig INT =0
DECLARE  @IdEstatusTareaUlt nvarchar(20)='' , 	@IdEstatusTarea nvarchar(20)='0', @Activo smallint  =1
   
DECLARE @AccionTarea  nvarchar(10)='', @FechaRegistro smalldatetime=GETDATE()

---  OBTIENE  FLUJO,  ACTIVIDAD  Y  ESTATUS  E HISTORIAL 
---  PARA   IDENTIFICADOR  PROPORCIONADO CON  LA  FINALIDAD  DE OBTENER SU ULTIMO ESTATUS


IF @Identificador IS NOT  NULL  AND @Identificador<>''
BEGIN
    PRINT  'OBTENER INSTANCIA'
	SELECT  @IdFlujoTrabajo =ISNULL(F.IdFlujoTrabajo,0),@IdInstancia=ISNULL(I.IdInstancia,0) ,
	 @IdTarea =ISNULL(I.IdTarea,0) ,@IdActividad=ISNULL(I.IdActividad,0) ,@IdEstatus=ISNULL(I.IdEstatus,0) ,@IdEstatusTareaUlt=I.IdEstatusTarea
	 ,@IdHistorial=ISNULL(H.IdHistorial,0) 
	 ,@FechaRegistro=ISNULL(H.FechaRegistro,GETDATE()) 
	 ,@FechaInicio=ISNULL(H.FechaInicio,GETDATE()) 
	 ,@FechaRegistro=ISNULL(H.FechaRegistro,GETDATE()) 
	 
	FROM  FlujoTrabajo  F WITH (NOLOCK) 
	LEFT  OUTER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo  =I.IdFlujoTrabajo
    LEFT  OUTER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdTarea=I.IdTarea and H.IdInstancia=I.IdInstancia
	WHERE I.Identificador=@Identificador AND  F.Clave=@ClaveFlujo --- AND I.IdEstatusTarea='0'

	IF  @IdInstancia= 0
	BEGIN
		PRINT  ' -----------------NO HAY INSTANCIA---------------------------' 
		SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@ClaveFlujo,@NumeroVersion)  

		---   OBTENER  TAREA   INICIAL DEL FLUJO BASICO ACTIVAD
		SELECT ' -----------------OBTENER  TAREA   INICIAL DEL FLUJO BASICO---------------------------' 
		SELECT TOP 1  @IdTareaSig=ISNULL(AE.IdTarea,0) , @IdActividadSig=ISNULL(IdActividad,0) ,@IdEstatusSig=ISNULL(IdEstatus,0)
		FROM FlujoTrabajoTarea A WITH (NOLOCK) 
		LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE ON AE.IdTarea=A.IdTarea
		WHERE   IdFlujoTrabajo=@IdFlujoTrabajo AND   FlujoBasico =1  
		ORDER BY Orden 

		SELECT ' NOA HAY INSTANCIA TAREA   INICIAL DEL FLUJO BASICO ACTIVA' ,@IdTareaSig,@IdActividadSig ,@IdEstatusSig
		SET @IdEstatusTarea='0'
		PRINT  'INSERT'
		SET @IdInstancia=0
			exec @IdInstancia=InsertarFlujoTrabajoInstancia
			@IdFlujoTrabajo ,@IdTareaSig ,@IdActividadSig ,null ,
			@FechaInicio  ,	@FechaTernimacion  ,
			@Identificador,@Nombre,@Descripcion,@Clasificacion,	@Importe, @Numero,@Referencia , @Variables,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,
			@IdEstatusTarea , @Activo 


		exec @IdHistorial=InsertarFlujoTrabajoHistorial
			@IdFlujoTrabajo ,@IdTareaSig ,@IdActividadSig ,null ,
			@IdInstancia ,
			@FechaRegistro,@FechaInicio  ,	@FechaTernimacion  ,
			@Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
			@TiempoActividad ,	@IdEstatusTarea ,	@Activo 

		IF @Variables IS NOT  NULL  AND @Variables<>''
		BEGIN
			PRINT 'inserta variables'
			INSERT  INTO FlujoTrabajoVariable
			SELECT @IdFlujoTrabajo,@IdInstancia,* ,1 FROM  dbo.ObtenerListaPorNombreValor (@Variables) 
			SELECT * FROM FlujoTrabajoVariable
		END
 		
	END
	SELECT	  
		    'Instancia' AS Instancia,
			@IdFlujoTrabajo AS '@IdFlujoTrabajo' , 
			@IdInstancia AS '@IdInstancia',
			@IdHistorial AS  '@IdHistorial',  

			'ACTUAL' AS ACTUAL,
			@IdTarea  AS '@IdTarea',
			@IdActividad AS '@IdActividad' ,
			@IdEstatus AS '@IdEstatus' 
    
	SELECT  IdActividad,Clave,Nombre  FROM  FlujoTrabajoActividad WHERE  IdActividad=@IdActividad
	SELECT  IdEstatus,Clave,Nombre  FROM  FlujoTrabajoEstatus WHERE  IdEstatus=@IdEstatus

	SELECT	 'ANTES' ANTES,
			 'ACCION' ACCION,
			 @IdAccion AS '@IdAccion' ,
	  		 @IdEstatusTarea AS '@IdEstatusTarea' ,
			 @IdEstatusTareaUlt AS '@IdEstatusTareaUlt' ,
			 @FechaInicio AS '@FechaInicio',
			 @FechaTernimacion AS '@FechaTernimacion',
			 'SIGUIENTE' AS SIGUIENTE,
	  		 @IdTareaSig  AS '@IdTareaSig',
			 @IdActividadSig AS '@IdActividadSig' ,
			 @IdEstatusSig AS '@IdEstatusSig' 
	SELECT  IdActividad,Clave,Nombre  FROM  FlujoTrabajoActividad WHERE  IdActividad=@IdActividadSig
	SELECT  IdEstatus,Clave,Nombre  FROM  FlujoTrabajoEstatus WHERE  IdEstatus=@IdEstatusSig


	IF  @IdInstancia> 0 AND @IdAccion='INICIAR' AND  ( @IdEstatusTareaUlt IS NULL OR @IdEstatusTareaUlt ='' OR @IdEstatusTareaUlt='0' OR  @IdEstatusTareaUlt='2' OR @IdEstatusTarea='2' )
	BEGIN
		SELECT ' ---------INICIAR    --------'
 		---  obtiene  fechas INICIAL  no se  proporciona
		IF  @FechaInicio IS NULL OR @FechaInicio ='' 
			SET @FechaInicio=GETDATE()
		SET @IdEstatusTarea='1'
		SELECT  'UPDATE'
		IF ( @TipoAsignacion IS NOT NULL AND @TipoAsignacion<>'' )  AND ( @IdResponsable IS NOT NULL AND @IdResponsable<>'') AND  @IdTarea IS NOT NULL
		BEGIN
			SET @IdEstatusTarea='2'
			EXEC AsignarResponsable  @IdFlujoTrabajo,@IdInstancia,@Identificador,@IdTarea,@TipoAsignacion,@IdResponsable,@IdUsuario,@IdResponsableTexto
		END

		--- ACTUALZAR TAREA EN INICIADA
		UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
		SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=@FechaInicio
		WHERE IdInstancia=@IdInstancia
		UPDATE FlujoTrabajoHistorial WITH (ROWLOCK)
		SET IdEstatusTarea=@IdEstatusTarea , FechaInicio=@FechaInicio
		WHERE IdHistorial=@IdHistorial
		
	SELECT	 'INICIAR' INICIAR,
			 'ACCION' ACCION,
			 @IdAccion AS '@IdAccion' ,
	  		 @IdEstatusTarea AS '@IdEstatusTarea' ,
			 @IdEstatusTareaUlt AS '@IdEstatusTareaUlt' ,
			 @FechaInicio AS '@FechaInicio',
			 @FechaTernimacion AS '@FechaTernimacion'

	END 

	IF @IdInstancia>= 0 AND @IdAccion='TERMINAR' AND  (@IdEstatusTareaUlt ='' OR @IdEstatusTareaUlt IS NULL  OR  @IdEstatusTareaUlt='1' OR   @IdEstatusTareaUlt='2'  )
	BEGIN
		SELECT ' -------TERMINAR  -----------'
		IF (@IdTarea IS NULL OR @IdTarea= 0	) 
			SET @IdTarea=@IdTareaSig 
		--  Actualziar  estatus  de actividad  actual
		IF (	@ClavEstatus IS NOT  NULL OR @ClavEstatus<>''  ) 
		BEGIN
			-- OBTENER ESTATTUS PROPORCIONADO
			SELECT  'OBTENER ESTATTUS PROPORCIONADO'  ,@ClavEstatus  AS '@ClavEstatus '
			SELECT TOP 1  	@IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0) ,@AccionTarea=Accion
			FROM FlujoTrabajoTarea  A WITH (NOLOCK) 
			LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE  WITH (NOLOCK) ON AE.IdTarea=A.IdTarea	
			LEFT  OUTER JOIN FlujoTrabajoEstatus  E WITH (NOLOCK) ON AE.IdEstatus=E.IdEstatus
			WHERE   A.IdFlujoTrabajo=@IdFlujoTrabajo AND A.IdTarea=@IdTarea   AND ( Clave=@ClavEstatus  )   AND A.ACTIVO= 1

			SELECT  'ESTATUS  SIGUIENTE  PPROPORCIONADO'  
		END
		SELECT  'OBTENER  ESTATUS EVALUANDO CONDICIONES'  
		IF (@IdTareaSig=0 )
		BEGIN
		
			DECLARE  @IdEstatusCondicion int
			EXEC @IdEstatusCondicion= EvaluarCondicionFlujo @IdFlujoTrabajo, 1
			SELECT @IdEstatusCondicion
			IF (@IdEstatusCondicion IS NOT NULL AND  @IdEstatusCondicion<> 0	) 
			BEGIN
 				SELECT TOP 1 @IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0)  ,@AccionTarea=Accion
				FROM FlujoTrabajoTarea A WITH (NOLOCK) 
				LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE WITH (NOLOCK)  ON AE.IdTarea=A.IdTarea
				WHERE   IdFlujoTrabajo=@IdFlujoTrabajo AND  A.IdTarea=@IdTarea   AND   AE.IdEstatus=@IdEstatusCondicion  AND AE.ACTIVO= 1
				SELECT  'ESTATUS EVALUANDO CONDICIONES'  
			END
		END

		IF (@IdTareaSig=0 )
		BEGIN
		
			---   OBTENER SIGUIENTE TAREA  Y  ESTATUS SIGUIENTE  DEL FLUJO BASICO  DE LA TAREA  ACTUAL 
			SELECT @AccionTarea
 			SELECT TOP 1 @IdTareaSig =ISNULL(AE.IdTareaSiguiente,0),@IdEstatusSig=ISNULL(AE.IdEstatus,0)  ,@AccionTarea=Accion
			FROM FlujoTrabajoTarea A WITH (NOLOCK) 
			LEFT OUTER JOIN FlujoTrabajoTareaEstatus  AE WITH (NOLOCK)  ON AE.IdTarea=A.IdTarea
			WHERE   IdFlujoTrabajo=@IdFlujoTrabajo AND  A.IdTarea=@IdTarea   AND   FlujoBasico in (1 )  AND AE.ACTIVO= 1
			SELECT @AccionTarea
			SELECT  'NO SE PROPORCIONO ESTATUS, SIGUIENTE ESTATUS DE FLUJO BASICO'  

		END

		SELECT  'TAREA Y ESTATUS SIGUIENTE ' ,@IdTareaSig  AS '@IdTareaSig'  ,@IdEstatusSig AS '@IdEstatusSig',@AccionTarea AS ' @AccionTarea'
		SELECT  IdEstatus,Clave,Nombre  FROM  FlujoTrabajoEstatus WHERE  IdEstatus=@IdEstatusSig
		SELECT 'ACTUALIZAR  ESTATUS DE ACTIVIDAD  ACTUAL'
		--- ACTUALIZAR  ESTATUS
		SET @IdEstatusTarea='3'	

 		---  obtiene  fechas FINAL  no se  proporciona
		IF ( @FechaTernimacion IS NULL OR @FechaTernimacion ='' )
			SET @FechaTernimacion=GETDATE()

		---  OBETENR TIEMPO DE ACTIVIDAD
		--- PARATRIZAR PARA CALCULAR TIEMPOS POR HORAS, MIINUTOS O  SEGUNDOS
		SELECT  @TiempoActividad= DATEDIFF (hh, @FechaInicio,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (mi, @FechaInicio,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (ss, @FechaInicio,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (dd, @FechaInicio,@FechaTernimacion )

		SELECT  @TiempoActividad= DATEDIFF (hh, @FechaRegistro,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (mi, @FechaRegistro,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (ss, @FechaRegistro,@FechaTernimacion )
		SELECT  @TiempoActividad= DATEDIFF (dd, @FechaRegistro,@FechaTernimacion )
	
		SELECT  @TiempoActividad= DATEDIFF (mi, @FechaRegistro,@FechaTernimacion )	
		IF  @TiempoActividad=0
			SET @TiempoActividad=1

		SELECT 'INSERTA SIGUIENTE  ACTIVIDAD' 
		--- INSERTAR  SIGUIENTE ACTIVIDAD 

		IF ( @TipoAsignacion IS NOT NULL AND @TipoAsignacion<>'' )  AND ( @IdResponsable IS NOT NULL AND @IdResponsable<>'') AND  @IdTarea IS NOT NULL
			SET @IdEstatusTarea='2'
		--SET @FechaInicio= NULL 
		--SET @FechaTernimacion= NULL 

		---   OBTENER SIGUIENTE TIPO DE  ACTIVIDAD  SIGUIENTE    
		SELECT @IdActividadSig=ISNULL(IdActividad,0) 
		FROM FlujoTrabajoTarea A WITH (NOLOCK)  WHERE A.IdTarea=@IdTareaSig


		---  ACTUALZAR TAREA EN TERMINADA

		UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
		SET IdEstatusTarea=@IdEstatusTarea, FechaTernimacion=@FechaTernimacion
		,IdEstatus=@IdEstatusSig
		WHERE IdInstancia=@IdInstancia

		UPDATE FlujoTrabajoHistorial WITH (ROWLOCK)
		SET IdEstatusTarea=@IdEstatusTarea ,FechaTernimacion=@FechaTernimacion, TiempoActividad=@TiempoActividad
		,IdEstatus=@IdEstatusSig
		WHERE IdHistorial=@IdHistorial

		--- INSERTAR TAREA SIGUIENTE EN READY
		SET @TiempoActividad=0
		IF(  NOT @AccionTarea='TT' AND @IdTareaSig>0  )
		BEGIN
			SET @IdEstatusTarea=0
			-----  INSERTA  TAREA  Y ACTIVIDAD  SIGUIENTE 
			EXEC @IdHistorial=InsertarFlujoTrabajoHistorial
				@IdFlujoTrabajo ,@IdTareaSig ,@IdActividadSig ,NULL,
				@IdInstancia ,
				@FechaRegistro, NULL  ,	NULL  ,
				@Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
				@TiempoActividad ,	@IdEstatusTarea ,	@Activo 

			-----  ACTUALZAR O INICIAR  TAREA  Y ACTIVIDAD  SIGUIENTE 

			UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)
			SET IdTarea=@IdTareaSig,  IdActividad=@IdActividadSig,
			IdEstatusTarea=@IdEstatusTarea, FechaInicio=NULL, FechaTernimacion=NULL
			WHERE IdInstancia=@IdInstancia
	
			SELECT  ' NO ES accion  TT' , @AccionTarea, @IdTareaSig
 
			SELECT   'TERMINAR' TERMINAR,
					 'ACCION' ACCION,
					 @IdAccion AS '@IdAccion' ,
	  				 @IdEstatusTarea AS '@IdEstatusTarea' ,
					 @IdEstatusTareaUlt AS '@IdEstatusTareaUlt' ,
					 @FechaInicio AS '@FechaInicio',
					 @FechaTernimacion AS '@FechaTernimacion',
					 'SIGUIENTE' AS SIGUIENTE,
	  				 @IdTareaSig  AS '@IdTareaSig',
					 @IdActividadSig AS '@IdActividadSig' ,
					 @IdEstatusSig AS '@IdEstatusSig' 
			SELECT  IdActividad,Clave,Nombre  FROM  FlujoTrabajoActividad WHERE  IdActividad=@IdActividadSig
			SELECT  IdEstatus,Clave,Nombre  FROM  FlujoTrabajoEstatus WHERE  IdEstatus=@IdEstatusSig

		END
		SELECT 'ACTIVIDAD ACTUAL  TERMINAR CON ACTIVIDAD  SIGUIENTE',@IdTareaSig AS '@IdTareaSig',@IdActividadSig AS'@IdActividadSig' , @IdEstatusSig AS '@IdEstatusSig'


		IF ( @TipoAsignacion IS NOT NULL AND @TipoAsignacion<>'' )  AND ( @IdResponsable IS NOT NULL AND @IdResponsable<>'') AND  @IdTarea IS NOT NULL
			EXEC AsignarResponsable  @IdFlujoTrabajo,@IdInstancia,@Identificador,@IdTareaSig,@TipoAsignacion,@IdResponsable,@IdUsuario
	    
	END 
END 
GO


DROP  PROCEDURE [dbo].[VerInfoInstancia]
GO

CREATE  PROCEDURE  [dbo].[VerInfoInstancia]
	@IdInstancia int =1
AS

SELECT * FROM FlujoTrabajoInstancia WHERE IdInstancia=@IdInstancia
GO

exec VerInfoInstancia 1


DROP  PROCEDURE [dbo].[VerVariablesInstancia]
GO

CREATE  PROCEDURE  [dbo].[VerVariablesInstancia]
	@IdInstancia int =1
AS

SELECT Id, Variable,Valor FROM FlujoTrabajoVariable WHERE IdInstancia=@IdInstancia
GO

exec VerVariablesInstancia 1


DROP  PROCEDURE [dbo].[VerEstatusTarea]
GO

CREATE  PROCEDURE  [dbo].[VerEstatusTarea]
	@IdTarea int =1
AS
IF  @IdTarea=0
	SELECT T.IdTarea,E.IdEstatus,E.Clave,E.Nombre,E.Descripcion FROM FlujoTrabajoTarea T 
	LEFT  OUTER  JOIN FlujoTrabajoTareaEstatus EA WITH (NOLOCK)  ON EA.IdTarea =T.IdTarea 
	LEFT  OUTER  JOIN FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=EA.IdEstatus
	WHERE E.IdEstatus IS NOT NULL
ELSE
	SELECT T.IdTarea,E.IdEstatus,E.Clave,E.Nombre,E.Descripcion FROM FlujoTrabajoTarea T 
	LEFT  OUTER  JOIN FlujoTrabajoTareaEstatus EA WITH (NOLOCK)  ON EA.IdTarea =T.IdTarea 
	LEFT  OUTER  JOIN FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=EA.IdEstatus
	WHERE T.IdTarea=@IdTarea



GO

exec [VerEstatusTarea] 0

DROP  PROCEDURE [dbo].[VerFlujoTrabajo]
GO

CREATE  PROCEDURE  [dbo].[VerFlujoTrabajo]
    @Clave nvarchar(100),
	@NumeroVersion int =1
AS

DECLARE	@IdFlujoTrabajo int 
SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@Clave,@NumeroVersion)  
	
SELECT 
C.Nombre AS Clasificacion, A.Orden, CASE  EA.FlujoBasico  WHEN 1 THEN 'SI' ELSE 'NO'  END AS FlujoBasico
, TA.Clave AS ClaveActividad, TA.IdActividad IdActividad, EA.IdTarea IdTarea,TA.Nombre Actividad ,TA.TiempoLimite
,E.Clave AS ClaveEstatus,E.IdEstatus IdEstatus, E.Nombre as Estatus
,ra.tipo AS Perfil, ra.idResponsableTexto AS Responsable
,EA.IdTareaSiguiente
,CASE  WHEN  TASIG.Nombre  IS NULL OR EA.IdTareaSiguiente  =0  THEN 'Ninguna'  
 	   WHEN   EA.Accion='TERMINA' THEN TASIG.Nombre  
       ELSE TASIG.Nombre 
 END AS  [Actividad Siguiente]
	-- IdPersonal as  Responsable,UP.Tipo  as TipoResposable
	
FROM   FlujoTrabajoTarea A   WITH (NOLOCK) 
LEFT  OUTER  JOIN  FlujoTrabajoClasificacion  C  WITH (NOLOCK)  ON   A.IdFlujoTrabajoClasificacion=C.IdFlujoTrabajoClasificacion
LEFT  OUTER  JOIN FlujoTrabajoTareaEstatus EA WITH (NOLOCK)  ON EA.IdTarea =A.IdTarea 
LEFT  OUTER  JOIN FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=EA.IdEstatus
LEFT  OUTER  JOIN FlujoTrabajoActividad TA  WITH  (NOLOCK) ON  TA.IdActividad=A.IdActividad  

---  ACTIVIDAD  SIGUIENTE
LEFT  OUTER  JOIN FlujoTrabajoTarea ASIG WITH (NOLOCK)  ON ASIG.IdTarea=EA.IdTareaSiguiente
LEFT  OUTER  JOIN FlujoTrabajoActividad TASIG  WITH  (NOLOCK) ON  TASIG.IdActividad=ASIG.IdActividad  
LEFT  OUTER  JOIN FlujoTrabajoResponsableActividad ra WITH  (NOLOCK) ON ra.IdTarea = A.IdTarea AND  Principal=1
--LEFT  OUTER  JOIN PersonalAsignadoActividad UP WITH  (NOLOCK) ON UP.IdTarea= A.IdTarea
--LEFT  OUTER  JOIN ActividadFlujoTrabajo S  WITH  (NOLOCK) ON D.IdTareaSiguiente=S.IdTarea
WHERE A.IdFlujoTrabajo=@IdFlujoTrabajo and A.Activo=1
ORDER  BY A.Orden
GO





DROP  PROCEDURE [dbo].[ConsultarMisPendientesANTERIOR]
GO
CREATE PROCEDURE   [dbo].[ConsultarMisPendientesANTERIOR]
	@Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables='' )
		SELECT DISTINCT I.IdInstancia,I.IdTarea,I.IdActividad ,Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= I.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=I.IdInstancia AND  ARA.IdTarea  = I.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND I.IdEstatusTarea in ('0', '1', '2')
	ELSE
		SELECT DISTINCT I.IdInstancia,I.IdTarea,I.IdActividad ,Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValor (@Variables) VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= I.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=I.IdInstancia AND  ARA.IdTarea  = I.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND I.IdEstatusTarea in ('0', '1', '2')
		AND (  ( RA.Tipo = VR.Variable  AND  RA.IdResponsable=VR.Valor )  OR  ( ARA.Tipo= VR.Variable  AND ARA.IdResponsable =VR.Valor ) )
END
ELSE
BEGIN
	IF (@Variables=''  )
		SELECT DISTINCT I.IdInstancia,I.IdTarea,I.IdActividad ,Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= I.IdTarea
		LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=I.IdInstancia AND  ARA.IdTarea  = I.IdTarea
		LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VA ON VA.Variable= ARA.Tipo  AND VA.Valor= ARA.IdResponsable
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  I.IdEstatusTarea in ('0', '1','2')
	ELSE
		SELECT DISTINCT I.IdInstancia,I.IdTarea,I.IdActividad ,Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValor (@Variables) VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= I.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=I.IdInstancia AND  ARA.IdTarea  = I.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  I.IdEstatusTarea in ('0', '1','2')
		AND (  ( RA.Tipo = VR.Variable  AND  RA.IdResponsable=VR.Valor )  OR  ( ARA.Tipo= VR.Variable  AND ARA.IdResponsable =VR.Valor ) )
END
GO

DROP  PROCEDURE [dbo].[ConsultarMisPendientes]
GO
CREATE PROCEDURE   [dbo].[ConsultarMisPendientes]
	@Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables='' )
		SELECT DISTINCT H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
	ELSE
		SELECT DISTINCT H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		---LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
		AND (  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor  )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
END
ELSE
BEGIN
	IF (@Variables=''  )
		SELECT DISTINCT H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in  ('0', '1', '2')
	ELSE
		SELECT DISTINCT H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		---LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in  ('0', '1', '2')
		AND (  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor  )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
END
go






DROP  PROCEDURE [dbo].[Seguimiento]
GO
CREATE  PROCEDURE [dbo].[Seguimiento]
    @Clave nvarchar(100),
    @Identificador nvarchar(150) ,
	@IdIdioma INT = 1 
AS

SELECT 
T.Orden,A.Nombre AS Actividad, E.Nombre  AS [Estatus  Instancia], C.Valor   AS  [Estatus Tarea],  H.FechaInicio, H.FechaTernimacion , H.TiempoActividad, A.TiempoLimite, TiempoActividad-A.TiempoLimite as  ProductividadTiempo, H.Referencia, H.IdUsuario, H.IdEquipo, H.Observacion 
FROM   FlujoTrabajo F WITH (NOLOCK)
INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdFlujoTrabajo=F.IdFlujoTrabajo
LEFT  OUTER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=T.IdFlujoTrabajo
LEFT  OUTER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia AND  H.IdTarea=T.IdTarea
LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=T.IdActividad
LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON H.IdEstatus=E.IdEstatus
LEFT  OUTER JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
WHERE  F.Clave=@Clave AND ( I.Identificador=@Identificador  OR I.Identificador  IS NULL )
AND( H.Activo=1 OR H.Activo IS NULL) AND ( A.Activo=1 OR A.Activo IS NULL) 
ORDER BY 1,5
GO

DROP  PROCEDURE [dbo].[ConsultarHistorial]
GO
CREATE  PROCEDURE [dbo].[ConsultarHistorial]
    @Clave nvarchar(100),
    @Identificador nvarchar(150) ,
	@IdIdioma INT = 1 
AS

SELECT 
T.Orden,A.Nombre AS Actividad, E.Nombre AS [Estatus  Instancia], C.Valor  AS  [Estatus Tarea],    H.FechaInicio, H.FechaTernimacion , H.TiempoActividad, A.TiempoLimite, TiempoActividad-A.TiempoLimite as  ProductividadTiempo, H.Referencia, H.IdUsuario, H.IdEquipo, H.Observacion 
FROM   FlujoTrabajo F WITH (NOLOCK)
INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea
INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON H.IdEstatus=E.IdEstatus
INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
WHERE  F.Clave=@Clave AND I.Identificador=@Identificador
ORDER  BY H.IdHistorial,4
GO




DROP  PROCEDURE [dbo].[VerEstadisticasFlujoTrabajoPorTarea]
GO

CREATE PROCEDURE   [dbo].[VerEstadisticasFlujoTrabajoPorTarea]
	@Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables=''  )
	    SELECT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, count(*) as Cuenta , convert(int ,sum  (importe )   / 1000 )  as Importe 
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
		GROUP BY H.IdTarea, A.IdActividad,A.Clave, A.Nombre 
	ELSE
	    SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta   , convert(int ,sum  (importe )   / 1000 )  as Importe  
		FROM 
		( SELECT  DISTINCT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre  AS Actividad,I.Importe
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VF ,FlujoTrabajo F WITH (NOLOCK)  
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		INNER  JOIN FlujoTrabajoVariable V  WITH (NOLOCK) ON V.IdInstancia=I.IdInstancia
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
		--- AND (  ( VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) 
		 AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP BY IdTarea , IdActividad ,Clave,  Actividad 
END
ELSE
BEGIN
	IF (@Variables=''  )
	    SELECT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, count(*) as Cuenta , convert(int ,sum  (importe )   / 1000 )  as Importe 
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in ('0', '1','2')
		GROUP BY H.IdTarea, A.IdActividad,A.Clave, A.Nombre 
	ELSE
	    SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta   , convert(int ,sum  (importe )   / 1000 )  as Importe  
		FROM 
		( SELECT  DISTINCT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre  AS Actividad,I.Importe
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VF ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		INNER  JOIN FlujoTrabajoVariable V  WITH (NOLOCK) ON V.IdInstancia=I.IdInstancia
		WHERE  H.IdEstatusTarea in ('0', '1', '2')
		---AND (  ( VF.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) 
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP BY IdTarea , IdActividad ,Clave,  Actividad 
END
GO



DROP  PROCEDURE [dbo].[VerEstadisticasFlujoPorVariable]
GO

CREATE  PROCEDURE [dbo].[VerEstadisticasFlujoPorVariable]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables=''  )
		SELECT   H.IdTarea  , H.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , count(*) as Cuenta,  convert(int ,sum  (importe )   / 1000 )  as Importe , Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave  AND 	 H.IdEstatusTarea in ('0', '1', '2')
		GROUP  BY   H.IdTarea , H.IdActividad ,A.Clave, A.Nombre, E.Nombre 
		---AND  E.Nombre  IS NOT  NULL    
	ELSE
		SELECT  IdTarea , IdActividad ,Clave,  Actividad, Estatus , count(*) as Cuenta,  convert(int ,sum  (importe )   / 1000 )  as Importe ,Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		(
		SELECT  H.IdTarea , H.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , importe,TiempoActividad, A.TiempoLimite
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave  AND 	 H.IdEstatusTarea in ('0', '1', '2')
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP  BY    IdTarea , IdActividad  ,Clave,Actividad, Estatus 
END
ELSE
BEGIN
	IF (@Variables=''  )
		SELECT   H.IdTarea  , H.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , count(*) as Cuenta, convert(int ,sum  (importe )   / 1000 )  as Importe , Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in ('0', '1', '2')
		GROUP  BY   H.IdTarea , H.IdActividad ,A.Clave, A.Nombre, E.Nombre 
		---AND  E.Nombre  IS NOT  NULL    
	ELSE
		SELECT  IdTarea , IdActividad ,Clave,  Actividad, Estatus , count(*) as Cuenta, convert(int ,sum  (importe )   / 1000 )  as Importe , Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		(
		SELECT  H.IdTarea , H.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , importe, TiempoActividad, A.TiempoLimite
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus

		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE   H.IdEstatusTarea in ('0', '1', '2')
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP  BY    IdTarea , IdActividad  ,Clave,Actividad, Estatus 
END
GO




DROP  PROCEDURE [dbo].[VerProductividadPorTarea]
GO
CREATE  PROCEDURE [dbo].[VerProductividadPorTarea]
    @Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
	IF (@Variables=''  )
		SELECT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   ---AND H.IdEstatusTarea in ('0', '1', '2')
		GROUP BY H.IdTarea, A.IdActividad,A.Clave, A.Nombre 
	ELSE
		SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		( SELECT  DISTINCT  H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ TiempoActividad ,  A.TiempoLimite as  TiempoLimite
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE F.Clave=@Clave  --- AND  H.IdEstatusTarea in ('0', '1','2') ---AND E.Nombre  IS NOT  NULL  
		AND (  ( VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
		) AS R
		GROUP BY IdTarea , IdActividad ,Clave,  Actividad 
		// 		AND (  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor  )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
ELSE
	IF (@Variables=''  )
		SELECT  H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		---WHERE  H.IdEstatusTarea in ('0', '1', '2') ---AND E.Nombre  IS NOT  NULL 
		GROUP BY H.IdTarea, A.IdActividad,A.Clave, A.Nombre  ---, E.Nombre 
	ELSE
		SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		( SELECT  DISTINCT  H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ TiempoActividad ,  A.TiempoLimite as  TiempoLimite
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  ---I.IdEstatusTarea in ('0', '1','2')  AND ---AND E.Nombre  IS NOT  NULL  
		 (  ( VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
		) AS R
		GROUP BY IdTarea , IdActividad ,Clave,  Actividad 
GO



DROP  PROCEDURE [dbo].VerlujoTrabajoPorTareaDetalle
GO
CREATE  PROCEDURE [dbo].VerlujoTrabajoPorTareaDetalle
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS
   DECLARE  @IdTarea INT=0 
    SELECT  @IdTarea=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdTarea'
   DECLARE  @IdGrupo VARCHAR='' 
    SELECT  @IdGrupo=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdGrupo'
   DECLARE  @IdSocio VARCHAR='' 
    SELECT  @IdSocio=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdSocio'
	print  ( @IdGrupo)
	print  ( @IdSocio)
	IF ( @IdGrupo='' AND @IdSocio='' )
		  SELECT   I.IdInstancia,H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, E.Nombre AS Estatus,H.Identificador,I.Nombre, 1 as Cuenta, convert(int ,  (importe )   / 1000 )  as  Importe
		  FROM  FlujoTrabajo F WITH (NOLOCK) 
		  INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		  INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		  INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		  LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		  INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		  WHERE F.Clave=@Clave AND H.IdTarea=@IdTarea  AND  H.IdEstatusTarea in ('0', '1', '2')
	ELSE 
		  SELECT   I.IdInstancia,H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, E.Nombre AS Estatus,H.Identificador,I.Nombre, 1 as Cuenta, convert(int ,  (importe )   / 1000 )  as  Importe
          FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
		  INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		  INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		  INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		  LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		  INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		  LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		  WHERE F.Clave=@Clave AND H.IdTarea=@IdTarea  AND  H.IdEstatusTarea in ('0', '1', '2')
		  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )

	GO



DROP  PROCEDURE [dbo].VerProductividadPorTareaDetalle
GO
CREATE  PROCEDURE [dbo].VerProductividadPorTareaDetalle
    @Clave nvarchar(100),
	@IdTarea INT ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
	SELECT  H.Identificador, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 

	WHERE  F.Clave=@Clave  AND H.IdTarea=@IdTarea  ---AND E.Nombre  IS NOT  NULL  
	GROUP  BY   H.Identificador,H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre  ---, E.Nombre 
ELSE
	SELECT  H.Identificador, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 

	WHERE  H.IdTarea=@IdTarea  --- E.Nombre  IS NOT  NULL  
	GROUP  BY  H.Identificador, H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre  ---, E.Nombre 
GO



DROP  PROCEDURE [dbo].VerEstadisticasFlujoTrabajoPorEstatus
GO
CREATE  PROCEDURE [dbo].VerEstadisticasFlujoTrabajoPorEstatus
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables=''  )
		SELECT  I.IdTarea, I.IdActividad ,A.Clave,A.Nombre AS Actividad, I.IdEstatus,E.Nombre AS [Estatus],  count(*) as Cuenta
		---, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
		--INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		INNER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave  --- AND 	 H.IdEstatusTarea in ('0', '1', '2') ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
		GROUP  BY  I.IdTarea, I.IdActividad ,A.Clave ,A.Nombre ,I.IdEstatus, E.Nombre
	ELSE
		SELECT  IdTarea, IdActividad ,Clave,Actividad,IdEstatus,Estatus,  count(*) as Cuenta
		---, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		(
			SELECT  DISTINCT  I.IdTarea, I.IdActividad ,A.Clave,A.Nombre AS Actividad,I.IdEstatus,E.Nombre AS Estatus
			---, TiempoActividad,A.TiempoLimite
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
			--INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			INNER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  F.Clave=@Clave  --- AND 	 H.IdEstatusTarea in ('0', '1', '2')   ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
					AND   --- ( V.Variable= VF.Variable  AND)  
					( V.Valor= VF.Valor)
		) AS R
		GROUP  BY IdTarea, IdActividad ,Clave,Actividad,IdEstatus,Estatus

END
ELSE
BEGIN
	IF (@Variables=''  )
		SELECT  I.IdTarea, I.IdActividad ,A.Clave,A.Nombre AS Actividad, I.IdEstatus,E.Nombre AS [Estatus],  count(*) as Cuenta
		---, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
		--INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		INNER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		GROUP  BY   I.IdTarea, I.IdActividad ,A.Clave ,A.Nombre ,I.IdEstatus, E.Nombre
	ELSE
		SELECT  IdTarea, IdActividad ,Clave,Actividad,IdEstatus,IdEstatus,Estatus,  count(*) as Cuenta
		---, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(TiempoLimite) as  ProductividadTiempo
		FROM 
		(
			SELECT  DISTINCT I.IdTarea, I.IdActividad ,A.Clave,A.Nombre AS Actividad,I.IdEstatus,E.Nombre AS Estatus
			---, TiempoActividad,A.TiempoLimite
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
			--INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			INNER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  --- H.IdEstatusTarea in ('0', '1', '2')   ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
					---AND  
					--- ( V.Variable= VF.Variable  AND)  
					 ( V.Valor= VF.Valor)
		) AS R
		GROUP  BY IdTarea, IdActividad ,Clave,Actividad,IdEstatus,Estatus
END
GO



DROP  PROCEDURE [dbo].VerEstadisticasTrabajoPorEstatusHistorial
GO

CREATE  PROCEDURE [dbo].VerEstadisticasTrabajoPorEstatusHistorial
    @Clave nvarchar(100),
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
	SELECT  H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad,E.Nombre AS [Estatus],  count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
	WHERE  F.Clave=@Clave ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
	GROUP  BY   H.Identificador,H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre , E.Nombre
ELSE
	SELECT  H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad,E.Nombre AS [Estatus],  count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
	---WHERE  F.Clave=@Clave ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
	GROUP  BY   H.Identificador,H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre , E.Nombre
GO





DROP  PROCEDURE [dbo].[VerEstadisticasPorVariableHistorial]
GO

CREATE  PROCEDURE [dbo].[VerEstadisticasPorVariableHistorial]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS
	IF (@Variables<>''  )

		SELECT I.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   dbo.ObtenerListaPorNombreValor (@Variables) VF ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave 
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		GROUP  BY   I.IdTarea , A.IdActividad ,A.Clave, A.Nombre, E.Nombre 
	ELSE
		SELECT  I.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad,E.Nombre AS [Estatus] , count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave 
		GROUP  BY   I.IdTarea , A.IdActividad ,A.Clave, A.Nombre, E.Nombre 
		---AND  E.Nombre  IS NOT  NULL    


GO

---------------









