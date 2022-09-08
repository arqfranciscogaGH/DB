use  DB_A72B95_drp

UPDATE Cliente
SET  idSuscriptor=2

UPDATE Cliente
SET  idSocio=2
WHERE  idSocio IS NULL 

UPDATE CuentaUsuario
SET  idSuscriptor=2
WHERE IdUsuario>1


UPDATE  I
SET Identificador='003'
FROM  FlujoTrabajoInstancia  I WHERE IdInstancia=86

UPDATE  I
SET Identificador='004'
FROM  FlujoTrabajoInstancia  I WHERE IdInstancia=87

SELECT * FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) WHERE IdInstancia=89
SELECT * FROM FlujoTrabajoVariable V WITH (NOLOCK)  WHERE IdInstancia=89

SELECT * FROM  FlujoTrabajoHistorial H WITH (NOLOCK)  WHERE IdInstancia=89
SELECT * FROM CuentaUsuario   U WITH (NOLOCK)
SELECT C.idSocio,* FROM Cliente   C WITH (NOLOCK) 

SELECT * FROM Cliente   C WITH (NOLOCK) INNER JOIN  CuentaUsuario   U WITH (NOLOCK) ON  C.idSocio=U.IdUsuario

UPDATE  I
SET idSuscriptor=2, I.IdSocio=C.idSocio, IdUsuario=C.idSocio, IdCliente=Numero
FROM  FlujoTrabajoInstancia  I INNER JOIN Cliente   C  ON I.Numero=C.id

SELECT C.idSocio,i.idSocio, i.IdUsuario, Numero,IdCliente,  I.idSuscriptor,* FROM   FlujoTrabajoInstancia  I WITH (NOLOCK) INNER JOIN Cliente   C  ON I.Numero=C.id

UPDATE  H
SET idSuscriptor=2 ,IdUsuario=C.idSocio
FROM  FlujoTrabajoHistorial H  
INNER JOIN FlujoTrabajoInstancia  I WITH (NOLOCK)  on  H.IdInstancia=I.IdInstancia  
INNER JOIN Cliente   C  ON I.Numero=C.id

SELECT h.IdUsuario,C.idSocio,i.IdUsuario, Numero,I.IdCliente,  I.idSuscriptor,* FROM  FlujoTrabajoHistorial H  
INNER JOIN FlujoTrabajoInstancia  I WITH (NOLOCK)  on  H.IdInstancia=I.IdInstancia  
INNER JOIN Cliente   C  ON I.Numero=C.id


delete FROM   FlujoTrabajoInstancia   WHERE IdInstancia in (93,94,95)
delete FROM FlujoTrabajoVariable  WHERE IdInstancia  in (93,94,95)
delete FROM  FlujoTrabajoHistorial  WHERE IdInstancia  in (93,94,95)


--------------------------------------- AvanzarActividad


---- INICIAR

EXEC  ConsultarMisPendientes '','',1
EXEC  ConsultarMisPendientes 'MEJORAVIT','',1
EXEC  Seguimiento 'LINEAIV','006',1

EXEC  AvanzarActividad '','006', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

EXEC  AvanzarActividad 'MEJORAVIT','006', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

EXEC  AvanzarActividad 'LINEAIV','005', 'INICIAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

EXEC  AvanzarActividad 'LINEAIV','005', 'MODIFICAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:200,@IdGrupo:B&D'


EXEC  AvanzarActividad 'LINEAIV','005', 'TERMINAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 2 , @Importe:100000, @Nombre: FRANCISCO GARCIA ALMARAZ,  @IdUsuario:4, @IdSocio:2, @IdCliente:87,@IdSuscriptor:2 ,  @IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@ImporteCliente:100,@IdGrupo:B&D'

EXEC  ConsultarMisPendientes 'LINEAIV','',1
EXEC  Seguimiento 'LINEAIV','005',1



exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=0',1

exec VerEstadisticasFlujoPorVista  '','vista=1',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=1',1


exec VerEstadisticasFlujoPorVista  '','vista=2',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=2',1


exec VerEstadisticasFlujoPorVista  '','vista=3',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=3',1


exec VerEstadisticasFlujoPorVista  '','vista=4',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=4',1

exec VerEstadisticasFlujoPorVista  '','vista=0,IdSocio=4',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=0,IdSocio=4',1

exec VerEstadisticasFlujoPorVista  '','vista=3,IdSocio=4',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=3,IdSocio=4',1

exec VerEstadisticasFlujoPorVista  '','vista=2,IdGrupo=4',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=2,IdGrupo=4',1

exec VerEstadisticasFlujoPorVista  '','vista=2,IdSocio=4',1
exec VerEstadisticasFlujoPorVistaDetallePorFiltro  '','vista=2,IdSocio=4',1