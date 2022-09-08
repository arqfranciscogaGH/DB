select   *  from  FlujoTrabajoInstancia  
 where IdInstancia in  ( 21, 29, 37)

EXEC  AvanzarActividad 'LINEAIV','92886863817', 'MODIFICAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 37 , @Importe:111759.00, @Nombre: Humberto Jose Luis Hernandez Falcon, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:2,@IdGrupo:2'


EXEC  AvanzarActividad 'LINEAIV','92038320666', 'MODIFICAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 29 , @Importe:84763.37, @Nombre: Jonathan Sergio Reyes Reyes, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:2,@IdGrupo:2'


EXEC  AvanzarActividad 'LINEAIV','16866421783', 'MODIFICAR','','','@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 21 , @Importe:517051.00, @Nombre: Alejandro Intriago Sierra, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:2,@IdGrupo:2'


 select   *  from  FlujoTrabajoInstancia  
 where IdInstancia in  (78,79)

  select   *  from  FlujoTrabajoVariable
 where IdInstancia in  ( 78,79)

 SELECT *  FROM Persona  P  WITH (NOLOCK) WHERE  P.Id=78





 select   *  from  FlujoTrabajoInstancia  
 where IdInstancia in  ( 21, 29, 37)

select   *  from  FlujoTrabajoHistorial  
 where IdInstancia in  (21, 29, 37)





SELECT *  FROM Persona  P  WITH (NOLOCK) WHERE  P.Id=21



 select   *  from  FlujoTrabajoVariable
 where IdInstancia in  ( 21, 29, 37)


 
select   *  from  FlujoTrabajoInstancia  i
LEFT  OUTER   JOIN FlujoTrabajoVariable V  WITH (NOLOCK) ON V.IdInstancia=I.IdInstancia
 where i.IdInstancia in  ( 29, 37)



  update  FlujoTrabajoInstancia
  set importe=84763.37
  where IdInstancia in  ( 29)

  
  update  FlujoTrabajoInstancia
  set importe=111759
  where IdInstancia in  ( 37)

    update  FlujoTrabajoInstancia
  set importe=517051
  where IdInstancia in  ( 21)
  
      update  FlujoTrabajoInstancia
  set Nombre='Vene Garcia'
  where IdInstancia in  ( 79)