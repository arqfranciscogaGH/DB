USE [DB_A72B95_drp]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
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
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma= @IdIdioma  
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave 	  
		AND H.IdEstatusTarea in ('0', '1', '2')
		AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )	
		---AND DATEDIFF (dd,ISNULL(H.FechaInicio,H.FechaRegistro),ISNULL( H.FechaTernimacion,GETDATE()) ) > A.TiempoLimite 
		GROUP  BY T.orden, H.IdTarea, A.IdActividad ,A.Clave,A.Nombre 
		ORDER BY  9  DESC

