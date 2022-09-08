
--- agregar tiempo limite por actividad

--- considerar  el tiempo trascurrido a partir de ultimo cambio de estatus de la siguiente actividad para considerar tiempo desde termino la actvidad anterior
--- estdisticas de general  de flujo de trabajo
--- consulta de instancias por tarea
--- estdisticas de variable de proceso
--- agregar  nivel a socio o susciptor
-- implmentar actividades y estus basicos  y alternos
--- agregar variable de proceso  expecificas del negocio , por ejemplo identificador socio y id cliente
--- considerar varios   flujos en las consultasy estadisticas
--- terminar  flujo
--- estandarizar sp´s

---pendientes

---flujo de trabajo

--- mejorar sp  avance tarea
--- implmentar actividades simultaneas
--- agregar condiciones de negocio para cambiar el fluo de trabajo

-
--- agregar parametro de configuracion de  tiempo actividad  en minutos, dias



--- forma  para cambio  de estatus  en app 
--- api  rest  psrs ejecutar sp´s
--- imtegrar  panatallas  para  consulta  de flujo de trabajo

---seguridad
--- agregar IdPerfil,IdGrupo.IdArea en tabla de usuario y  pasar en el  flujo de trabajo

---socios os suscriptores

--- definir red  socios y consulta  estadisticas ,clientes, y tramites


	

use DB_A72B95_drp


--select 1,* FROM  dbo.ObtenerLista ('1-2-3','-') 
--select dbo.StringSplit ('NOMBRE:FRANCISCO',':',1) FROM  

---   CONSULTA


declare  @IdFlujoTrabajo int = 10



---  eliminar flujo
BEGIN TRANSACTION

SELECT  ' --- ELIMINAR  tablas de operacion '

DELETE FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
DELETE FROM FlujoTrabajoVariable
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

-- ROLLBACK TRANSACTION

--- COMMIT TRANSACTION



SELECT  ' ---  consulta flujo '



SELECT  ' ---   tabals  catalogos '

SELECT   * FROM  FlujoTrabajo where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   * FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   * FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   * FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   * FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   te.* FROM  FlujoTrabajoTarea t INNER JOIN FlujoTrabajoTareaEstatus te  ON t.IdTarea=te.IdTarea where IdFlujoTrabajo=@IdFlujoTrabajo
--- SELECT   * FROM  FlujoTrabajoTarea t INNER JOIN FlujoTrabajoTareaEstatus te  ON t.IdTarea=te.IdTarea
select  *  FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo
select  *  FROM   FlujoTrabajoAsignacionActividad where IdFlujoTrabajo=@IdFlujoTrabajo

---  tablas de operacion

SELECT   * FROM FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT   * FROM FlujoTrabajoVariable
SELECT   * FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo


SELECT  ' ---  INSERCION DE  CATALOGOS DE FLUJO  '

---declare  @IdFlujoTrabajo int = 10

SET IDENTITY_INSERT [dbo].[FlujoTrabajo] ON 

SELECT  ' ---   flujp de trabajo'
INSERT [dbo].[FlujoTrabajo] ([IdFlujoTrabajo], [NumeroVersion], [Clave], [Nombre], [Descripcion], [FechaInicio], [FechaTerninacion], [IdFlujoTrabajoAnterior], [IdPlaneacionCaptura],IdSuscriptor, [Activo]) VALUES (@IdFlujoTrabajo, 1, N'LINEAIV', N'Línea IV', N' Crédito Línea IV', NULL, NULL, NULL, NULL, 1, 1)

SET IDENTITY_INSERT [dbo].[FlujoTrabajo] OFF


SELECT  ' ---   clasificacion'

