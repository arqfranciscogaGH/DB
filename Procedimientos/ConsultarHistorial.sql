
/****** Object:  StoredProcedure [dbo].[ConsultarHistorial]    Script Date: 02/05/2022 10:05:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[ConsultarHistorial]
    @Clave nvarchar(100),
    @Identificador nvarchar(150) ,
	@IdIdioma INT = 1 
AS

SELECT 
T.Orden,A.Nombre AS Actividad, E.Nombre AS [Estatus  Instancia], C.Valor  AS  [Estatus Tarea],    H.FechaInicio, H.FechaTernimacion , H.TiempoActividad, A.TiempoLimite, TiempoActividad-A.TiempoLimite as  ProductividadTiempo, H.Referencia, U.Cuenta  AS IdUsuario, H.IdEquipo, H.Observacion 
FROM   FlujoTrabajo F WITH (NOLOCK)
INNER  JOIN  FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
INNER  JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea
INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON H.IdEstatus=E.IdEstatus
LEFT  OUTER JOIN CuentaUsuario U WITH  (NOLOCK) ON U.IdUsuario=H.IdUsuario
INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.Id=H.IdEstatusTarea   AND C.IdIdioma=@IdIdioma 
WHERE  F.Clave=@Clave AND I.Identificador=@Identificador AND T.Activo=1
ORDER  BY H.IdHistorial,4

go

