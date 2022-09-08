

         SELECT  * FROM  FlujoTrabajoInstancia  WHERE idInstancia=18

         SELECT  * FROM  FlujoTrabajoHistorial  WHERE idInstancia=18



USE [DB_A72B95_drp]
GO


ALTER   PROCEDURE [dbo].[VerDashBoard]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS

	DECLARE  @IdGrupo VARCHAR='' 
	SELECT  @IdGrupo=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdGrupo'
	DECLARE  @IdSocio VARCHAR='' 
	SELECT  @IdSocio=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdSocio'
	PRINT  ( @IdGrupo)
	PRINT  ( @IdSocio)
	IF @Clave =''
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento, P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			INNER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		ELSE
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			CONVERT(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento ,P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			 FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			INNER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
		END
	ELSE
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento, P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			INNER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  F.Clave=@Clave 
		ELSE
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			CONVERT(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento ,P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			 FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			INNER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  F.Clave=@Clave 	  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
	END
GO


GO
create   PROCEDURE [dbo].[VerEstadisticasDetalleFlujoTrabajoPorTarea]
    @Clave nvarchar(100),
	@IdTarea INT ,
	@IdIdioma INT = 1 
AS
SELECT I.Identificador, I.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, count(*) as Cuenta
---, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
FROM   FlujoTrabajo F WITH (NOLOCK)
INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo 
INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=I.IdEstatusTarea   AND IdIdioma=@IdIdioma 

WHERE  F.Clave=@Clave AND I.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
GROUP  BY   I.Identificador,I.IdTarea, A.IdActividad ,A.Clave ,A.Nombre 

go




ALTER  PROCEDURE [dbo].[VerTramite]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS

	DECLARE  @IdGrupo VARCHAR='' 
	SELECT  @IdGrupo=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdGrupo'
	DECLARE  @IdSocio VARCHAR='' 
	SELECT  @IdSocio=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdSocio'
	PRINT  ( @IdGrupo)
	PRINT  ( @IdSocio)
	IF ( @IdGrupo='' AND @IdSocio='' )
		SELECT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento, P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
		FROM  FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
		LEFT  OUTER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
		LEFT  OUTER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
		LEFT  OUTER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
		WHERE  F.Clave=@Clave 
		ORDER BY 1		
	ELSE
		SELECT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre ,convert(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento ,P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
         FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  OUTER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
		LEFT  OUTER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
		LEFT  OUTER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
		LEFT  OUTER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave 	  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
		ORDER BY 1
go
		

ALTER  PROCEDURE [dbo].[VerProductividadVencidas]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS
	DECLARE  @IdGrupo VARCHAR='' 
	SELECT  @IdGrupo=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdGrupo'
	DECLARE  @IdSocio VARCHAR='' 
	SELECT  @IdSocio=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdSocio'

	PRINT  ( @IdGrupo)
	PRINT  ( @IdSocio)

	DECLARE @medida  varchar(2)='dd'
	IF ( @IdGrupo='' AND @IdSocio='' )
		SELECT  H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, COUNT(*)  as cuenta
		, SUM( CONVERT(int , importe / 1000 ) ) as importe 
		, SUM(A.TiempoLimite) as  tiempoLimite
		, SUM (DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) )  as  tiempoTranscurrido
		, SUM ( DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite)  ) as  productividad
		--- 		 A.TiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  TiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  Productividad
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
		where H.IdEstatusTarea in ('0', '1', '2')
		---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite 
		GROUP  BY T.orden, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre
		ORDER BY  9  DESC
	ELSE
		SELECT  H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, COUNT(*)  as cuenta
		, SUM( CONVERT(int , importe / 1000 ) ) as importe 
		, SUM(A.TiempoLimite) as  tiempoLimite
		, SUM (DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) )  as  tiempoTranscurrido
		, SUM ( DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite)  ) as  productividad
        FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave 	  
		AND H.IdEstatusTarea in ('0', '1', '2')
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
		---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite 
		GROUP  BY T.orden, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre 
		ORDER BY  9  DESC

GO

