USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[InsertarFlujoTrabajoHistorial]    Script Date: 03/03/2022 11:31:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE   [dbo].[InsertarFlujoTrabajoHistorial]
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
	@IdUsuario int  ,
	@IdSuscriptor int ,
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
			IdSuscriptor,
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
			@IdSuscriptor,
			@IdPerfil ,
			@IdEquipo ,
			@Resultado  ,
			@TiempoActividad ,
			@IdEstatusTarea ,
			@Activo   
		)
		SET @IdHistorialFlujoTrabajo=@@IDENTITY
	  RETURN @IdHistorialFlujoTrabajo
