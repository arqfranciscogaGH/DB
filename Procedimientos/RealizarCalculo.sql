USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[RealizarCalculo]    Script Date: 13/07/2022 07:52:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   procedure  [dbo].[RealizarCalculo]
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
	@ImporteOperacion decimal(16,2)
AS

DECLARE @gastos Decimal(12,2)=0,  @importeDisponible Decimal(12,2)=0,@PorcComisionServicio Decimal(12,2)=0 ,@ComisionServicio Decimal(12,2)=0,@PorcComisionSocio Decimal(12,2)=0,@ComisionSocio Decimal(12,2)=0,   @ComisionSocioRed decimal(12,2)=0
DECLARE @Anticipo decimal(16,2)=0, @Finiquito decimal(16,2)=0
DECLARE @claveNivelRed  nvarchar (max)='', @nivelRed nvarchar (max)='', @Orden INT =0 , @IdSocioSuperior INT=0

PRINT @ClaveFlujo
PRINT @Identificador
PRINT @IdAccion
PRINT @IdTarea
PRINT @Parametros
PRINT @Variables
PRINT @IdInstancia
PRINT @IdActividad
PRINT @IdEstatusSig 
PRINT @IdSocio
PRINT @IdCliente
PRINT @IdSuscriptor
PRINT @ImporteOperacion

IF @IdInstancia > 0  AND NOT EXISTS (SELECT * FROM BaseCalculoServicio WHERE IdInstancia=@IdInstancia )
BEGIN
   SELECT  @Identificador=Identificador, @IdSocio=IdSocio,@IdCliente=IdCliente, @IdSuscriptor=@IdSuscriptor , @ImporteOperacion=Importe FROM  FlujoTrabajoInstancia   WHERE IdInstancia=@IdInstancia
	PRINT  @ClaveFlujo
	IF @ClaveFlujo='LINEAIV' ---  Línea IV
	BEGIN
		PRINT  @ClaveFlujo

	

	END
	ELSE IF @ClaveFlujo='MEJORAVIT'  --- Mejoravit
	BEGIN
		PRINT  @ClaveFlujo
		DECLARE @Iva decimal(16,2)=0
		DECLARE @M_OC INT=0, @M_IVA decimal(12,2)=0, @M_CF decimal(12,2)=0 ,@M_A decimal(12,2)=0 , @M_F decimal(12,2)=0 
		SELECT TOP 1 @M_OC=Valor  FROM Configuracion WHERE Id='M_OC'  
		SELECT TOP 1 @M_IVA=Valor  FROM Configuracion WHERE Id='M_IVA'  
		SELECT TOP 1 @M_CF=Valor  FROM Configuracion WHERE Id='M_CF'  
		SELECT TOP 1 @M_A=Valor  FROM Configuracion WHERE Id='M_A'  
		SELECT TOP 1 @M_F=Valor  FROM Configuracion WHERE Id='M_F'  
		SET @Iva=@ImporteOperacion * ( @M_IVA/100)
		SET @ComisionServicio=@ImporteOperacion *( @M_CF/100)
		SET @importeDisponible=@ImporteOperacion-@ComisionServicio -@Iva -@M_OC
		SET  @Anticipo=@importeDisponible*(@M_A/100)
		SET  @Finiquito=@importeDisponible*(@M_F/100)
		SELECT @ImporteOperacion AS [Importe Operacion], @Iva AS [Iva],@ComisionServicio AS [Comision Servicio] ,@M_OC AS [Originación crédito], @importeDisponible AS [ Importe Disponible ],@Anticipo AS [ Anticipo ],@Finiquito AS [ Finiquito ]
	END
	ELSE IF @ClaveFlujo='CP'  --- Crédito Pensionados 
	BEGIN
		PRINT  @ClaveFlujo
	
		DECLARE @CP_C decimal(12,2)=0
		SELECT TOP 1 @CP_C=Valor  FROM Configuracion WHERE Id='CP_C'  
		SET @PorcComisionServicio=( @CP_C/100)
		SET @ComisionServicio=@ImporteOperacion * @PorcComisionServicio
		SET @importeDisponible=@ImporteOperacion

		SELECT @ImporteOperacion AS [Importe Operacion], @CP_C AS [% Comision],@ComisionServicio AS [Comision Servicio], @importeDisponible AS [ Importe Disponible ]
 
		INSERT INTO BaseCalculoServicio SELECT @IdFlujoTrabajo,@IdInstancia,@IdTarea,@IdActividad,@IdEstatusSig,@IdCliente,@IdSocio,@IdSuscriptor,@ImporteOperacion,@gastos, @importeDisponible , @PorcComisionServicio  ,@ComisionServicio,  @Anticipo , @Finiquito,'' ,'' ,'' ,'' ,'' ,getdate(),0,1

	END

	ELSE IF @ClaveFlujo='RCA'  --- Recupero Capital Infonavit Afore
	BEGIN
		PRINT  @ClaveFlujo
		DECLARE @RCA_C decimal(12,2)=0
		SELECT TOP 1 @RCA_C=Valor  FROM Configuracion WHERE Id='RCA_C'  
		SET @PorcComisionServicio=( @RCA_C/100)
		SET @ComisionServicio=@ImporteOperacion * @PorcComisionServicio
		SET @importeDisponible=@ImporteOperacion

		SELECT @ImporteOperacion AS [Importe Operacion], @RCA_C AS [% Comision],@ComisionServicio AS [Comision Servicio], @importeDisponible AS [ Importe Disponible ]
 
		INSERT INTO BaseCalculoServicio SELECT @IdFlujoTrabajo,@IdInstancia,@IdTarea,@IdActividad,@IdEstatusSig,@IdCliente,@IdSocio,@IdSuscriptor,@ImporteOperacion,@gastos, @importeDisponible , @PorcComisionServicio  ,@ComisionServicio,  @Anticipo , @Finiquito,'' ,'' ,'' ,'' ,'' ,getdate(),0,1

	END

	ELSE IF @ClaveFlujo='RAF'  --- Recupero Afore Finados 
	BEGIN
		PRINT  @ClaveFlujo
		DECLARE @RAF_C decimal(12,2)=0
		SELECT TOP 1 @RAF_C=Valor  FROM Configuracion WHERE Id='RAF_C'  
		SET @PorcComisionServicio=( @RAF_C/100)
		SET @ComisionServicio=@ImporteOperacion * @PorcComisionServicio
		SET @importeDisponible=@ImporteOperacion

		SELECT @ImporteOperacion AS [Importe Operacion], @RAF_C AS [% Comision],@ComisionServicio AS [Comision Servicio], @importeDisponible AS [ Importe Disponible ]
 
		INSERT INTO BaseCalculoServicio SELECT @IdFlujoTrabajo,@IdInstancia,@IdTarea,@IdActividad,@IdEstatusSig,@IdCliente,@IdSocio,@IdSuscriptor,@ImporteOperacion,@gastos, @importeDisponible , @PorcComisionServicio  ,@ComisionServicio,  @Anticipo , @Finiquito,'' ,'' ,'' ,'' ,'' ,getdate(),0,1

	END

    EXEC RegistrarComisiones @ClaveFlujo, @Identificador, @IdAccion,  @Parametros, @Variables,@IdFlujoTrabajo, @IdInstancia, @IdTarea,@IdActividad,@IdEstatusSig , @IdSocio , @IdCliente, @IdSuscriptor, @ImporteOperacion, @ComisionServicio
END

