USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[VerFlujoTrabajo]    Script Date: 02/05/2022 10:18:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE  [dbo].[VerFlujoTrabajo]
    @Clave nvarchar(100),
	@NumeroVersion int =1
AS

DECLARE	@IdFlujoTrabajo int 
SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@Clave,@NumeroVersion)  
	
SELECT 
C.Nombre AS Clasificacion, T.Orden, CASE  EA.FlujoBasico  WHEN 1 THEN 'SI' ELSE 'NO'  END AS FlujoBasico
, TA.Clave AS ClaveActividad, TA.IdActividad IdActividad, EA.IdTarea IdTarea,TA.Nombre Actividad ,TA.TiempoLimite
,E.Clave AS ClaveEstatus,E.IdEstatus IdEstatus, E.Nombre as Estatus
,ra.tipo AS Perfil, ra.idResponsableTexto AS Responsable
,EA.IdTareaSiguiente
,CASE  WHEN  TASIG.Nombre  IS NULL OR EA.IdTareaSiguiente  =0  THEN 'Ninguna'  
 	   WHEN   EA.Accion='TERMINA' THEN TASIG.Nombre  
       ELSE TASIG.Nombre 
 END AS  [Actividad Siguiente]
	-- IdPersonal as  Responsable,UP.Tipo  as TipoResposable
	
FROM   FlujoTrabajoTarea T   WITH (NOLOCK) 
LEFT  OUTER  JOIN  FlujoTrabajoClasificacion  C  WITH (NOLOCK)  ON   T.IdFlujoTrabajoClasificacion=C.IdFlujoTrabajoClasificacion
LEFT  OUTER  JOIN FlujoTrabajoTareaEstatus EA WITH (NOLOCK)  ON EA.IdTarea =T.IdTarea 
LEFT  OUTER  JOIN FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=EA.IdEstatus
LEFT  OUTER  JOIN FlujoTrabajoActividad TA  WITH  (NOLOCK) ON  TA.IdActividad=T.IdActividad  

---  ACTIVIDAD  SIGUIENTE
LEFT  OUTER  JOIN FlujoTrabajoTarea ASIG WITH (NOLOCK)  ON ASIG.IdTarea=EA.IdTareaSiguiente
LEFT  OUTER  JOIN FlujoTrabajoActividad TASIG  WITH  (NOLOCK) ON  TASIG.IdActividad=ASIG.IdActividad  
LEFT  OUTER  JOIN FlujoTrabajoResponsableActividad ra WITH  (NOLOCK) ON ra.IdTarea = T.IdTarea AND  Principal=1
--LEFT  OUTER  JOIN PersonalAsignadoActividad UP WITH  (NOLOCK) ON UP.IdTarea= A.IdTarea
--LEFT  OUTER  JOIN ActividadFlujoTrabajo S  WITH  (NOLOCK) ON D.IdTareaSiguiente=S.IdTarea
WHERE T.IdFlujoTrabajo=@IdFlujoTrabajo and T.Activo=1
ORDER  BY T.Orden