INSERT  INTO FlujoTrabajoClasificacion  SELECT  'Solicitud',1,@IdFlujoTrabajo,1
SELECT   * FROM  FlujoTrabajoClasificacion where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  actividad  '

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PRO','Realizar prospección','Realizar prospección','','','',getdate(),1,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PROSOL','Solventar prospección','Solventar prospección','','','',getdate(),1,1

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PROECO','Realizar propuesta ecónomica','Realizar propuesta ecónomica','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'INTEXP','Integrar expediente','Integrar expediente','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'LLEPAP','Llenar papelería','Llenar papelería','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'SOLICITARAVALUO','Solicitar Avaluo','Solicitar Avaluo','','','',getdate(),8,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'REALIZARAVALUO','Realizar Avaluo','Realizar Avaluo','','','',getdate(),8,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PRESUPUESTO','Realizar Presupuesto','Realizar Presupuesto','','','',getdate(),11,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'VOBO','Conseguir vo. bo. expediente','Conseguir vo. bo. expediente','','','',getdate(),2,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'IMPRESION','Impirmir expediente','Impirmir expediente','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FIRMA','Firmar expediente','Firmar expediente','','','',getdate(),3,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'INSCRIPCION','Inscribir en infonavit','Inscribir en infonavit','','','',getdate(),1,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'AVIRET','Obtener aviso retención ','Obtener aviso retención','','','',getdate(),4,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'SELLAR','Sellar y firmar por Nomina y Fid ','Sellar y firmar por Nomina y Fid ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FORMALIZACREDITO','Formalizar y ajustar  Crédito ','Formalizar y ajustar  Crédito ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'DEPOSITO','Depositar  anticipo ','Depositar  anticipo ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'OBRA','Realizar Obra ','Realizar Obra ','','','',getdate(),30,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FINIQUITAR','Dar y finiquitar ','Dar y finiquitar  ','','','',getdate(),5,1

---declare  @IdFlujoTrabajo int = 10


INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FO','Firmar Obra Terminada ','Firmar Obra Terminada  ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'EK','Invitar a Experiencia Kungio ','Invitar a Experiencia Kungio ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'AS',' Entregar Aviso de Suspensión ','Entregar Aviso de Suspensión ','','','',getdate(),5,1

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FIN','Finalizar','Finalizar','','','',getdate(),1,0

SELECT   * FROM  FlujoTrabajoActividad  where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  estatus  '


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRO_REA','Prospección realizada','Prospección realizada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRO_DET','Prospección detenida','Prospección detenida',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRO_CAN','Prospección cancelada','Prospección cancelada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PROECO_REA','Propuesta ecónomica realizada','Propuesta ecónomica realizada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PROECO_DET','Propuesta ecónomica detenida','Propuesta ecónomica detenida',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PROECO_CAN','Propuesta ecónomica cancelada','Propuesta ecónomica cancelada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'INTEXP_REA','Expediente  Integrado ','Expediente  Integrado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'INTEXP_CAN','Expediente  cancelado ','Expediente  cancelado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'LLEPAP_REA','Papelería llenada','Papelería llenada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SOLICITARAVALUO_FIR','Solicitud Avaluo firmada ','Solicitud Avaluo firmada ',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SOLICITARAVALUO_CAN','Solicitud Avaluo cancelada ','Solicitud Avaluo cancelada ',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'REALIZARAVALUO_COR','Visita avaluo coordinada','Visita avaluo coordinada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'REALIZARAVALUO_REA','Visita avaluo realizada','Visita avaluo realizada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'REALIZARAVALUO_AUT','Avaluo autorizadoo','Avaluo autorizado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'REALIZARAVALUO_CAN','Avaluo cancelado','Avaluo cancelado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRESUPUESTO_REA','Presupuesto realizado','Presupuesto realizado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRESUPUESTO_REC','Presupuesto rechazado','Presupuesto rechazado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'PRESUPUESTO_CAN','Presupuesto cancelado','Presupuesto cancelado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'VOBO_REA','Visto bueno realizado','Visto bueno realizado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'VOBO_DET','Visto bueno detenido','Visto bueno detenido',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'VOBO_CAN','Visto bueno cancelado','Visto bueno cancelado',1


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'IMPRESION_REA','Impresión realizada','Impresión realizada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FIRMA_REA','Firma realizado','Papelería llenada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FIRMA_CAN','Firma cancelada','Firma cancelada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'INSCRIPCION_REA','Inscripción realizada','Inscripción realizada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'INSCRIPCION_REC','Inscripción rechazada','Inscripción rechazada',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'AVIRET_REA','Aviso retención realizado','Aviso retención realizadoa',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'AVIRET_REC','Aviso retención  rechazado','Aviso retención  rechazado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'AVIRET_DET','Aviso retención  detenido','Aviso retención  detenido',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'AVIRET_CAN','Aviso retención  cancelado','Aviso retención  cancelado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SELLAR_REA','Sellado y firmado','Sellado y firmado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SELLAR_REC','Sello y firma rechazada','Sello y firma rechazada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SELLAR_DET','Sello y firm detenida','Sello y firm detenida',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'SELLAR_CAN','Sello y firma cancelado','Sello y firm cancelado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FORMALIZACREDITO_REA','Formalización  y ajuste  realizado','Formalización  y ajuste  realizado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'DEPOSITO_REA','Deposito realizado','Deposito realizado',1

INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'OBRA_REA','Obra realizada','Obra realizada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'OBRA_DET','Obra detenida','Obra detenida',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'OBRA_REC','Obra rechazada','Obra rechazada',1


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FINIQUITAR_REA','Finiquito realizado','Finiquito realizado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FINIQUITAR_DET','Finiquito detenido','Finiquito detenido',1



INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FOT_FIR','Obra firmada','Obra firmada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'IEK_ENT','IEK Entregado','IEK Entregado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAS_EMI','Aviso Suspensión Emitido','Aviso Suspensión Emitido',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAS_ENT','Aviso Suspensión Entregado ','Aviso Suspensión Entregado',1


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FIN','Finalizado','Finalizado',0






SELECT   * FROM  FlujoTrabajoEstatus  where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  ' ----  Tarea  '

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,1, (SELECT  IdActividad  FROM  FlujoTrabajoActividad WHERE clave='PRO' )  , 1

--INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
--(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,1, (SELECT  Max(IdActividad)  FROM  FlujoTrabajoActividad WHERE clave='PROSOL' )  , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,2, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='PROECO' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo,
 (SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,3, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='INTEXP' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,4, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='LLEPAP') , 1


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,5, (SELECT  IdActividad  FROM  FlujoTrabajoActividad WHERE clave='SOLICITARAVALUO' )  , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,6, (SELECT  IdActividad  FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO' )  , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,7, (SELECT  Max(IdActividad)  FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO' )  , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,8, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='VOBO' ) , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,9, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='IMPRESION' ) , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,10, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='FIRMA' ) , 1


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo,
 (SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,11, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,12, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='AVIRET') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,13, (SELECT  Max(IdActividad)  FROM  FlujoTrabajoActividad WHERE clave='SELLAR' )  , 1

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,14, (SELECT  Max(IdActividad)  FROM  FlujoTrabajoActividad WHERE clave='FORMALIZACREDITO' )  , 1


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo,
 (SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion WHERE Nombre= 'Solicitud') ,15, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='DEPOSITO' ) , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,16, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='OBRA') , 1
INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,17, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR') , 1




INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,20, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='FOT') , 0

INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,30, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='IEK') , 0


INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,40, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='EAS') , 0



INSERT  INTO  FlujoTrabajoTarea SELECT  @IdFlujoTrabajo, 
(SELECT MAx(IdFlujoTrabajoClasificacion) FROM FlujoTrabajoClasificacion  WHERE Nombre= 'Solicitud') ,100, (SELECT  Max(IdActividad)   FROM  FlujoTrabajoActividad WHERE clave='FIN') , 0


SELECT   * FROM  FlujoTrabajoTarea  where IdFlujoTrabajo=@IdFlujoTrabajo