exec VerProductividadVencidasdDetalle  'LINEAIV','' ,1

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
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],C.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM   FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
			LEFT  OUTER   JOIN  Persona  P  WITH (NOLOCK) ON P.referencia=I.Identificador --- P.Id=I.Numero
			LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			LEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
			WHERE  F.Clave=@Clave 	AND H.IdTarea=@IdTarea 	AND H.IdEstatusTarea in ('0', '1', '2')  --- AND	perfiles='2'
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC		  
		ELSE
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],C.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
			LEFT  OUTER   JOIN  Persona  P  WITH (NOLOCK) ON P.referencia=I.Identificador --- P.Id=I.Numero
			LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			LEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia
			WHERE  F.Clave=@Clave  AND H.IdTarea=@IdTarea  	AND H.IdEstatusTarea in ('0', '1', '2')  --- AND  	perfiles='2'
			AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC	 
	END
	ELSE
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],C.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM   FlujoTrabajo F WITH (NOLOCK)
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
			LEFT  OUTER   JOIN  Persona  P  WITH (NOLOCK) ON P.referencia=I.Identificador --- P.Id=I.Numero
			LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			LEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	 	
			WHERE  F.Clave=@Clave 	  --- 
			AND H.IdEstatusTarea in ('0', '1', '2') ---  AND	perfiles='2'
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC			  
		ELSE
			SELECT I.idInstancia, H.idTarea, A.idActividad ,A.clave,A.nombre AS actividad, E.Nombre AS [estatus],C.Valor AS  [estatusTarea],I.identificador,I.nombre, 1  as cuenta,convert(int ,  I.importe / 1000 )  as importe ,ISNULL(H.FechaInicio,H.FechaRegistro)  as  fechaInicial, ISNULL( H.FechaTernimacion,GETDATE()) as fechaActual,
			 A.tiempoLimite,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )  as  tiempoTranscurrido,DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) )-(A.TiempoLimite) as  productividad
			 , U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
			FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
			INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
			LEFT  OUTER   JOIN  Persona  P  WITH (NOLOCK) ON P.referencia=I.Identificador --- P.Id=I.Numero
			LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
			LEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
			LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia
			WHERE  F.Clave=@Clave 	  
			AND H.IdEstatusTarea in ('0', '1', '2')  ---  AND	perfiles='2'
			AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
			---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite  
			ORDER BY  16  DESC	 	


	END			  
GO
	

