SELECT  ' ---  INSERCION DE  CATALOGOS DE FLUJO  '

declare  @IdFlujoTrabajo int = 30



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
VALUES (@IdFlujoTrabajo, 1, N'CREPEN', N'Crédito pensionados', N' Crédito pensionados', NULL, NULL, NULL, NULL, 1, 1)

SET IDENTITY_INSERT [dbo].[FlujoTrabajo] OFF


SELECT  ' ---   clasificacion'

INSERT  INTO FlujoTrabajoClasificacion  SELECT  'Solicitud',1,@IdFlujoTrabajo,1
SELECT   * FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  actividad  '

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PM','Realizar prospección Mejoravit','Realizar prospección Mejoravit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PEM','Realizar propuesta economica Mejoravit','Realizar prospección Mejoravit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'IEM','Integrar expediente Mejoravit','Integrar expediente Mejoravit','','','',getdate(),2,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'LSM','Llenar solicitud Mejoravit','Llenar solicitud Mejoravit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'MCM','Entregar expediente a Mesa Control Mejoravit','Mesa Control Mejoravit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'RAM','Recibir Aviso Retención Mejoravit','Recibir Aviso Retención Mejoravit','','','',getdate(),2,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'EAM','Enviar Aviso Retención a cliente Mejoravit','Enviar Aviso Retención a cliente Mejoravit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'EEAM','Entregar y Escanear Aviso Retención Mejoravit','Escanear y entregar Aviso Retención Mejoravit','','','',getdate(),4,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'EAMCM','Enviar Aviso Retención Escaneado a Mesa Control Mejoravit','Enviar Aviso Retención Escaneado a Mesa Control Mejoravit','','','',getdate(),5,1

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FFM','Firmar FIDECOMISO Mejoravit','Firmar FIDECOMISO Mejoravit','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'AM','Depositar Anticipo 20% Mejoravit','Depositar anticipo 20% Mejoravit ','','','',getdate(),7,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FM','Depositar Finiquito 80% Mejoravit','Depositar Finiquito 80% Mejoravit','','','',getdate(),15,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FINM','Finalizar ','Finalizar ','','','',getdate(),1,1

SELECT  ' ----  estatus  '

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PM_R','Prospección realizada','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PM_D','Prospección detenida','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PM_C','Prospección cancelada','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PEM_R','Propuesta economica realizada','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'IEM_R','Expediente  Integrado ','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'LSM_R','Solicitud Llenada','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'MCM_R','Expediente en Mesa Control','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'RAM_R','Aviso Retención recibido','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAM_R','Aviso Retención enviado a cliente','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EEAM_R','Aviso Retención entregado y escaneado','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAMCM_R','Aviso Retención en Mesa Control','',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FFM_R','Expediente Firmado FIDECOMISO','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'AM_R','Anticipo realizado','',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FM_R','Finiquito realizado','',1


SELECT  ' ----  Tarea  '


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,1, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PM' )  , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,2, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PEM' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo,
 (SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,3, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='IEM' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,4, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='LSM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,5, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='MCM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,6, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,7, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,8, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EEAM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,9, (SELECT Max(IdActividad) FROM FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAMCM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,10, (SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FFM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,11, (SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='AM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,12, (SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FM') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,13, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FINM') , 0



SELECT  ' ---  ESTATUS DE TAREAS '



INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PM')),  ---tarea actividad
 1,'INICIA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PEM')), 1  --- actividad tarea siguiente

INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PM')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PM_D'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PM')), 1  --- actividad tarea siguiente

   INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PM')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PM_C'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND  clave='FINM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PEM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PEM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='IEM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='IEM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='IEM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND  clave='LSM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='LSM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='LSM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='MCM')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='MCM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='MCM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAM')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='RAM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='RAM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='EAM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EEAM')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EEAM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='EEAM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAMCM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='EAMCM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='EAMCM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FFM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FFM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FFM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='AM')), 1  --- actividad tarea siguiente
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='AM')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='AM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FM')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FM')),  ---tarea actividad
 1,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FM_R'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='FINM')), 1  --- actividad tarea siguiente



 
---   Resonsabilidades por actividad

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE IdFlujoTrabajo=@IdFlujoTrabajo AND clave='PE')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1



SELECT * FROM  FlujoTrabajo  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoClasificacion  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoTareaEstatus  where IdTarea IN ( SELECT IdTarea from  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo )
SELECT * FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT * FROM  FlujoTrabajoAsignacionActividad  where IdFlujoTrabajo=@IdFlujoTrabajo



-----  OPERACION



exec VerFlujoTrabajo 'MEJORAVIT', 1

EXEC ConsultarHistorial 'MEJORAVIT','100'

EXEC Seguimiento 'MEJORAVIT','100'

EXEC  AvanzarActividad 'MEJORAVIT','100', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2 , @Importe:50000, @Nombre: IMELDA CARRILLO ESTRADA , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'

EXEC  AvanzarActividad 'MEJORAVIT','100', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:CURP, @Numero: 2 , @Importe:50000, @Nombre: IMELDA CARRILLO ESTRADA , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D'


EXEC Seguimiento 'MEJORAVIT','100'
EXEC ConsultarHistorial 'MEJORAVIT','100'

exec VerEstadisticasFlujoTrabajoPorTarea '','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'MEJORAVIT','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'MEJORAVIT','IdSocio=1',1          --- NO FUNCIONO
exec VerEstadisticasFlujoTrabajoPorTarea 'MEJORAVIT','IdPerfil=1',1         --- NO FUNCIONO

exec VerlujoTrabajoPorTareaDetalle  'MEJORAVIT', '',1   
exec VerlujoTrabajoPorTareaDetalle  'MEJORAVIT', 'IdTarea=42,IdSocio=1',1   --- NO FUNCIONO

exec VerEstadisticasFlujoPorVariable 'MEJORAVIT', 'IdSocio=1 ', 1			 --- NO FUNCIONO
exec VerEstadisticasFlujoPorVariable 'MEJORAVIT', ',@IdGrupo=B&D', 1	


--------------------  ESTADISTICAS 

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1' ,1

EXEC VerEstadisticasFlujoPorVista  '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVista  '','vista=1, IdFlujo=20' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro '','vista=1, IdFlujo=20' ,1


EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'MEJORAVIT','vista=1' ,1

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK)   where IdFlujoTrabajo=20
SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)  where IdFlujoTrabajo=20
SELECT * FROM   FlujoTrabajoVariable w WITH (NOLOCK)  where IdFlujoTrabajo=20



declare  @IdFlujoTrabajo int = 20

---  eliminar flujo

SELECT  ' --- ELIMINAR  tablas de operacion '

DELETE FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoVariable where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo

DELETE FROM  FlujoTrabajoHistorial where Idinstancia=74
DELETE FROM FlujoTrabajoVariable where  Idinstancia=74
DELETE FROM FlujoTrabajoInstancia  where  Idinstancia=74