SELECT  ' ---  ESTATUS DE TAREAS '



INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),  ---tarea actividad
 1,'INICIA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')), 1  --- actividad tarea siguiente

INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRO_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')), 1  --- actividad tarea siguiente


-- INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),  ---tarea actividad
-- 0,'AT','','','',
-- (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRODET'),   -- estatus  actividad
-- (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROSOL')), 1  --- actividad tarea siguiente



INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente

 
-- INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROSOL')),  ---tarea actividad
-- 1,'AT','','','',
-- (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PROSOL'),   -- estatus  actividad
-- (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')), 1  --- actividad tarea siguiente




 -----------------------------------------PROECO-----------------------------------------------------------------------

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PROECO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INTEXP')), 1  --- actividad tarea siguiente


  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PROECO_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')), 1  --- actividad tarea siguiente

   INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PROECO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente


  ----------------------------------------------INTEXP-------------------------------------------------------------------



 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INTEXP')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='INTEXP_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='LLEPAP')), 1  --- actividad tarea siguiente
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INTEXP')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='INTEXP_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente


 ----------------------------------------------LLEPAP-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='LLEPAP')),  ---tarea actividad
 1,'SIMULTANEA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='LLEPAP_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SOLICITARAVALUO')), 1  --- actividad tarea siguiente


   INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='LLEPAP')),  ---tarea actividad
 1,'SIMULTANEA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='LLEPAP_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')), 1  --- actividad tarea siguiente



  ----------------------------------------------SOLICITAR AVALUO-------------------------------------------------------------------
 


  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SOLICITARAVALUO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SOLICITARAVALUO_FIR'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SOLICITARAVALUO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SOLICITARAVALUO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente

   ----------------------------------------------REALIZAR  AVALUO-------------------------------------------------------------------




  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')),  ---tarea actividad
 1,'CONTINUA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='REALIZARAVALUO_AUT'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='REALIZARAVALUO_COR'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='REALIZARAVALUO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')), 1  --- actividad tarea siguiente


   INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='REALIZARAVALUO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente




  ----------------------------------------------PRESUPUESTO-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRESUPUESTO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRESUPUESTO_REC'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='PRESUPUESTO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente




  ----------------------------------------------VOBO-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='VOBO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='IMPRESION')), 1  --- actividad tarea siguiente
  
 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='VOBO_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='VOBO_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente


   ----------------------------------------------IMPRESION-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='IMPRESION')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='IMPRESION_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIRMA')), 1  --- actividad tarea siguiente


   ----------------------------------------------FIRMA-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIRMA')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FIRMA_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIRMA')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FIRMA_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente

    ----------------------------------------------INSCRIPCION-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='INSCRIPCION_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='INSCRIPCION_REC'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION')), 1  --- actividad tarea siguiente


 
  ----------------------------------------------AVIRET-------------------------------------------------------------------



 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='AVIRET_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')), 1  --- actividad tarea siguiente
 

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='AVIRET_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='AVIRET_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente



    ----------------------------------------------SELLAR-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SELLAR_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FORMALIZACREDITO')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SELLAR_REC'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INTEXP')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SELLAR_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')), 1  --- actividad tarea siguiente

   INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='SELLAR_CAN'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente


     ----------------------------------------------FORMALIZAR CREDITO y AJUSTAR -------------------------------------------------------------------
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FORMALIZACREDITO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FORMALIZACREDITO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='DEPOSITO')), 1  --- actividad tarea siguiente


 --SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FORMALIZARCREDITO'
 --SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FORMALIZACREDITO_REA'
 --SELECT * FROM  FlujoTrabajoTarea
 --SELECT * FROM  FlujoTrabajoTareaEstatus
  
     ----------------------------------------------DEPOSITO-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='DEPOSITO')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='DEPOSITO_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')), 1  --- actividad tarea siguiente


     ----------------------------------------------OBRA-------------------------------------------------------------------
 
  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='OBRA_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='OBRA_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')), 1  --- actividad tarea siguiente

  INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='OBRA_REC'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')), 1  --- actividad tarea siguiente


 
     ----------------------------------------------OBRA-------------------------------------------------------------------
 
 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FINIQUITAR_REA'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FOT')), 1  --- actividad tarea siguiente

 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR')),  ---tarea actividad
 0,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FINIQUITAR_DET'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR')), 1  --- actividad tarea siguiente

 ----------------------------------------------------------------------------------------------------------------------------


 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OT')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='FOT_FIR'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='EK')), 1  --- actividad tarea siguiente


 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='EK')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='IEK_ENT'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AS')), 1  --- actividad tarea siguiente


 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AS')),  ---tarea actividad
 1,'AT','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='EAS_EMI'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='ES')), 1  --- actividad tarea siguiente


 INSERT  INTO  FlujoTrabajoTareaEstatus SELECT
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='EAS')),  ---tarea actividad
 0,'TERMINA','','','',
 (SELECT Max(IdEstatus) FROM  FlujoTrabajoEstatus WHERE clave='EAS_ENT'),   -- estatus  actividad
 (SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIN')), 1  --- actividad tarea siguiente


-- SELECT  * FROM    FlujoTrabajoEstatus
-- SELECT  * FROM   FlujoTrabajoTareaEstatus  WHERE  idestatus=40

--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FOT')

--SELECT  * FROM FlujoTrabajoTarea WHERE IdActividad=19

--SELECT * FROM  FlujoTrabajoActividad

--update   FlujoTrabajoTareaEstatus
--set accion='AT' , IdtareaSiguiente=19
--  WHERE  idestatus=40


 /*
 declare  @IdFlujoTrabajo int = 10


INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'FOT_FIR','Obra firmada','Obra firmada',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'IEK_ENT','IEK Entregado','IEK Entregado',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAS_EMI','Aviso de Suspensión Emitido ','Aviso de Suspensión Emitido',1
INSERT  INTO  FlujoTrabajoEstatus SELECT  @IdFlujoTrabajo,'EAS_ENV','Aviso de Suspensión Enviado ','Aviso de Suspensión Enviado',1

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FOT','Firmar Obra Terminada ','Firmar Obra Terminada  ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'IEK','Invitar a Experiencia Kungio ','Invitar a Experiencia Kungio ','','','',getdate(),5,1
INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'EAS',' Entregar Aviso de Suspensión ','Entregar Aviso de Suspensión ','','','',getdate(),5,1

INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FIN','Finalizar','Finalizar','','','',getdate(),1,0

*/
 
SELECT   te.* FROM  FlujoTrabajoTarea t INNER JOIN FlujoTrabajoTareaEstatus te  ON t.IdTarea=te.IdTarea where IdFlujoTrabajo=@IdFlujoTrabajo


SELECT   * FROM   FlujoTrabajoEstatus

---  ejecutar   segunda parte





--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PRO','Realizar prospección','Realizar prospección','','','',getdate(),1,1
----INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PROSOL','Solventar prospección','Solventar prospección','','','',getdate(),1,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PROECO','Realizar propuesta ecónomica','Realizar propuesta ecónomica','','','',getdate(),1,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'INTEXP','Integrar expediente','Integrar expediente','','','',getdate(),5,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'LLEPAP','Llenar papelería','Llenar papelería','','','',getdate(),1,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'SOLICITARAVALUO','Solicitar Avaluo','Solicitar Avaluo','','','',getdate(),8,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'REALIZARAVALUO','Realizar Avaluo','Realizar Avaluo','','','',getdate(),8,1

--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'PRESUPUESTO','Realizar Presupuesto','Realizar Presupuesto','','','',getdate(),11,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'VOBO','Conseguir vo. bo. expediente','Conseguir vo. bo. expediente','','','',getdate(),2,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'IMPRESION','Impirmir expediente','Impirmir expediente','','','',getdate(),1,1

--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FIRMA','Firmar expediente','Firmar expediente','','','',getdate(),3,1

--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'INSCRIPCION','Inscribir en infonavit','Inscribir en infonavit','','','',getdate(),1,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'AVIRET','Obtener aviso retención ','Obtener aviso retención','','','',getdate(),4,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'SELLAR','Sellar y firmar por Nomina y Fid ','Sellar y firmar por Nomina y Fid ','','','',getdate(),5,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FORMALIZARCREDITO','Formalizar y ajustar  Crédito ','Formalizar y ajustar  Crédito ','','','',getdate(),5,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'DEPOSITO','Depositar  anticipo ','Depositar  anticipo ','','','',getdate(),5,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'OBRA','Realizar Obra ','Realizar Obra ','','','',getdate(),30,1
--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FINIQUITAR','Dar y finiquitar ','Dar y finiquitar  ','','','',getdate(),5,1

--INSERT  INTO  FlujoTrabajoActividad SELECT  @IdFlujoTrabajo,'FIN','Finalizar','Finalizar','','','',getdate(),1,0

SELECT * FROM PERFIL 


---  ejecutar   segunda   parte 

---   Resonsabilidades por actividad

declare  @IdFlujoTrabajo int = 10

declare  @Identificador varchar(20)= '003'
DELETE  FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PROECO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INTEXP')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Socio' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Socio' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='LLEPAP')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Gestor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Gestor' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SOLICITARAVALUO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Fideicomiso' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Fideicomiso' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='REALIZARAVALUO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Fideicomiso' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Fideicomiso' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRESUPUESTO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='VOBO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Fideicomiso' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Fideicomiso' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='IMPRESION')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Impresor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Impresor' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FIRMA')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='INSCRIPCION')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Gestor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Gestor' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AVIRET')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Gestor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Gestor' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='SELLAR')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FORMALIZARCREDITO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='DEPOSITO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Gestor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Gestor' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='OBRA')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FINIQUITAR')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Gestor' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Gestor' ),1,1


INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='FO')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='EK')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1

INSERT  INTO  FlujoTrabajoResponsableActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='AS')),
'IdPerfil', (SELECT MAX(id) FROM PERFIL  WHERE nombre='Arquitecto' ),(SELECT MAX(nombre) FROM PERFIL  WHERE nombre='Arquitecto' ),1,1


SELECT  *  FROM  FlujoTrabajoResponsableActividad  where IdFlujoTrabajo=@IdFlujoTrabajo



SELECT  *  FROM  FlujoTrabajoActividad
SELECT  *  FROM  FlujoTrabajoEstatus

UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'P'   WHERE CLAVE = 'PRO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'PE'  WHERE CLAVE = 'PROECO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'IE'  WHERE CLAVE = 'INTEXP'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'LP'  WHERE CLAVE = 'LLEPAP'

UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'SA'  WHERE CLAVE = 'SOLICITARAVALUO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'RA'  WHERE CLAVE = 'REALIZARAVALUO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'RP'  WHERE CLAVE = 'PRESUPUESTO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'VB' WHERE CLAVE = 'VOBO'

UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'IE'  WHERE CLAVE = 'IMPRESION'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'FE'  WHERE CLAVE = 'FIRMA'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'II'  WHERE CLAVE = 'INSCRIPCION'


UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'AR'  WHERE CLAVE = 'AVIRET'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'SF'  WHERE CLAVE = 'SELLAR'

UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'FC'  WHERE CLAVE = 'FORMALIZACREDITO'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'D'  WHERE CLAVE = 'DEPOSITO'


UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'O'  WHERE CLAVE = 'OBRA'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'F'  WHERE CLAVE = 'FINIQUITAR'

UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'FO'  WHERE CLAVE = 'FOT'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'EK'  WHERE CLAVE = 'IEK'
UPDATE  FlujoTrabajoActividad  SET  CLAVE = 'AS'  WHERE CLAVE = 'AS'

---  ejecutar   tercer   parte 








SELECT  ' PROCEDIMIENTOS  '
exec VerFlujoTrabajo 'LINEAIV', 0


	
EXEC  AvanzarActividad '001','LINEAIV','','',null,null,'PACO',  'DES', 'CLAS',100, 10,'ref','@IdSocio:1,@IdGrupo:SOCCER', 'obs','usuario','Perfil','equipo','resultado','INICIAR',0,null,null

EXEC  AvanzarActividad '001','LINEAIV','','',null,null,'PACO',  'DES', 'CLAS',100, 10,'ref','@IdSocio:1,@IdGrupo:SOCCER', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null



EXEC  AvanzarActividad '002','LINEAIV','','',null,null,'JUAN',  'DES', 'CLAS',100, 10,'ref','@IdSocio:2,@IdGrupo:ALMA', 'obs','usuario','Perfil','equipo','resultado','INICIAR',0,null,null

