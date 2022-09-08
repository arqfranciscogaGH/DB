  5579 0700 9014 8720
  Jorge Ledivieri  Medina

truncate table Configuracion

INSERT  
SELECT '','','% Comisión Infonavit','% Comisión Infonavit','comision_Infonvit','3','double',1,'',1

INSERT  Configuracion
SELECT '','','Comisión Administradora ','% Comisión Administradora','comision_administradora','5.22','double',1,'',1

INSERT  Configuracion
SELECT '','','Gastos Fiscales ','% Gastos Fiscales','gastos_fiscales','4.5','double',1,'',1

INSERT  Configuracion
SELECT '','','Avalúo y Verificaciones ','Avalúo y Verificaciones','Avaluo_verificaciones','4176','double',1,'',1

INSERT  Configuracion
SELECT '','','Comisión Fianza ','% Comisión Fianza','comision_fianza','1','double',1,'',1

INSERT  Configuracion
SELECT '','','Comisión Fidecomiso y Constructora ','% Comisión Fidecomiso y Constructora','comision_fidecomiso','20','double',1,'',1


SELECT TOP 1000 [id]
      ,[llave]
      ,[clave]
      ,[nombre]
      ,[descripcion]
      ,[IdValor]
      ,[valor]
      ,[tipo]
      ,[idAplicacion]
      ,[fechaEstatus]
      ,[estatus]
  FROM [DB_A72B95_drp].[dbo].[Configuracion]

  update   [DB_A72B95_drp].[dbo].[Configuracion]
  set valor='18'
  WHERE idvalor='comision_fidecomiso'

    update   [DB_A72B95_drp].[dbo].[Configuracion]
  set valor='5'
  WHERE idvalor='gastos_fiscales'




