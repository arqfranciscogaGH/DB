
   --- parametros  Mejoravit
  INSERT  INTO Configuracion SELECT  'ivaMejoravit','Iva Mejoravit', '16', 'int',1,1
  INSERT  INTO Configuracion SELECT  'comisionMejoravit','Comisión Mejoravit', '16', 'int',1,1

ALTER PROCEDURE  [dbo].[CalculoServicio]
    @ClaveFlujo nvarchar(100) = NULL,
    @IdInstancia INT


AS
DECLARE	@Importe Decimal(12,0)
DECLARE	@PIvaMejoravit Decimal(4,2) ,@ImporteIvaMejoravit Decimal(12,0)=0 
DECLARE	@PComisionMejoravit Decimal(4,2) ,@ImporteComisionMejoravit Decimal(12,0)=0 


SELECT @Importe=Importe FROM   FlujoTrabajoInstancia   WHERE IdInstancia=@IdInstancia
SELECT * FROM   FlujoTrabajoInstancia   WHERE IdInstancia=@IdInstancia
SELECT * FROM   FlujoTrabajoVariable   WHERE IdInstancia=@IdInstancia


PRINT '@Importe : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @Importe),0) 


IF @ClaveFlujo='LINEAIV'
BEGIN
  PRINT '@Importe : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @Importe),0) 
END
ELSE IF @ClaveFlujo='MEJORAVIT'
BEGIN
	SELECT @PivaMejoravit=ISNULL(CONVERT ( Decimal(6,4), Valor),0)    FROM  Configuracion   WHERE  Id = 'ivaMejoravit'
	SET @ImporteIvaMejoravit=(@Importe*@PIvaMejoravit)/100
	SELECT @PComisionMejoravit=ISNULL(CONVERT ( Decimal(6,4), Valor),0)    FROM  Configuracion   WHERE  Id = 'comisionMejoravit'
	SET @ImporteComisionMejoravit=(@Importe*@PComisionMejoravit)/100

	PRINT '@PIvaMejoravit : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @PIvaMejoravit),0) 
	PRINT '@ImporteIvaMejoravit : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @ImporteIvaMejoravit),0) 

	PRINT '@PComisionMejoravit : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @PComisionMejoravit),0) 
	PRINT '@ImporteComisionMejoravit : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @ImporteComisionMejoravit),0) 

	SELECT  @Importe, @PivaMejoravit,@ImporteIvaMejoravit,@PComisionMejoravit,@ImporteComisionMejoravit
END
GO


EXEC CalculoServicio  'MEJORAVIT' ,89
