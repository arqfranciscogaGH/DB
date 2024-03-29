USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMisPendientes]    Script Date: 31/03/2022 09:10:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE   [dbo].[ConsultarMisPendientes]
	@Clave nvarchar(100),
	@Variables nvarchar (MAX) ,
	@IdIdioma INT = 1 
AS
IF ( @Clave IS  NOT NULL  AND @Clave!=''  )
BEGIN
    DECLARE @IdFlujoTrabajo INT=0, @NumeroVersion INT=0
	SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@Clave,@NumeroVersion)  
	IF (@Variables='' )
		SELECT DISTINCT F.Clave, H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.IdFlujoTrabajo=@IdFlujoTrabajo   AND H.IdEstatusTarea in ('0', '1', '2')
	ELSE
		SELECT DISTINCT F.Clave, H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',') VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		---LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.IdFlujoTrabajo=@IdFlujoTrabajo   AND H.IdEstatusTarea in ('0', '1', '2')
		AND (  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor  )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
END
ELSE
BEGIN
	IF (@Variables=''  )
		SELECT DISTINCT F.Clave,H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		---LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in  ('0', '1', '2')
	ELSE
		SELECT DISTINCT F.Clave,H.IdHistorial,I.Nombre, I.Importe,I.Numero,I.Referencia,I.Descripcion, H.IdInstancia,H.IdTarea,H.IdActividad ,H.Identificador,A.Nombre AS Actividad, E.Nombre AS [Estatus Flujo],  C.Valor AS  [Estatus Tarea]
		FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')VR ,FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia 
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		LEFT  OUTER  JOIN  FlujoTrabajoResponsableActividad RA WITH  (NOLOCK) ON RA.IdTarea= H.IdTarea
		---LEFT  OUTER  JOIN  dbo.ObtenerListaPorNombreValor (@Variables) VR ON VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable
		LEFT  OUTER  JOIN  FlujoTrabajoAsignacionActividad ARA WITH  (NOLOCK) ON ARA.IdInstancia=H.IdInstancia AND  ARA.IdTarea  =H.IdTarea
		LEFT  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  H.IdEstatusTarea in  ('0', '1', '2')
		AND (  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor  )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )
END