DROP  FUNCTION [dbo].[CalcularComisionLineaIV]
GO
create  FUNCTION [dbo].[CalcularComisionLineaIV] (
	@saldoSubcuenta  int =0,
	@importeOperacion  int =0,
	@porcentajeObra  float =0,
	@porcentajeEfectivo  float =0,
	@operacion  int =0
)
RETURNS
@returnList TABLE ( id  int ,concepto [nvarchar] (max) , comision [nvarchar] (max) , importe int )
AS
BEGIN
	--- declaracion de variable 
	DECLARE @PReserva decimal(12,2), @PCI decimal(12,2),@PCA decimal(12,2), @PCFiscal decimal(12,0), @PCFC decimal(12,2), @PCFianza decimal(12,2), @PCAV decimal(12,2) , @PCKungio decimal(12,3) =0.423
	DECLARE @Reserva decimal(12,0),@saldoSubcuentaSinReserva  decimal(12,0),@CI decimal(12,0),@CA decimal(12,0), @contaria decimal(12,0), @CFiscal  decimal(12,0), @CFC decimal(12,0),@CFianza decimal(12,0), @CAV decimal(12,0)
	DECLARE @saldo decimal(12,0),  @suma decimal(12,0) ,  @cKungio decimal(12,0), @recuperacion decimal(12,0)
	DECLARE	@obra decimal(12,0) , 	@efectivo decimal(12,2)
	DECLARE	@anticipo1 decimal(12,0) =70, 	@anticipo2 decimal(12,0)=30
	DECLARE	@importeNoliberado decimal(12,0) =0
	--- obtener  valores

	SELECT @PReserva=5
	SELECT  @PCI=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='comision_Infonvit'

	SELECT  @PCA=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='comision_administradora'

	SELECT  @PCFiscal=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='gastos_fiscales'

	SELECT  @PCFianza=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='comision_fianza'

	SELECT  @CAV=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='Avaluo_verificaciones'
			
	SELECT  @PCFC=CONVERT(decimal(12,2),valor)  from  Configuracion
	where idvalor='comision_fidecomiso'
	

	---calcular  reserva

	SELECT @Reserva=(@saldoSubcuenta* @PReserva)/100 
	SELECT @saldoSubcuentaSinReserva=(@saldoSubcuenta- @Reserva)

	---calcular  comision infonavit
	SELECT @CI=(@PCI* @importeOperacion)/100 
	
	
	--- insertar valores

	INSERT INTO @returnList 
	SELECT  10,'Saldo Subcuenta' as Concepto,'' , (@saldoSubcuenta) as Importe  	

	INSERT INTO @returnList 
	SELECT  20,'Reserva' as Concepto,'' , (@Reserva) as Importe  	

	INSERT INTO @returnList 
	SELECT  30,'Saldo sin Reserva' as Concepto,'' , (@saldoSubcuentaSinReserva) as Importe  	

	--- Determinar  el importe  de la operación
	---  el solictante contaria  con
	IF (  @importeOperacion IS NULL OR @importeOperacion=0   )
	BEGIN
		SET @CI=(@PCI* @saldoSubcuentaSinReserva)/100 
		SET @contaria =@saldoSubcuentaSinReserva-@CI
	END
	ELSE
	BEGIN
		SET @CI=(@PCI* @importeOperacion)/100 
		SET @contaria =@importeOperacion-@CI
		SET @importeNoliberado=(@saldoSubcuentaSinReserva-@importeOperacion ) +@CI

		INSERT INTO @returnList 
		SELECT  40,'Importe de autorizado ' as Concepto,'' , (@importeOperacion) as Importe  
	END

	INSERT INTO @returnList 
	SELECT  50,descripcion as Concepto,valor AS [ % Comision] ,@CI as Importe  from  Configuracion
	where idvalor='comision_Infonvit'

	---   Importe No liberado 
	IF (  @importeNoliberado IS NOT NULL AND  @importeNoliberado>0   )
		INSERT INTO @returnList 
		SELECT  60,'Importe No liberado ' as Concepto,'' , (@importeNoliberado) as Importe  
	
	INSERT INTO @returnList 
	SELECT  70,'Saldo con importe no liberado ' as Concepto,'' , @contaria as Importe  	

	---  comision de administradora
	SET @CA=(@PCA* @contaria)/100
	SET  @saldo = @contaria -@CA

	--- comisiones  varias

	SET @CFiscal=(@PCFiscal* @saldo)/100 
	SET @CFianza=(@PCFianza* @saldo)/100 
	
	SET @CFC=(@PCFC*@saldo )/100
	SET @suma =( @CFiscal+ @CFianza + @CAV +@CFC )

	SET @recuperacion =@saldo-@suma

		---  comison  Kungio
	SET @cKungio=(@CA+@CFC)*@PCKungio

	---  dispersión  de  anticipo
	SET @obra= ( (@recuperacion*@PorcentajeObra)/100 ) / 1.16 
	SET @efectivo= (@recuperacion*@PorcentajeEfectivo)/100 

	INSERT INTO @returnList 
	SELECT  80,descripcion as Concepto,valor AS [ % Comision] ,@CA as Importe  from  Configuracion
	where idvalor='comision_administradora'

	INSERT INTO @returnList 
	SELECT  90,'Saldo disponible para Tramite' as Concepto,'' , @saldo as Importe  

	INSERT INTO @returnList 
	SELECT 200,descripcion as Concepto,valor AS [ % Comision] ,@CFiscal as Importe  from  Configuracion
	where idvalor='gastos_fiscales'

	INSERT INTO @returnList 
	SELECT  210,descripcion as Concepto,valor AS [ % Comision] ,@CFianza as Importe  from  Configuracion
	where idvalor='comision_fianza'

	INSERT INTO @returnList 
	SELECT  230,descripcion as Concepto,'' AS [ % Comision] ,@CAV as Importe  from  Configuracion
	where idvalor='Avaluo_verificaciones'

	INSERT INTO @returnList 
	SELECT  240,descripcion as Concepto,valor AS [ % Comision] ,@CFC as Importe  from  Configuracion
	where idvalor='comision_fidecomiso'

	INSERT INTO @returnList 
	SELECT  250,'Suma comisiones ' as Concepto,'' , @suma as Importe  

	INSERT INTO @returnList 
	SELECT  260,'Recuperacion' as Concepto,'' , @recuperacion as Importe  

	INSERT INTO @returnList 
	SELECT  300,'Anticipo Obra ' as Concepto,@PorcentajeObra , CONVERT(decimal(12,0),@obra)   as Importe  

	INSERT INTO @returnList 
	SELECT  310,'Anticipo Efectivo' as Concepto,@PorcentajeEfectivo , CONVERT(decimal(12,0),@efectivo)   as Importe  

	INSERT INTO @returnList 
	SELECT  320,'Anticipo Total ' as Concepto,'' , CONVERT(decimal(12,0),@obra+@efectivo ) as Importe  

	INSERT INTO @returnList 
	SELECT  330,'Anticipo Obra  etapa 1' as Concepto,@anticipo1 , CONVERT(decimal(12,0),@obra* (@anticipo1/100) ) as Importe  

	INSERT INTO @returnList 
	SELECT  340,'Anticipo Efectivo etapa 1 ' as Concepto,@anticipo1 , CONVERT(decimal(12,0),@efectivo* (@anticipo1/100) )    as Importe  

	INSERT INTO @returnList 
	SELECT  350,'Anticipo Total etapa 1' as Concepto,@anticipo1, CONVERT(decimal(12,0),(@obra+@efectivo) * (@anticipo1/100)  )   as Importe  

	INSERT INTO @returnList 
	SELECT  360,'Anticipo Obra etapa 2' as Concepto,@anticipo2 , CONVERT(decimal(12,0),@obra* (@anticipo2/100) )  as Importe  

	INSERT INTO @returnList 
	SELECT  370,'Anticipo Efectivo etapa 2' as Concepto,@anticipo2 , CONVERT(decimal(12,0),@efectivo* (@anticipo2/100) ) as Importe  

	INSERT INTO @returnList 
	SELECT  380,'Anticipo Total etapa 2 ' as Concepto,@anticipo2 , CONVERT(decimal(12,0),(@obra+@efectivo) * (@anticipo2/100)  )  as Importe  

	INSERT INTO @returnList 
	SELECT  400,'Comison Kungio' as Concepto,'' , @cKungio as Importe  
	
	RETURN