ALTER PROCEDURE   [dbo].[VerEstadisticasFlujoTrabajoPorTarea]
	@Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
	IF (@Variables=''  )
	    SELECT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, count(*) as Cuenta ,  SUM( CONVERT(int , importe / 1000 ) ) as importe 
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
		GROUP BY T.orden,H.IdTarea, A.IdActividad,A.Clave, A.Nombre 
		ORDER BY T.orden	

	ELSE
	    SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta  ,  SUM( CONVERT(int , importe / 1000 ) ) as importe   
		FROM 
		( SELECT  DISTINCT T.orden,H.IdTarea , A.IdActividad ,A.Clave, A.Nombre  AS Actividad,I.Importe
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VF ,FlujoTrabajo F WITH (NOLOCK)  
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		INNER  JOIN FlujoTrabajoVariable V  WITH (NOLOCK) ON V.IdInstancia=I.IdInstancia
		WHERE  F.Clave=@Clave   AND H.IdEstatusTarea in ('0', '1', '2')
		--- AND (  ( VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) 
		 AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP BY orden,IdTarea , IdActividad ,Clave,  Actividad 
		ORDER BY orden	
END
ELSE
BEGIN
	IF (@Variables=''  )
	    SELECT H.IdTarea , A.IdActividad ,A.Clave, A.Nombre AS Actividad, count(*) as Cuenta ,  SUM( CONVERT(int , importe / 1000 ) ) as importe 
		FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in ('0', '1','2')
		GROUP BY T.orden,H.IdTarea, A.IdActividad,A.Clave, A.Nombre 
		ORDER BY T.orden	
	ELSE
	    SELECT IdTarea , IdActividad ,Clave,  Actividad, count(*) as Cuenta   , SUM( CONVERT(int , importe / 1000 ) ) as importe  
		FROM 
		( SELECT  DISTINCT T.orden,H.IdTarea , A.IdActividad ,A.Clave, A.Nombre  AS Actividad,I.Importe
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VF ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 
		--LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		--LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  = H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND  IdIdioma=@IdIdioma 
		INNER  JOIN FlujoTrabajoVariable V  WITH (NOLOCK) ON V.IdInstancia=I.IdInstancia
		WHERE  H.IdEstatusTarea in ('0', '1', '2')
		---AND (  ( VF.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) 
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )  
		) AS R
		GROUP BY orden,IdTarea , IdActividad ,Clave,  Actividad 
		ORDER BY orden	
END
go


ALTER  PROCEDURE [dbo].[VerlujoTrabajoPorTareaDetalle]
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
	IF @IdTarea>0
	BEGIN
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
	END
	ELSE
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			  SELECT   I.IdInstancia,H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, E.Nombre AS Estatus,H.Identificador,I.Nombre, 1 as Cuenta, convert(int ,  (importe )   / 1000 )  as  Importe
			  FROM  FlujoTrabajo F WITH (NOLOCK) 
			  INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			  INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
			  INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			  LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			  INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
			  WHERE F.Clave=@Clave  AND  H.IdEstatusTarea in ('0', '1', '2')
		ELSE 
			  SELECT   I.IdInstancia,H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, E.Nombre AS Estatus,H.Identificador,I.Nombre, 1 as Cuenta, convert(int ,  (importe )   / 1000 )  as  Importe
			  FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			  INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			  INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
			  INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
			  LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			  INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
			  LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			  WHERE F.Clave=@Clave  AND  H.IdEstatusTarea in ('0', '1', '2')
			  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
	END

go

-------------------------------------------------------------

ALTER  PROCEDURE [dbo].[VerProductividadPorTareaDetalle]
    @Clave nvarchar(100),
	@IdTarea INT ,
	@IdIdioma INT = 1 
AS


IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
	SELECT  I.Identificador, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
	INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=H.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 

	WHERE  F.Clave=@Clave  AND H.IdTarea=@IdTarea  ---AND E.Nombre  IS NOT  NULL  
	GROUP  BY   I.Identificador,H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre  ---, E.Nombre 
ELSE
	SELECT  I.Identificador, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad, /*E.Nombre AS [Estatus],*/ count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo = F.IdFlujoTrabajo
	INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
	INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
	LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON  E.IdEstatus=I.IdEstatus
	INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 

	WHERE  H.IdTarea=@IdTarea  --- E.Nombre  IS NOT  NULL  
	GROUP  BY  I.Identificador, H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre  ---, E.Nombre 


	go



    SELECT * FROM Grupo
	SELECT * FROM Usuario

	update  Usuario
	set grupos='2'
	where id=3
	SELECT U.grupos,u.*
	--- I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,P.id  As idPersona,P.fechaNacimiento, P.rfc, P.curp,P.telefonoMovil,P.correo,  U.idSuscriptor AS idSocio, S.nombre as  socio, G.id AS idGrupo, G.nombre  AS  grupo 
		FROM  FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		INNER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
		INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
		INNER  JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
		INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	  	
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus


	----   sin filfros
exec VerDashBoard 'LINEAIV','' ,1
exec  VerTramite 'LINEAIV','' ,1
exec VerProductividadVencidas 'LINEAIV','' ,1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','' ,1

		

exec VerlujoTrabajoPorTareaDetalle  'LINEAIV','' ,1
exec VerProductividadVencidasdDetalle  'LINEAIV','' ,1



exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=15' ,1
exec  VerTramite 'LINEAIV','IdGrupo=3' ,1
exec VerProductividadVencidas 'LINEAIV','IdGrupo=3' ,1
exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=20,IdGrupo=3' ,1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdGrupo=3' ,1



exec  VerTramite 'LINEAIV','IdSocio=1017' ,1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdSocio=1017' ,1

exec VerProductividadVencidas 'LINEAIV','IdSocio=1017' ,1



-------------con  variables  tarea

exec VerlujoTrabajoPorTareaDetalle  'LINEAIV','Idtarea=20' ,1
exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=20' ,1


----       con  variables  tarea  grupo  y socio
exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=20,IdGrupo=3' ,1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV','Idtarea=20,IdGrupo=3' ,1

exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=20,IdSocio=1017' ,1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV','Idtarea=20,IdSocio=1017' ,1

exec VerProductividadVencidasdDetalle  'LINEAIV','Idtarea=20,IdGrupo=3,IdSocio=1017' ,1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV','Idtarea=20,IdGrupo=3,IdSocio=1017' ,1

		
	
	----- actualizacion  de fecha  firma 
		
select H.IdHistorial, H.IdActividad,H.* , * from  FlujoTrabajoInstancia I
INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
where H.IdActividad =13  and nombre like '%Marcela%'

select H.IdHistorial, H.IdActividad,H.* , * from  FlujoTrabajoInstancia I
INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia 
where H.IdActividad =13  and  H.IdInstancia  = 14   


update  FlujoTrabajoHistorial set fechaInicio ='2021-05-17'  , FechaTernimacion ='2021-05-17' , fecharegistro='2021-05-17' 
where IdHistorial in  ( 482 )

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-05'  , FechaTernimacion ='2021-04-05' , fecharegistro='2021-04-05' 
where IdActividad =13  and IdInstancia  = 33 

update  FlujoTrabajoHistorial set fechaInicio ='2021-05-11'  , FechaTernimacion ='2021-05-11' , fecharegistro='2021-05-11' 
where IdActividad =13  and IdInstancia  = 14 

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-28'  , FechaTernimacion ='2021-04-28' , fecharegistro='2021-04-28' 
where IdActividad =13  and IdInstancia  = 25 

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-28'  , FechaTernimacion ='2021-04-28' , fecharegistro='2021-04-28' 
where IdActividad =13  and IdInstancia  = 26 

update  FlujoTrabajoHistorial set fechaInicio ='2021-06-17'  , FechaTernimacion ='2021-06-17' , fecharegistro='2021-06-17' 
where IdActividad =13  and IdInstancia  = 17 

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-30'  , FechaTernimacion ='2021-04-30' , fecharegistro='2021-04-30' 
where IdActividad =13  and IdInstancia  = 3 

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-26'  , FechaTernimacion ='2021-04-28' , fecharegistro='2021-04-26' 
where IdActividad =13  and IdInstancia  = 44 

update  FlujoTrabajoHistorial set fechaInicio ='2021-05-31'  , FechaTernimacion ='2021-05-31' , fecharegistro='2021-05-31' 
where IdActividad =13  and IdInstancia  = 16 

update  FlujoTrabajoHistorial set fechaInicio ='2021-04-25'  , FechaTernimacion ='2021-04-25' , fecharegistro='2021-04-25' 
where IdActividad =13  and IdInstancia  = 40 

update  FlujoTrabajoHistorial set fechaInicio ='2021-05-14'  , FechaTernimacion ='2021-05-14' , fecharegistro='2021-05-14' 
where IdActividad =13  and IdInstancia  = 27 




update  FlujoTrabajoHistorial set fechaInicio ='2021-06-04'  , FechaTernimacion ='2021-06-04' , fecharegistro='2021-06-04' 
where IdActividad =13  and IdInstancia  = 34 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-28'  , FechaTernimacion ='2021-07-28' , fecharegistro='2021-07-28' 
where IdActividad =13  and IdInstancia  = 6 

update  FlujoTrabajoHistorial set fechaInicio ='2021-05-25'  , FechaTernimacion ='2021-05-25' , fecharegistro='2021-05-25' 
where IdActividad =13  and IdInstancia  = 32 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-20'  , FechaTernimacion ='2021-07-20' , fecharegistro='2021-07-20' 
where IdActividad =13  and IdInstancia  = 31 


update  FlujoTrabajoHistorial set fechaInicio ='2021-06-04'  , FechaTernimacion ='2021-06-04' , fecharegistro='2021-06-04' 
where IdActividad =13  and IdInstancia  = 4 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-06'  , FechaTernimacion ='2021-07-06' , fecharegistro='2021-07-06' 
where IdActividad =13  and IdInstancia  = 35 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-27'  , FechaTernimacion ='2021-07-20' , fecharegistro='2021-07-27' 
where IdActividad =13  and IdInstancia  = 51 


update  FlujoTrabajoHistorial set fechaInicio ='2021-09-08'  , FechaTernimacion ='2021-09-08' , fecharegistro='2021-09-08' 
where IdActividad =13  and IdInstancia  = 18 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-21'  , FechaTernimacion ='2021-07-21' , fecharegistro='2021-07-21' 
where IdActividad =13  and IdInstancia  = 30 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-23'  , FechaTernimacion ='2021-07-23' , fecharegistro='2021-07-23' 
where IdActividad =13  and IdInstancia  = 8



update  FlujoTrabajoHistorial set fechaInicio ='2021-05-31'  , FechaTernimacion ='2021-05-31' , fecharegistro='2021-05-31' 
where IdActividad =13  and IdInstancia  = 16 
update  FlujoTrabajoHistorial set fechaInicio ='2021-06-10'  , FechaTernimacion ='2021-06-10' , fecharegistro='2021-06-10' 
where IdActividad =13  and IdInstancia  = 50 
update  FlujoTrabajoHistorial set fechaInicio ='2021-06-01'  , FechaTernimacion ='2021-06-01' , fecharegistro='2021-06-01' 
where IdActividad =13  and IdInstancia  = 45 

update  FlujoTrabajoHistorial set fechaInicio ='2021-07-27'  , FechaTernimacion ='2021-07-27' , fecharegistro='2021-07-27' 
where IdActividad =13  and IdInstancia  = 1
update  FlujoTrabajoHistorial set fechaInicio ='2021-07-21'  , FechaTernimacion ='2021-07-21' , fecharegistro='2021-07-21' 
where IdActividad =13  and IdInstancia  = 28
update  FlujoTrabajoHistorial set fechaInicio ='2021-07-05'  , FechaTernimacion ='2021-07-05' , fecharegistro='2021-07-05' 
where IdActividad =13  and IdInstancia  = 10
update  FlujoTrabajoHistorial set fechaInicio ='2021-07-05'  , FechaTernimacion ='2021-07-05' , fecharegistro='2021-07-05' 
where IdActividad =13  and IdInstancia  = 11



update  FlujoTrabajoHistorial set fechaInicio ='2021-08-09'  , FechaTernimacion ='2021-08-09' , fecharegistro='2021-08-09' 
where IdActividad =13  and IdInstancia  = 9
update  FlujoTrabajoHistorial set fechaInicio ='2021-09-10'  , FechaTernimacion ='2021-09-10' , fecharegistro='2021-09-10' 
where IdActividad =13  and IdInstancia  = 49
update  FlujoTrabajoHistorial set fechaInicio ='2021-09-15'  , FechaTernimacion ='2021-09-15' , fecharegistro='2021-09-15' 
where IdActividad =13  and IdInstancia  = 46


update  FlujoTrabajoHistorial set fechaInicio ='2021-08-19'  , FechaTernimacion ='2021-08-19' , fecharegistro='2021-08-19' 
where IdActividad =13  and IdInstancia  = 48
update  FlujoTrabajoHistorial set fechaInicio ='2021-09-10'  , FechaTernimacion ='2021-09-10' , fecharegistro='2021-09-10' 
where IdActividad =13  and IdInstancia  = 60
update  FlujoTrabajoHistorial set fechaInicio ='2021-08-13'  , FechaTernimacion ='2021-08-13' , fecharegistro='2021-08-13' 
where IdActividad =13  and IdInstancia  = 7


update  FlujoTrabajoHistorial set fechaInicio ='2021-08-30'  , FechaTernimacion ='2021-08-30' , fecharegistro='2021-08-30' 
where IdActividad =13  and IdInstancia  = 41
update  FlujoTrabajoHistorial set fechaInicio ='2021-09-20'  , FechaTernimacion ='2021-09-20' , fecharegistro='2021-09-20' 
where IdActividad =13  and IdInstancia  = 20
update  FlujoTrabajoHistorial set fechaInicio ='2021-08-25'  , FechaTernimacion ='2021-08-25' , fecharegistro='2021-08-25' 
where IdActividad =13  and IdInstancia  = 42

update  FlujoTrabajoHistorial set fechaInicio ='2021-08-30'  , FechaTernimacion ='2021-08-30' , fecharegistro='2021-08-30' 
where IdActividad =13  and IdInstancia  = 12
update  FlujoTrabajoHistorial set fechaInicio ='2021-09-10'  , FechaTernimacion ='2021-09-10' , fecharegistro='2021-09-10' 
where IdActividad =13  and IdInstancia  = 62


	  