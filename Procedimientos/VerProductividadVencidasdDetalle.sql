USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[VerProductividadVencidasdDetalle]    Script Date: 09/03/2022 09:37:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[VerProductividadVencidasdDetalle]
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
	PRINT  ( @IdTarea)
	PRINT  ( @IdGrupo)
	PRINT  ( @IdSocio)

	DECLARE @medida  varchar(2)='dd'
	IF @IdTarea>0
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],EC.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , I.IdSocio AS idSocio, P.Nombre as  socio, G.IdGrupo AS IdGrupo, G.Nombre  AS  grupo 
			FROM   FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  EC WITH (NOLOCK) ON IdCatalogo=7141 AND  EC.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
			
			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.IdSocio 
			LEFT  JOIN  Persona P  WITH (NOLOCK) ON P.IdUsuario=U.IdUsuario
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )			
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor	
			
			WHERE  /* F.Clave=@Clave AND */ H.IdTarea=@IdTarea 	AND H.IdEstatusTarea in ('0', '1', '2')  --- AND	perfiles='2'
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC		  
		ELSE
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],EC.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , I.IdSocio AS idSocio, P.Nombre as  socio, G.IdGrupo AS IdGrupo, G.Nombre  AS  grupo  
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  EC WITH (NOLOCK) ON IdCatalogo=7141 AND  EC.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
	
			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.IdSocio 
			LEFT  JOIN  Persona P  WITH (NOLOCK) ON P.IdUsuario=U.IdUsuario
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )			
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor		

			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia
			WHERE  /* F.Clave=@Clave AND */ H.IdTarea=@IdTarea  	AND H.IdEstatusTarea in ('0', '1', '2')  --- AND  	perfiles='2'
			AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC	 
	END
	ELSE
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],EC.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , I.IdSocio AS idSocio, P.Nombre as  socio, G.IdGrupo AS IdGrupo, G.Nombre  AS  grupo 
			FROM   FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  EC WITH (NOLOCK) ON IdCatalogo=7141 AND  EC.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma   

			--- LEFT  OUTER   JOIN  Persona  P  WITH (NOLOCK) ON P.referencia=I.Identificador --- P.Id=I.Numero
			--- LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			--- LEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			--- LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	 

			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.IdSocio 
			LEFT  JOIN  Persona P  WITH (NOLOCK) ON P.IdUsuario=U.IdUsuario
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )			
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor	

			WHERE  /* F.Clave=@Clave AND */ H.IdEstatusTarea in ('0', '1', '2') ---  AND	perfiles='2'
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC			  
		ELSE
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],EC.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , I.IdSocio AS idSocio, P.Nombre as  socio, G.IdGrupo AS IdGrupo, G.Nombre  AS  grupo 
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  EC WITH (NOLOCK) ON IdCatalogo=7141 AND  EC.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
	
			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.IdSocio 
			LEFT  JOIN  Persona P  WITH (NOLOCK) ON P.IdUsuario=U.IdUsuario
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )			
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor	

			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia
			WHERE  /* F.Clave=@Clave AND */ H.IdEstatusTarea in ('0', '1', '2')  ---  AND	perfiles='2'
			AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC	 	


	END			  
