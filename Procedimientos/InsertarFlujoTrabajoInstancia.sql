USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[InsertarFlujoTrabajoInstancia]    Script Date: 03/03/2022 11:32:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE   [dbo].[InsertarFlujoTrabajoInstancia]

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
	@IdUsuario int  ,
	@IdSocio int  ,
	@IdCliente int  ,
	@IdSuscriptor int ,
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
			IdSocio ,
			IdCliente ,
			IdSuscriptor,
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
			@IdSocio,
			@IdCliente,
			@IdSuscriptor,
			@IdPerfil ,
			@IdEquipo ,
			@IdEstatusTarea ,
			@Activo   
		)
		SET @IdInstancia=@@IDENTITY
	  RETURN @IdInstancia
