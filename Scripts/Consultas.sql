
SELECT   I.IdInstancia,I.Nombre, I.Importe ,I.IdTarea,I.IdActividad ,I.Identificador  FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)  ORDER BY  1

SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)  WHERE  IDESTATUS=45




SELECT  * FROM 		FlujoTrabajoVariable

SELECT  Variable, Valor, Count(*)  as Cuenta FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 
INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia 
LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
WHERE H.IdEstatusTarea in ('0', '1', '2') AND Variable='IdGrupo'
group  by Variable, Valor
order by  1

exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdGrupo=4', 1


exec VerEstadisticasFlujoPorVariable 'LINEAIV', '', 1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdSocio=4 ', 1


exec VerEstadisticasFlujoPorVariable 'LINEAIV', '', 1

exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 7,1
---------------------------------------------------------------------

SELECT  * FROM   FlujoTrabajoEstatus 

SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 
SELECT  * FROM   FlujoTrabajoHistorial  H where    H.IdEstatusTarea in ('0', '1', '2')
SELECT  * FROM   FlujoTrabajoHistorial  H where  IdEstatus=45




SELECT  I.IdEstatus,E.Nombre, E.Clave, Count(*) FROM   FlujoTrabajoInstancia    I WITH (NOLOCK) 
LEFT  OUTER  JOIN  FlujoTrabajoEstatus E WITH (NOLOCK)  ON E.IdEstatus=I.IdEstatus
GROUP  BY I.IdEstatus,E.Nombre, E.Clave

SELECT  I.IdEstatus,E.Nombre, E.Clave, Count(*) FROM   FlujoTrabajoHistorial    I WITH (NOLOCK) 
LEFT  OUTER  JOIN  FlujoTrabajoEstatus E WITH (NOLOCK)  ON E.IdEstatus=I.IdEstatus
GROUP  BY I.IdEstatus,E.Nombre, E.Clave

exec VerEstadisticasFlujoTrabajoPorEstatus 'LINEAIV','',1


exec  ConsultarMisPendientes 'LINEAIV','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','',1
exec VerEstadisticasFlujoTrabajoPorEstatus 'LINEAIV','',1

SELECT  * from FlujoTrabajoHistorial  H where  Idtarea=6  and   H.IdEstatusTarea in ('0', '1', '2')

SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdInstancia=3
SELECT  * from FlujoTrabajoHistorial  H where IdInstancia=3

SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdInstancia=33
SELECT  * from FlujoTrabajoHistorial  H where IdInstancia=33



SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdInstancia=35
SELECT  * from FlujoTrabajoHistorial  H where IdInstancia=35


SELECT  * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)  WHERE  IDESTATUS=45

   	SELECT  *	FROM   FlujoTrabajo F WITH (NOLOCK)
	INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
		--INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		INNER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus

		SELECT  H.IdTarea, A.IdActividad ,A.Clave,A.Nombre AS Actividad,E.Nombre AS [Estatus],  count(*) as Cuenta, Min(TiempoActividad) as  TiempoMinimo, Avg(TiempoActividad) as  TiempoPromedio, Max(TiempoActividad) as  TiempoMaximo , MAX(A.TiempoLimite) as  TiempoLimite,  MAX(TiempoActividad)-MAX(A.TiempoLimite) as  ProductividadTiempo
		FROM   FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=H.IdActividad
		LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=H.IdEstatus
		INNER  JOIN  ElementoCatalogo  C WITH (NOLOCK) ON IdCatalogo=7141 AND  C.IdValor=H.IdEstatusTarea   AND IdIdioma=@IdIdioma 
		WHERE  F.Clave=@Clave  AND 	 H.IdEstatusTarea in ('0', '1', '2') ---AND H.IdTarea=@IdTarea --- AND E.Nombre  IS NOT  NULL  
		GROUP  BY   H.Identificador,H.IdTarea, A.IdActividad ,A.Clave ,A.Nombre , E.Nombre