USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarComisiones]    Script Date: 13/07/2022 07:45:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   procedure [dbo].[RegistrarComisiones]
    @ClaveFlujo nvarchar(100) = NULL,
    @Identificador nvarchar(150),
	@IdAccion nvarchar(20)='',

	@Parametros nvarchar (max)='',
	@Variables nvarchar (max)='' ,
	@IdFlujoTrabajo INT=0 ,

	@IdInstancia INT=0 ,

	@IdTarea INT=0 ,
	@IdActividad INT=0 ,
	@IdEstatusSig INT=0 ,

	@IdSocio INT=0 ,

	@IdCliente INT=0 ,
	@IdSuscriptor INT=0 ,
	@ImporteOperacion decimal(16,2),
	@ComisionServicio Decimal(12,2)=0
AS

DECLARE @PorcComisionSocio Decimal(12,2)=0,@ComisionSocio Decimal(12,2)=0,   @ComisionSocioRed decimal(12,2)=0
DECLARE @Anticipo decimal(16,2)=0, @Finiquito decimal(16,2)=0

DECLARE @claveNivelRed  nvarchar (max)='', @nivelRed nvarchar (max)='', @Orden INT =0 , @IdSocioSuperior INT=0

IF @IdInstancia > 0  AND NOT EXISTS (SELECT * FROM ComisionServicio WHERE IdInstancia=@IdInstancia )
BEGIN

    SELECT  @Identificador=Identificador, @IdSocio=IdSocio,@IdCliente=IdCliente, @IdSuscriptor=@IdSuscriptor , @ImporteOperacion=Importe FROM  FlujoTrabajoInstancia   WHERE IdInstancia=@IdInstancia
	----
	---- Calcular comisiones de socios  de la red
	----
	--SELECT  U.idUsuario ,cuenta, P.nombre,idUsuarioSuperior ,N.Id AS idNivelRed , N.clave AS claveNivelRed , N.nombre AS nivelRed ,orden,comision FROM CuentaUsuario  U 
	--INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	--INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	--WHERE  U.IdUsuario = @IdSocio

	SELECT  @PorcComisionSocio=comision , @claveNivelRed =N.clave  , @nivelRed=N.nombre, @Orden=N.Orden ,@IdSocioSuperior=IdUsuarioSuperior FROM CuentaUsuario  U 
	INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	WHERE  U.IdUsuario = @IdSocio

	SET @ComisionSocio =@ComisionServicio* (@PorcComisionSocio /100)
	SET @ComisionSocioRed=@ComisionSocio

	SELECT @IdSocio AS [IdSocio], @IdSocioSuperior AS [IdUsuarioSuperior] , @Orden [Orden]   , @claveNivelRed AS [Clave Nivel Red] , @nivelRed  as [Nivel de Red],@PorcComisionSocio AS [% comisión Socio] 

	INSERT INTO ComisionServicio SELECT @IdFlujoTrabajo,@IdInstancia,@IdTarea,@IdActividad,@IdEstatusSig,'Socio',@IdSocio,@IdSocioSuperior, @claveNivelRed , @nivelRed , @Orden ,@PorcComisionSocio,@ComisionSocio,@ComisionSocioRed,getdate(),null,null,0,1

	WHILE @IdSocioSuperior>0  AND (  @Orden>0  )
	BEGIN
		DECLARE  @ComisionSocioSuperior decimal(12,2)=0
	
		SELECT 'comisiones de red '
		SET @ComisionSocioSuperior=@ComisionSocio
		SELECT  @PorcComisionSocio=comision , @claveNivelRed =N.clave  , @nivelRed=N.nombre, @Orden=N.Orden ,@IdSocio =U.IdUsuario , @IdSocioSuperior=IdUsuarioSuperior  FROM CuentaUsuario  U 
		INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
		INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
		WHERE  U.IdUsuario = @IdSocioSuperior AND U.activo=1
		IF @IdSocio>0
		BEGIN
			SET   @ComisionSocio =@ComisionServicio* (@PorcComisionSocio /100)

			SET   @ComisionSocioRed =@ComisionSocio-@ComisionSocioSuperior

			SELECT @IdSocio AS [IdSocio], @IdSocioSuperior AS [IdUsuarioSuperior] , @Orden [Orden]   , @claveNivelRed AS [Clave Nivel Red] , @nivelRed  as [Nivel de Red],@PorcComisionSocio AS [% comisión Socio] 

			INSERT INTO ComisionServicio SELECT @IdFlujoTrabajo,@IdInstancia,@IdTarea,@IdActividad,@IdEstatusSig,'Red',@IdSocio,@IdSocioSuperior, @claveNivelRed , @nivelRed , @Orden ,@PorcComisionSocio,@ComisionSocio,@ComisionSocioRed,getdate(),null,null,0,1
		END 
	END
	----
	---- FIN Calcular comisiones de socios  de la red
	----
END
ELSE
BEGIN
    DECLARE @Evento INT=0
	SELECT @Evento=Evento FROM FlujoTrabajoTareaEstatus WHERE IdTarea=@IdTarea AND  IdEstatus=@IdEstatusSig
	PRINT 'EVENTO'
	PRINT @IdTarea
	PRINT @IdEstatusSig
	PRINT @Evento
	IF @Evento > 0  
	BEGIN
		UPDATE BaseCalculoServicio  WITH (ROWLOCK) SET IdEstatusPago=1, IdTarea= @IdTarea,IdActividad=@IdActividad,IdEstatus=@IdEstatusSig WHERE IdInstancia=@IdInstancia   
		UPDATE ComisionServicio    WITH (ROWLOCK)  SET IdEstatusPago=1, IdTarea= @IdTarea,IdActividad=@IdActividad,IdEstatus=@IdEstatusSig ,fechaIActivacion=getdate() WHERE IdInstancia=@IdInstancia  
	END
END
