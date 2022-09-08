SELECT  ' ---  INSERCION DE  CATALOGOS DE FLUJO  '

declare  @IdFlujoTrabajo int = 30

SELECT * FROM  FlujoTrabajo  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoClasificacion  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTareaEstatus  where IdTarea IN ( SELECT IdTarea from  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo )
SELECT * FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoAsignacionActividad  where IdFlujoTrabajo=@IdFlujoTrabajo

---  eliminar flujo

BEGIN TRANSACTION

SELECT  ' --- ELIMINAR  tablas de operacion '

DELETE FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoVariable where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' --- ELIMINAR  tabLASs  catalogos '

DELETE  FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE  FROM   FlujoTrabajoAsignacionActividad where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE  FROM  FlujoTrabajoTareaEstatus  where IdTarea IN ( SELECT IdTarea from  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo )
DELETE  FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE  FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE  FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo

DELETE FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM  FlujoTrabajo where IdFlujoTrabajo=@IdFlujoTrabajo


COMMIT TRANSACTION



SET IDENTITY_INSERT [dbo].[FlujoTrabajo] ON 

SELECT  ' ---   flujp de trabajo'
INSERT [dbo].[FlujoTrabajo] ([IdFlujoTrabajo], [NumeroVersion], [Clave], [Nombre], [Descripcion], [FechaInicio], [FechaTerninacion], [IdFlujoTrabajoAnterior], [IdPlaneacionCaptura],IdSuscriptor, [Activo]) 
VALUES (@IdFlujoTrabajo, 1, N'RCA', N'Recupero Capital Afore', N' Recupero Capital  Afore', NULL, NULL, NULL, NULL, 1, 1)

SET IDENTITY_INSERT [dbo].[FlujoTrabajo] OFF


SELECT  ' ---   clasificacion'

INSERT  INTO FlujoTrabajoClasificacion  SELECT  'Solicitud',1,@IdFlujoTrabajo,1
SELECT   * FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  actividad  '

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RCA_IE','Integrar expediente RCA','Integrar expediente RCA','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RCA_PC','Pago Cliente RCA ','Pago Cliente RCA','','','',getdate(),30,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RCA_FIN','Finalizar RCA','Finalizar RCA ','','','',getdate(),1,1

SELECT  ' ----  estatus  '



INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RCA_IE_R','Expediente  Integrado RCA','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RCA_PC_R','Pago Cliente Realizado RCA','',1



SELECT  ' ----  Tarea  '


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,1, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_IE' )  , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,2, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_PC' ) , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,3, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_FIN') , 0



SELECT  ' ---  ESTATUS DE TAREAS '


INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_IE')),  ---tarea actividad
 1,'INICIA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RCA_IE_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_PC')), 1 ,NULL --- actividad tarea siguiente

INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_PC')),  ---tarea actividad
 1,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RCA_PC_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_FIN')), 1 ,1 --- actividad tarea siguiente






 
---   Resonsabilidades por actividad

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_IE')),
'IdPerfil', (SELECT MAX(idPerfil) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RCA_PC')),
'IdPerfil', (SELECT MAX(idPerfil) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1


SELECT * FROM  FlujoTrabajo  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoClasificacion  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTareaEstatus  where IdTarea IN ( SELECT IdTarea from  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo )
SELECT * FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoAsignacionActividad  where IdFlujoTrabajo=@IdFlujoTrabajo



-----  OPERACION



exec VerFlujoTrabajo 'RCA', 1

EXEC ConsultarHistorial 'RCA','100'

EXEC Seguimiento 'RCA','100'

EXEC  AvanzarActividad 'RCA','101', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2,@IdSocio=4, @IdCliente=4 , @Importe:50000, @Nombre: fran  gaRCA , @IdUsuario:4,@IdPerfil:4,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'

EXEC  AvanzarActividad 'RCA','101', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2 ,@IdSocio=4, @IdCliente=4 , @Importe:50000, @Nombre: fran  gaRCA , @IdUsuario:4,@IdPerfil:4,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'





exec VerEstadisticasFlujoTrabajoPorTarea '','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'RCA','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'RCA','IdSocio=1',1          --- NO FUNCIONO
exec VerEstadisticasFlujoTrabajoPorTarea 'RCA','IdPerfil=1',1         --- NO FUNCIONO

exec VerlujoTrabajoPorTareaDetalle  'RCA', '',1   
exec VerlujoTrabajoPorTareaDetalle  'RCA', 'IdTarea=42,IdSocio=1',1   --- NO FUNCIONO

exec VerEstadisticasFlujoPorVariable 'RCA', 'IdSocio=1 ', 1			 --- NO FUNCIONO
exec VerEstadisticasFlujoPorVariable 'RCA', ',@IdGrupo=B&D', 1	


--------------------  ESTADISTICAS 

EXEC VerEstadisticasFlujoPorVista  'RCA','vista=1' ,1

EXEC VerEstadisticasFlujoPorVista  '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVista  '','vista=1, IdFlujo=20' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1, IdFlujo=20' ,1


EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'RCA','vista=1' ,1

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdFlujoTrabajo=20
SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)  where IdFlujoTrabajo=20
SELECT * FROM   FlujoTrabajoVariable w WITH (NOLOCK)  where IdFlujoTrabajo=20



declare  @IdFlujoTrabajo int = 30

---  eliminar flujo

SELECT  ' --- ELIMINAR  tablas de operacion '

DELETE FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoVariable where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo

DELETE FROM  FlujoTrabajoHistorial where Idinstancia=999999
DELETE FROM FlujoTrabajoVariable where  Idinstancia=999999
DELETE FROM FlujoTrabajoInstancia  where  Idinstancia=999999


select * from  FlujoTrabajoInstancia