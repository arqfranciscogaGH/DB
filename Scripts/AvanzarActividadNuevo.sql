use  DB_A72B95_drp

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) INNER JOIN 
SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)


SELECT * FROM CuentaUsuario   U WITH (NOLOCK)
SELECT * FROM Cliente   C WITH (NOLOCK)
--------------------------------------- AvanzarActividad


---- INICIAR

EXEC  AvanzarActividad 'LINEAIV','005', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

EXEC  AvanzarActividad 'LINEAIV','005', 'MODIFICAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:200,@IdGrupo:B&D'


EXEC  AvanzarActividad 'LINEAIV','005', 'TERMINAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

exec  ConsultarMisPendientes 'LINEAIV','',1




EXEC  AvanzarActividad 'LINEAIV','101101', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: Juan Perez Lopez , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

exec  ConsultarMisPendientes 'LINEAIV','',1

EXEC  AvanzarActividad 'LINEAIV','101101', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: Juan Perez Lopez , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'


EXEC  AvanzarActividad 'LINEAIV','209408', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: Hector Aquino Ramirez   , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

exec  ConsultarMisPendientes 'LINEAIV','',1

EXEC  AvanzarActividad 'LINEAIV','209408', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: Hector Aquino Ramirez  , @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'



EXEC  AvanzarActividad 'LINEAIV','101', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

EXEC  AvanzarActividad 'LINEAIV','102', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:610000'

EXEC  AvanzarActividad 'LINEAIV','103', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:910000'



EXEC  AvanzarActividad 'LINEAIV','101', 'TERMINAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

EXEC  AvanzarActividad 'LINEAIV','102', 'TERMINAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:610000'

EXEC  AvanzarActividad 'LINEAIV','103', 'TERMINAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:910000'



---- TERMINAR

EXEC  AvanzarActividad 'LINEAIV','100', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

EXEC  AvanzarActividad 'LINEAIV','100', 'TERMINAR','108','REALIZARAVALUO_AUT', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'
EXEC  AvanzarActividad 'LINEAIV','100', 'TERMINAR','109','PRESUPUESTO_REA', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'



EXEC  AvanzarActividad 'LINEAIV','101', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

---- detalle  

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdPerfil=2',1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdSocio=4',1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 'IdTarea=7,IdSocio=4',1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV', 'IdGrupo=7',1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 'IdTarea=7,IdGrupo=7',1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV', 'IdSocio=4,IdGrupo=4 ',1
exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 'IdTarea=11,IdSocio=4,IdGrupo=4 ',1

SELECT   I.IdInstancia,H.IdTarea,Variable, Valor  FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 
INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON H.IdInstancia=I.IdInstancia 
LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
WHERE H.IdEstatusTarea in ('0', '1', '2')  and  H.IdTarea=7  AND Variable='IdSocio'  and  Valor='4'  


exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdSocio=4',1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdSocio=4 ', 1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','' ,1
exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdGrupo=6' ,1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdSocio=1016' ,1

exec VerEstadisticasFlujoPorVariable 'LINEAIV', '', 1

exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdGrupo=2', 1
---- ConsultarMisPendientes



exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV', 'IdSocio=4',1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdSocio=4 ', 1

exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 'IdTarea=11,IdSocio=4 ',1

exec VerEstadisticasFlujoTrabajoPorTarea 'LINEAIV','IdGrupo=4' ,1
exec VerEstadisticasFlujoPorVariable 'LINEAIV', 'IdGrupo=4', 1

exec VerlujoTrabajoPorTareaDetalle  'LINEAIV', 'IdTarea=11,IdGrupo=4 ',1

exec  ConsultarMisPendientes 'LINEAIV','',1

EXEC Seguimiento 'LINEAIV','01020309999',1
EXEC ConsultarHistorial 'LINEAIV','01020309999'

EXEC	VerVariablesInstancia 18

exec  ConsultarMisPendientes 'LINEAIV','',1

exec  ConsultarMisPendientes 'LINEAIV','IdPerfil:2',1
select * FROM FlujoTrabajoResponsableActividad
select *  FROM   dbo.ObtenerListaPorNombreValor ('IdPerfil:2')
select *  FROM   dbo.ObtenerListaPorNombreValorEspecial ('IdPerfil=2,IdGrupo=6','=',',') 

---- TABLAS
Select  *  FROM   Persona  
Select  *  FROM   Usuario  

delete FROM   Persona  where  id=53

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) 
SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)


DELETE  FROM FlujoTrabajoInstancia  where Idinstancia  in  (57 )
DELETE FROM   FlujoTrabajoHistorial  where Idinstancia  in  (57)
DELETE FROM   FlujoTrabajoVariable where Idinstancia  in  (57)

delete FROM  FlujoTrabajoInstancia  where Idinstancia  in  (53 )
delete FROM  FlujoTrabajoHistorial  where Idinstancia  in  (53)

