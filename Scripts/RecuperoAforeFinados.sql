SELECT  ' ---  INSERCION DE  CATALOGOS DE FLUJO  '

declare  @IdFlujoTrabajo int = 50

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
VALUES (@IdFlujoTrabajo, 1, N'RAF', N'Recupero Afore Finados ', N' Recupero Afore Finados', NULL, NULL, NULL, NULL, 1, 1)

SET IDENTITY_INSERT [dbo].[FlujoTrabajo] OFF


SELECT  ' ---   clasificacion'

INSERT  INTO FlujoTrabajoClasificacion  SELECT  'Solicitud',1,@IdFlujoTrabajo,1
SELECT   * FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  actividad  '
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RAF_I','Integrar expediente  Recupero Afore Finados','Integrar expediente Recupero Afore Finado','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RAF_D','Demanda Recupero Afore Finado','Propuesta Recupero Afore Finado','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RAF_PC','Pago Cliente Recupero Afore Finado','Pago Cliente Recupero Afore Finados','','','',getdate(),30,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RAF_FIN','Finalizar Recupero Afore Finado','Finalizar Recupero Afore Finado','','','',getdate(),1,1

SELECT  ' ----  estatus  '


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RAF_I_R','Expediente Integrado Recupero Afore Finad','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RAF_D_R','Demanda Realizada Recupero Afore Finad','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RAF_PC_R','Pago Realizado Recupero Afore Finad','',1

SELECT  ' ----  Tarea  '

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,1, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_I' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,2, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_D' )  , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,3, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_PC' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,4, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_FIN') , 0

SELECT  ' ---  ESTATUS DE TAREAS '

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_I')),  ---tarea actividad
 1,'INICIA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RAF_I_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_D')), 1  --- actividad tarea siguiente


INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_D')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RAF_D_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_PC')), 1  --- actividad tarea siguiente



INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_PC')),  ---tarea actividad
 1,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RAF_PC_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_FIN')), 1  --- actividad tarea siguiente






 
---   Resonsabilidades por actividad

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_I')),
'IdPerfil', (SELECT MAX(idPerfil) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_D')),
'IdPerfil', (SELECT MAX(idPerfil) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAF_PC')),
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



exec VerFlujoTrabajo 'RAF', 1

EXEC ConsultarHistorial 'RAF','500'

EXEC Seguimiento 'RAF','500'


EXEC  AvanzarActividad 'RAF','500', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2,@IdSocio=4, @IdCliente=4 , @Importe:50000, @Nombre: fran  garcia , @IdUsuario:4,@IdPerfil:4,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'

EXEC  AvanzarActividad 'RAF','500', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2 ,@IdSocio=4, @IdCliente=4 , @Importe:50000, @Nombre: fran  garcia , @IdUsuario:4,@IdPerfil:4,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'



exec VerEstadisticasFlujoTrabajoPorTarea '','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'RI','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'RI','IdSocio=1',1          --- NO FUNCIONO
exec VerEstadisticasFlujoTrabajoPorTarea 'RI','IdPerfil=1',1         --- NO FUNCIONO

exec VerlujoTrabajoPorTareaDetalle  'RI', '',1   
exec VerlujoTrabajoPorTareaDetalle  'RI', 'IdTarea=42,IdSocio=1',1   --- NO FUNCIONO

exec VerEstadisticasFlujoPorVariable 'RI', 'IdSocio=1 ', 1			 --- NO FUNCIONO
exec VerEstadisticasFlujoPorVariable 'RI', ',@IdGrupo=B&D', 1	


--------------------  ESTADISTICAS 

EXEC VerEstadisticasFlujoPorVista  'RI','vista=1' ,1

EXEC VerEstadisticasFlujoPorVista  '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVista  '','vista=1, IdFlujo=20' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1, IdFlujo=20' ,1


EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'RI','vista=1' ,1

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdFlujoTrabajo=20
SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)  where IdFlujoTrabajo=20
SELECT * FROM   FlujoTrabajoVariable w WITH (NOLOCK)  where IdFlujoTrabajo=20



declare  @IdFlujoTrabajo int = 50

---  eliminar flujo

SELECT  ' --- ELIMINAR  tablas de operacion '

DELETE FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoVariable where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo

DELETE FROM  FlujoTrabajoHistorial where Idinstancia=999999
DELETE FROM FlujoTrabajoVariable where  Idinstancia=999999
DELETE FROM FlujoTrabajoInstancia  where  Idinstancia=999999