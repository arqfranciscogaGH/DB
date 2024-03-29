USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[AvanzarActividad]    Script Date: 13/07/2022 07:51:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	@Nombre nvarchar (250) =NULL ,
	@Descripcion nvarchar (max) ='',
	@Clasificacion nvarchar(max) ='',
	@Importe decimal(16,2) = NULL ,
	@Numero  int  =NULL ,
	@Referencia nvarchar(150)='',
	@IdUsuario int  ,
	@IdSocio int  ,
	@IdCliente int  ,
	@IdSuscriptor int ,
	@IdPerfil nvarchar (100)='' ,
	@IdEquipo nvarchar(100)=''
SET NOCOUNT ON
IF @Parametros IS NOT  NULL  AND @Parametros<>''
BEGIN
		SELECT  @FechaInicio=Convert(date,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@FechaInicio' AND valor<>''

		SELECT  @FechaTernimacion=Convert(date,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@FechaTernimacion' AND valor<>''

		SELECT  @Observacion=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Observacion' 

		SELECT  @Resultado=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Resultado' 

		SELECT  @Nombre=valor
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Nombre' 

		SELECT  @Descripcion=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Descripcion'
	
		SELECT  @Clasificacion=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Clasificacion' 

		SELECT  @Referencia=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Referencia'

		SELECT  @Numero=Convert(int,valor)
		FROM dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Numero' 

		SELECT  @Importe=Convert(decimal(16,2),valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@Importe'  

		SELECT  @IdUsuario=Convert(int,valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdUsuario'  

		SELECT  @IdSocio=Convert(int,valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdSocio'  

		SELECT  @IdCliente=Convert(int,valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdCliente'  
		
		SELECT  @IdSuscriptor=Convert(int,valor)
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdSuscriptor'  

		SELECT  @IdPerfil=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdPerfil'  

		SELECT  @IdEquipo=valor
		FROM  dbo.ObtenerListaPorNombreValor (@Parametros) 
		WHERE TRIM(nombre)='@IdEquipo'  

		PRINT '----------------PARAMETROS---------------- '
		PRINT ' @@ClaveFlujo: ' +  @ClaveFlujo

		PRINT ' @Identificador: ' +  @Identificador
		PRINT ' FechaInicio:' + ISNULL(CONVERT ( VARCHAR(MAX), @FechaInicio),'')  +' , FechaTernimacion: ' + ISNULL(CONVERT ( VARCHAR(MAX), @FechaTernimacion),'')
		PRINT ' @IdUsuario: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdUsuario),'')
		PRINT ' @IdSocio: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdSocio),'')
		PRINT ' @IdCliente: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdCliente),'')
		PRINT ' @IdSuscriptor: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdSuscriptor),'')
		
		PRINT  '@IdPerfil : ' + @IdPerfil  + ', @IdEquipo: ' +  @IdEquipo +' , @Observacion: ' + @Observacion +' , @@Resultado: ' + @Resultado
		PRINT ' @Nombre: ' +  @Nombre  + ' , @Descripcion: ' +   @Descripcion   + ', @Clasificacion: ' +    @Clasificacion  + ' , @Referencia: ' +    @Referencia  
		PRINT ' @Importe: ' +  ISNULL(CONVERT ( VARCHAR(MAX), @Importe),'')    + ' , @Numero: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @Numero),0 )  

END

IF @Identificador IS NOT  NULL  AND @Identificador<>''
BEGIN

	PRINT  '----------------OBTENER INSTANCIA----------------'
	IF  @ClaveFlujo<>''
		SELECT  @IdFlujoTrabajo =ISNULL(F.IdFlujoTrabajo,0),@IdInstancia=ISNULL(I.IdInstancia,0) 
		FROM  FlujoTrabajo  F WITH (NOLOCK) 
		LEFT  OUTER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo  =I.IdFlujoTrabajo
		WHERE I.Identificador=@Identificador AND  F.Clave=@ClaveFlujo
	ELSE
		SELECT  @IdFlujoTrabajo =ISNULL(I.IdFlujoTrabajo,0),@IdInstancia=ISNULL(I.IdInstancia,0) 
		FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 		WHERE I.Identificador=@Identificador 
	PRINT 'INSTANCIA : @IdFlujoTrabajo : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdFlujoTrabajo),0)    + ' , @IdInstancia: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdInstancia),0 )  + ' , @IdTarea: ' 	+ISNULL(CONVERT ( VARCHAR(MAX), @IdTarea),0 )  

	IF  @IdInstancia= 0 AND ( @IdAccion='INICIAR' OR @IdAccion='TERMINAR'  )
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
			@Identificador,@Nombre,@Descripcion,@Clasificacion,	@Importe, @Numero,@Referencia , @Variables,	@IdUsuario,@IdSocio,@IdCliente ,@IdSuscriptor,@IdPerfil ,	@IdEquipo ,	@IdEstatusTarea , @Activo 
		PRINT 'INSERT: @IdInstancia : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdInstancia),0)   
		exec @IdHistorial=InsertarFlujoTrabajoHistorial
			@IdFlujoTrabajo ,@IdTarea ,@IdActividad ,null ,
			@IdInstancia ,
			@FechaRegistro,@FechaInicio  ,	@FechaTernimacion  ,
			@Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,@IdSuscriptor,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,0 ,@IdEstatusTarea ,	@Activo 
		PRINT 'INSERT: @IdHistorial : ' +  ISNULL(CONVERT ( VARCHAR(MAX), @IdHistorial),0)   
		IF @Variables IS NOT  NULL  AND @Variables<>''
		BEGIN
			PRINT 'inserta variables:' +@Variables
			INSERT  INTO FlujoTrabajoVariable
			SELECT @IdFlujoTrabajo,@IdInstancia,* ,1 FROM  dbo.ObtenerListaPorNombreValor (@Variables) 
		END
	END
	
	PRINT  '----------------Modificar Informacion ----------------'
	IF @IdInstancia> 0 AND   @IdAccion='MODIFICAR'  
	BEGIN

		IF @Variables IS NOT  NULL  AND @Variables<>''
		BEGIN
			PRINT 'MODIFICA variables:' +@Variables
			DELETE  FROM FlujoTrabajoVariable  WITH (ROWLOCK)  WHERE IdInstancia=@IdInstancia
			INSERT  INTO FlujoTrabajoVariable WITH (ROWLOCK)  
			SELECT @IdFlujoTrabajo,@IdInstancia,* ,1 FROM  dbo.ObtenerListaPorNombreValor (@Variables) 
		END
		PRINT 'Modicacion'
		UPDATE FlujoTrabajoInstancia WITH (ROWLOCK)   
		SET Nombre=ISNULL(@Nombre,Nombre), Importe=ISNULL(@Importe,Importe), Referencia=ISNULL(@Referencia,Referencia),Numero=ISNULL(@Numero,Numero), IdCliente=ISNULL(@IdCliente,IdCliente),IdUsuario=ISNULL(@IdUsuario,IdUsuario),IdSocio=ISNULL(@IdSocio,IdSocio),Variables=ISNULL(@Variables,Variables)
		WHERE IdInstancia=@IdInstancia 

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
			SET IdEstatusTarea=@IdEstatusTarea, FechaInicio=isnull(FechaInicio,@FechaInicio )
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
		

        exec RealizarCalculo @ClaveFlujo, @Identificador, @IdAccion,  @Parametros, @Variables,@IdFlujoTrabajo, @IdInstancia, @IdTarea,@IdActividad,@IdEstatusSig , @IdSocio , @IdCliente, @IdSuscriptor, @Importe

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
				SELECT DISTINCT @IdFlujoTrabajo,ISNULL(AE.IdTareaSiguiente,0), ISNULL(T.IdActividad,0),NULL, @IdInstancia , @FechaRegistro, NULL , NULL, @Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,@IdSuscriptor,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
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
				SELECT DISTINCT @IdFlujoTrabajo,ISNULL(AE.IdTareaSiguiente,0), ISNULL(T.IdActividad,0),NULL, @IdInstancia , @FechaRegistro, NULL , NULL, @Identificador,	@Referencia  ,	@Observacion,	@IdUsuario ,@IdSuscriptor,	@IdPerfil ,	@IdEquipo ,	@Resultado  ,
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