EXEC  AvanzarActividad '002','LINEAIV','','',null,null,'JUAN',  'DES', 'CLAS',100, 10,'ref','@IdSocio:2,@IdGrupo:ALMA', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null

EXEC  AvanzarActividad '002','LINEAIV','','PROREC',null,null,'JUAN',  'DES', 'CLAS',100, 10,'ref','@IdSocio:2,@IdGrupo:ALMA', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null


EXEC  AvanzarActividad '003','LINEAIV','','',null,null,'VANE',  'DES', 'CLAS',100, 10,'ref','@IdSocio:3,@IdGrupo:KUNGIO', 'obs','usuario','Perfil','equipo','resultado','INICIAR',0,null,null

EXEC  AvanzarActividad '003','LINEAIV','','PRODET',null,null,'VANE',  'DES', 'CLAS',100, 10,'ref','@IdSocio:3,@IdGrupo:KUNGIO', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null

EXEC  AvanzarActividad '003','LINEAIV','','PROREA',null,null,'VANE',  'DES', 'CLAS',100, 10,'ref','@IdSocio:3,@IdGrupo:KUNGIO', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null


EXEC  AvanzarActividad '004','LINEAIV','','',null,null,'MITZI',  'DES', 'CLAS',100, 10,'ref','@IdSocio:4,@IdGrupo:B AND D', 'obs','usuario','Perfil','equipo','resultado','INICIAR',0,null,null

EXEC  AvanzarActividad '004','LINEAIV','','PROCAN',null,null,'MITZI',  'DES', 'CLAS',100, 10,'ref','@IdSocio:4,@IdGrupo:B AND D', 'obs', 'usuario','Perfil','equipo','resultado','TERMINAR',0,null,null

USE DRP
exec VerFlujoTrabajo 'LINEAIV', 0

EXEC Seguimiento 'LINEAIV','001'
EXEC ConsultarHistorial 'LINEAIV','001'

EXEC Seguimiento 'LINEAIV','030'
EXEC ConsultarHistorial 'LINEAIV','030'

EXEC Seguimiento 'LINEAIV','027'
EXEC ConsultarHistorial 'LINEAIV','027'

EXEC Seguimiento 'LINEAIV','2021'
EXEC ConsultarHistorial 'LINEAIV','2021'







----   con variables 

select convert (int ,  importe )/1000 from  FlujoTrabajoInstancia



exec  ConsultarMisPendientes 'LINEAIV','',1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','',1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', '', 1
exec VerEstadisticasFlujoTrabajoPorEstatus 'LINEAIV','',1

exec  ConsultarMisPendientes 'LINEAIV','IdPerfil=2',1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdPerfil=2',1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdSocio=4',1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdSocio=4', 1
exec VerEstadisticasFlujoTrabajoPorEstatus  'LINEAIV','IdSocio=4',1
------------------------------------

