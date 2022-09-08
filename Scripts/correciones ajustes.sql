use  DB_A72B95_drp

SELECT  Nombre, cuenta,  contrasena FROM usuario

SELECT  *  FROM FlujoTrabajoInstancia   where  Identificador='90947536257'
SELECT  *  FROM  FlujoTrabajoHistorial  where  Identificador='90947536257'


EXEC Seguimiento 'LINEAIV','16068005632'
EXEC ConsultarHistorial 'LINEAIV','16068005632'

SELECT  *  FROM FlujoTrabajoInstancia   where  Identificador='16068005632'
SELECT  *  FROM  FlujoTrabajoHistorial  where  Identificador='16068005632'

EXEC Seguimiento 'LINEAIV','01907402703'
EXEC ConsultarHistorial 'LINEAIV','01907402703'

SELECT  *  FROM FlujoTrabajoInstancia   where  Identificador='01907402703'
SELECT  *  FROM  FlujoTrabajoHistorial  where  Identificador='01907402703'
 ---  regresar de estatus

declare  @idinstancia  int , @idhistorial int
set @idinstancia=3
set @idhistorial=77

update   FlujoTrabajoInstancia 
set   idtarea=16,  idactividad=16,   Idestatus=37
where idinstancia =@idinstancia

update   FlujoTrabajoHistorial 
set    IdEstatusTarea=1,   Idestatus=null ,  FechaInicio= null , FechaTernimacion= null
where idhistorial in  (@idhistorial  )

delete FlujoTrabajoHistorial   where   idinstancia= @idinstancia  and  idhistorial > @idhistorial








EXEC Seguimiento 'LINEAIV','90947536257'
EXEC ConsultarHistorial 'LINEAIV','90947536257'

SELECT  *  FROM FlujoTrabajoInstancia   where  Identificador='90947536257'
SELECT  *  FROM  FlujoTrabajoHistorial  where  Identificador='90947536257'





 ---  regresar de estatus

declare  @idinstancia  int , @idhistorial int
set @idinstancia=47 
set @idhistorial=415

update   FlujoTrabajoInstancia 
set   idtarea=17,  idactividad=17,   Idestatus=null
where idinstancia =@idinstancia

update   FlujoTrabajoHistorial 
set    IdEstatusTarea=1,   Idestatus=null ,  FechaInicio= null , FechaTernimacion= null
where idhistorial in  (@idhistorial  )

delete FlujoTrabajoHistorial   where   idinstancia= @idinstancia  and  idhistorial > @idhistorial



SELECT  *  FROM  FlujoTrabajoEstatus


SELECT  *  FROM  FlujoTrabajoHistorial where IdFlujoTrabajo=@IdFlujoTrabajo
SELECT  * FROM FlujoTrabajoVariable
SELECT  *  FROM FlujoTrabajoInstancia  where IdFlujoTrabajo=@IdFlujoTrabajo

SELECT  *  FROM  Suscripcion  where  clave  ='Desiree.hernandez'
SELECT  *  FROM  grupo

SELECT  *  FROM  Suscripcion  where  id  in  (  4,1008 )

SELECT  *  FROM  Suscripcion  where  idsuscriptor  in  (  4)




SELECT  *  FROM  persona  where  idsuscriptor=1010


SELECT  i.idinstancia, i.nombre, Identificador, importe, numero  , referencia  , v.variable,  v.valor  FROM FlujoTrabajoInstancia i
left  outer  join FlujoTrabajoVariable v on i.idinstancia=v.idinstancia
where    v.variable='@IdSocio'  and  valor  ='1010'

SELECT  i.idinstancia, i.nombre,Identificador, importe, numero  , referencia  , v.variable,  v.valor  FROM FlujoTrabajoInstancia i
left  outer  join FlujoTrabajoVariable v on i.idinstancia=v.idinstancia
where    v.variable='@Grupo'  and  valor  ='4'



--- insertar  grupo 
insert  FlujoTrabajoVariable
SELECT  10, i.idinstancia, '@Grupo' ,'4',1  FROM FlujoTrabajoInstancia i
left  outer  join FlujoTrabajoVariable v on i.idinstancia=v.idinstancia
where    v.variable='@IdSocio'  and  valor  ='1010' 

--- actualizar  id  solcio
update  i
set numero =valor
FROM FlujoTrabajoInstancia i
left  outer  join FlujoTrabajoVariable v on i.idinstancia=v.idinstancia
where    v.variable='@IdSocio'  and  valor  ='1010'


--- actualizar  grupo 
update  i
set referencia =valor
FROM FlujoTrabajoInstancia i
left  outer  join FlujoTrabajoVariable v on i.idinstancia=v.idinstancia
where    v.variable='@Grupo'  and  valor  ='4'




update   FlujoTrabajoVariable
set valor ='4'
where    variable='@Grupo'  and  valor  ='1008'




select  *  from  FlujoTrabajoVariable
where    variable='@Grupo'  and  valor  ='4'

update   FlujoTrabajoVariable


update  persona
set fechaNacimiento=''



SELECT  *  FROM  Suscripcion where  id=1014
SELECT  *  FROM  Usuario   where  idsuscriptor=1018

SELECT  *  FROM  grupo
SELECT  *  FROM  Perfil

--- giorgio
SELECT  s.id,s.clave, u.cuenta,u.grupos, g.nombre, u.perfiles,  *  FROM  Suscripcion  s
left  outer  join Usuario u on s.id=u.idsuscriptor
left  outer  join grupo  g on u.grupos=g.id
where   s.idsuscriptor=2

--- nachito
SELECT  s.id,s.clave, u.cuenta,u.grupos, g.nombre, u.perfiles,  *  FROM  Suscripcion  s
left  outer  join Usuario u on s.id=u.idsuscriptor
left  outer  join grupo  g on u.grupos=g.id
where   s.idsuscriptor in  (  1016)




SELECT  *  FROM  Suscripcion  where  id  = 1013
SELECT  *  FROM  Usuario where idsuscriptor  = 1013

update  Usuario
set perfiles='2'
where  id >3


SELECT  *  FROM  Suscripcion where len(fechaInicio)>6

update  Suscripcion
set fechaInicio=''
where len(fechaInicio)>6


update  Suscripcion
set fecha=fechaInicio
where len(fechaInicio)>6

update  Suscripcion
set fechaInicio=''