END
go
SELECT * FROM dbo.CalcularComisionLineaIV(  346245 ,0, 25,75,0)
SELECT * FROM dbo.CalcularComisionLineaIV(  346245 ,298742, 25,75,1)


DROP  PROCEDURE  [dbo].[VerCalcularComisionLineaIV]
GO
create  PROCEDURE [dbo].[VerCalcularComisionLineaIV] (
	@saldoSubcuenta  int =0,
	@importeOperacion  int =0,
	@porcentajeObra  float =0,
	@porcentajeEfectivo  float =0,
	@operacion  int =0
)
AS
SELECT * FROM dbo.CalcularComisionLineaIV(  346245 ,0, 25,75,0)
GO

EXEC VerCalcularComisionLineaIV 346245 ,0, 25,75,0
EXEC VerCalcularComisionLineaIV 346245 ,298742, 25,75,1








SET NOCOUNT ON;  
  
DECLARE @IdInstancia INT, @IdPersona  INT,@NombreCliente NVARCHAR(MAX), @Importe decimal(12,2),  @idSuscriptor INT,  @NombreSocio NVARCHAR(MAX) , @idSuscriptorPadre INT,  @Tipo NVARCHAR(MAX) ,  @Nivel INT;

DECLARE tramites_cursor CURSOR FOR   
SELECT  IdInstancia, IdPersona,NombreCliente, Importe,idSuscriptor,NombreSocio,  idSuscriptorPadre,Tipo, Nivel  from tramites   WHERE  Nivel=0
  
OPEN tramites_cursor  
  
FETCH NEXT FROM tramites_cursor   
INTO @IdInstancia,@IdPersona,@NombreCliente, @Importe ,@idSuscriptor,@NombreSocio, @idSuscriptorPadre , @Tipo, @Nivel
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT ' '  
    SELECT  '----- TRAMITE: '
  
    SELECT  @IdInstancia,@IdPersona,@NombreCliente, @Importe ,@idSuscriptor,@NombreSocio, @idSuscriptorPadre , @Tipo, @Nivel
  
    DECLARE @contador INT=1
    WHILE @contador>0 
    BEGIN  
	     ---SELECT   *  FROM  Suscripcion  S  WITH (NOLOCK) WHERE  S.id=@idSuscriptorPadre
         SELECT  @idSuscriptor=id, @NombreSocio=S.Nombre, @idSuscriptorPadre=idSuscriptor, @Tipo=Tipo FROM  Suscripcion  S  WITH (NOLOCK) WHERE  S.id=@idSuscriptorPadre
		 SELECT  @idSuscriptor, @NombreSocio, @idSuscriptorPadre, @Tipo, @contador
		 IF @idSuscriptorPadre>1
		 BEGIN
			---INSERT tramites
			---SELECT @IdInstancia,@IdPersona, @NombreCliente ,@Importe , @idSuscriptor, @NombreSocio, @idSuscriptorPadre, @Tipo, @contador 

			SET @contador=@contador+1
		 END 
		 ELSE 
		     SET @contador=0
		SELECT '@contador',  @contador , '@idSuscriptorPadre', @idSuscriptorPadre
    END  

        -- Get the next vendor.  
    FETCH NEXT FROM tramites_cursor   
    INTO @IdInstancia,@IdPersona,@NombreCliente, @Importe ,@idSuscriptor,@NombreSocio, @idSuscriptorPadre , @Tipo, @Nivel
END   
CLOSE tramites_cursor;  
DEALLOCATE tramites_cursor;  


SELECT * FROM  tramites  ORDER  BY   1 ,9 DESC

SELECT * FROM  tramites  ORDER  BY   9 DESC


SELECT *
  FROM [DB_A72B95_drp].[dbo].[Suscripcion]   WHERE idSuscriptor=2


  SELECT  *
  FROM [DB_A72B95_drp].[dbo].[Suscripcion]  
  WHERE   idSuscriptor  IN  ( SELECT ID FROM [DB_A72B95_drp].[dbo].[Suscripcion]  WHERE  idSuscriptor=2 )



  SELECT  *
  FROM [DB_A72B95_drp].[dbo].[Suscripcion]  
  WHERE  idSuscriptor  IN 
  ( 
  SELECT ID FROM [DB_A72B95_drp].[dbo].[Suscripcion]    WHERE   idSuscriptor  IN  ( SELECT ID FROM [DB_A72B95_drp].[dbo].[Suscripcion]  WHERE  idSuscriptor=2 )
  )