exec  VerProductividadPorTarea 'LINEAIV','',1

exec  VerProductividadPorTarea 'LINEAIV','IdPerfil=2',1
exec VerEstadisticasFlujoTrabajoPorEstatus  'LINEAIV','IdSocio=4',1

----------------------------------------

SELECT * FROM   persona WITH (NOLOCK) 
SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 
SELECT * FROM FlujoTrabajoVariable

exec VerEstadisticasFlujoPorVariable 'LINEAIV', '', 1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdSocio=1,IdGrupo=B&D ', 1

exec VerInstanciasFlujoPorTarea 'LINEAIV', 3

---- detalle  
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 1,1

VerProductividadPorTareaDetalle
VerEstadisticasTrabajoPorEstatusHistorial
VerEstadisticasPorVariableHistorial


SELECT  *  FROM FlujoTrabajoVariable
---- '@IdSocio:3,@IdGrupo:KUNGIO'

SELECT T.Orden, T.IdTarea,A.IdActividad , A.Clave, A.Nombre, e.IdEstatus, E.Clave, E.Nombre,TE.IdTareaSiguiente,ASI.Clave,ASI.Nombre  FROM  
 FlujoTrabajoTarea T   WITH (NOLOCK) 
LEFT  OUTER  JOIN FlujoTrabajoTareaEstatus TE WITH (NOLOCK)  ON TE.IdTarea =T.IdTarea 
LEFT  OUTER  JOIN FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=TE.IdEstatus
LEFT  OUTER  JOIN FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=T.IdActividad  
LEFT  OUTER  JOIN FlujoTrabajoTarea TS  WITH  (NOLOCK) ON  TS.IdTarea=TE.IdTareaSiguiente 
LEFT  OUTER  JOIN FlujoTrabajoActividad ASI  WITH  (NOLOCK) ON  ASI.IdActividad=TS.IdActividad  




---  ejecutar   cuarta al final   parte despues generar instancias



declare  @IdFlujoTrabajo int = 10

declare  @Identificador varchar(20)= '001'


---  ASIGNACIÓN  DE   Resonsabilidades



SELECT ' ASIGNACIÓN  DE   Resonsabilidades '

SET @Identificador= '002'

INSERT  INTO  FlujoTrabajoAsignacionActividad SELECT
@IdFlujoTrabajo,
(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),
(SELECT  MAX(IdTarea) FROM FlujoTrabajoInstancia WHERE Identificador=@Identificador),
'@IdUsuario', '1','fgarcia', getdate(),'',1

SET @Identificador= '002'


SELECT  *  FROM   FlujoTrabajoAsignacionActividad where IdFlujoTrabajo=10


---  VARIABLES

--SELECT ' VARIABLES '
--INSERT  INTO  FlujoTrabajoVariable SELECT
--@IdFlujoTrabajo,
--(SELECT  MAX(IdInstancia) FROM FlujoTrabajoInstancia WHERE Identificador=@Identificador),
--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),
--'@IdGrupo ', 'sOCCER',1

--INSERT  INTO  FlujoTrabajoVariable SELECT
--@IdFlujoTrabajo,
--(SELECT  MAX(IdInstancia) FROM FlujoTrabajoInstancia WHERE Identificador=@Identificador),
--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),
--'@IdGrupo ', 'Administradores',1

--SET @Identificador= '002'
--INSERT  INTO  FlujoTrabajoVariable SELECT
--@IdFlujoTrabajo,
--(SELECT  MAX(IdInstancia) FROM FlujoTrabajoInstancia WHERE Identificador=@Identificador),
--(SELECT  MAX(IdTarea) FROM FlujoTrabajoTarea WHERE IdActividad IN  ( SELECT Max(IdActividad) FROM  FlujoTrabajoActividad WHERE clave='PRO')),
--'@IdGrupo ', 'Administradores',1

SELECT  *  FROM  FlujoTrabajoVariable