update FlujoTrabajoTarea
 set activo =1

 update FlujoTrabajoActividad
 set activo =1

  update FlujoTrabajoResponsableActividad
 set idtarea =14
 where  idtarea is null

 select * FROM FlujoTrabajoActividad
 SELECT * FROM FlujoTrabajoTarea WITH (NOLOCK)
SELECT * FROM  FlujoTrabajoEstatus  WITH (NOLOCK)

SELECT * FROM  FlujoTrabajoTareaEstatus  WITH (NOLOCK)
SELECT * FROM FlujoTrabajoResponsableActividad
SELECT * FROM PERFIL

select * FROM FlujoTrabajoAsignacionActividad


select * FROM  dbo.ObtenerListaPorNombreValor ('tipo:@IdPerfil,Valor:1') 
select * FROM  dbo.ObtenerListaPorNombreValor ('nombre:fga,importe:10, refrencia : 999') 

select * FROM  dbo.ObtenerListaPorNombreValorEspecial ('IdTarea=7,IdSocio=4 ','=',',') 

   DECLARE  @IdTarea INT=0 
   DECLARE  @Variables VARCHAR(MAX) ='IdTarea=7,IdSocio=4'
   SELECT  @IdTarea,@Variables
   SELECT  @IdTarea=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdTarea'
   SELECT  @IdTarea,@Variables




SELECT DISTINCT  IdInstancia,* FROM FlujoTrabajoVariable

SELECT  DISTINCT IdInstancia FROM  dbo.ObtenerListaPorNombreValorEspecial ('tipo=@IdPerfil,Valor=1,@IdSocio=1016,@Grupo=6 ' ,'=',',') VR ,
 FlujoTrabajoVariable V WHERE  V.Valor =VR.Valor 


 SELECT  DISTINCT IdInstancia FROM  dbo.ObtenerListaPorNombreValorEspecial ('tipo=@IdPerfil,Valor=1,@Grupo=6' ,'=',',') VR ,
 FlujoTrabajoVariable V WHERE  V.Valor =VR.Valor 

 SELECT IdInstancia, Valor,COUNT(*) FROM FlujoTrabajoVariable
 GROUP  BY IdInstancia, Valor

  SELECT IdInstancia,Valor,COUNT(*) as cuenta FROM FlujoTrabajoVariable   where variable='@Grupo'
 GROUP  BY  IdInstancia,Valor

  SELECT IdInstancia,Valor,COUNT(*) as cuenta FROM FlujoTrabajoVariable   where variable='@	'
 GROUP  BY  IdInstancia,Valor



select *  FROM  FlujoTrabajoVariable
select *  FROM FlujoTrabajoResponsableActividad
select *  FROM FlujoTrabajoAsignacionActividad

select * FROM  dbo.ObtenerListaPorNombreValor ('@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,   @Descripcion  : descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA')
---- DELETE TABLAS

DELETE  FROM  FlujoTrabajoVariable
DELETE FROM FlujoTrabajoAsignacionActividad
DELETE  FROM   FlujoTrabajoInstancia  
DELETE  FROM   FlujoTrabajoHistorial 



DELETE  FROM   FlujoTrabajoInstancia  WHERE  identificador='11'
DELETE  FROM   FlujoTrabajoHistorial  WHERE  identificador='11'


select  *  FROM   Persona  WHERE  id = 54
 

select  *  FROM   FlujoTrabajoHistoriFlujoTrabajoInstanciaal  WHERE  Idinstancia  in  (1)
select  *    FROM  FlujoTrabajoVariable  WHERE  Idinstancia  in  (1)
select  *   FROM     WHERE  Idinstancia  in  (1)



DELETE FROM   Persona  WHERE  id = 54

DELETE  FROM   FlujoTrabajoHistorial  WHERE  Idinstancia  in  (55)
DELETE  FROM  FlujoTrabajoVariable  WHERE  Idinstancia  in  (55)
DELETE  FROM   FlujoTrabajoInstancia  WHERE  Idinstancia  in  (55)


----------------------------------------------------------



declare  @IdFlujoTrabajo int = 10


SELECT * FROM PERFIL 

select * FROM FlujoTrabajoAsignacionActividad

exec VerFlujoTrabajo 'LINEAIV', 0





select * FROM FlujoTrabajoResponsableActividad  RA, dbo.ObtenerListaPorNombreValor ('IdPerfil:2')  VR
where  ( RA.Tipo =VR.Variable AND  RA.IdResponsable =VR.Valor ) 
		AND (  ( VR.Variable= RA.Tipo  AND VR.Valor= RA.IdResponsable )  OR  ( VR.Variable= ARA.Tipo  AND VR.Valor= ARA.IdResponsable ) )


		select variable  from  FlujoTrabajoVariable
		 where variable='@Grupo'

		update    FlujoTrabajoVariable
		set variable='importe'  where variable='@importe'