/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP (1000) [IdAplicacion]
      ,[Clave]
      ,[IdSistema]
      ,[IdModuloSistema]
      ,[Nombre]
      ,[Descripcion]
      ,[Tipo]
      ,[FechaCreacion]
      ,[IdAutorCreacion]
      ,[FechaActualizacion]
      ,[IdAutorActualizacion]
      ,[Capa]
      ,[Clase]
      ,[Activo]
  FROM [DB_A72B95_drp].[dbo].[Aplicacion] WHERE  IdAplicacion=2025    clave  ='AdministracionArea'
    select  *  from Aplicacion WHERE tipo='PAGINA'

   select  *  from Aplicacion WHERE tipo='SITIO' IdAplicacion=1

  tipo='PAGINA'  [IdAplicacion] IN (1016,3039)


  -----  aplicaciones configuración 
  select  *  from Aplicacion WHERE  IdAplicacion=2025
  update Aplicacion  set  IdModuloSistema= 4 , nombre ='AdministracionMenu.aspx' , Descripcion='Administración de  Menús'  WHERE IdAplicacion=2025
    
  select  *  from Aplicacion WHERE  IdAplicacion=1023
  update Aplicacion  set  IdModuloSistema= 4 ,nombre ='CatalogoGeneral.aspx' , Descripcion='Administración de Catálogos'  WHERE IdAplicacion=1023

    select  *  from Aplicacion WHERE  IdAplicacion=2023
  update Aplicacion  set  IdModuloSistema= 4 ,nombre ='AdministracionCuestionario.aspx' , Descripcion='Administración de Captuta Información'  WHERE IdAplicacion=2023

      select  *  from Aplicacion WHERE  IdAplicacion=1016
  update Aplicacion  set  IdModuloSistema= 4 ,nombre ='AdministracionConfiguracion.aspx' , Descripcion='Administracion Parámetros de  Configuración'  WHERE IdAplicacion=1016

  select  *  from Aplicacion WHERE  IdAplicacion=3032
  update Aplicacion  set  IdModuloSistema= 4 ,nombre ='AdministracionPlaneacionCaptura.aspx' , Descripcion='Administración Planeación Captura'  WHERE IdAplicacion=3032

  select  *  from Aplicacion WHERE  IdAplicacion=3033
  update Aplicacion  set  IdModuloSistema= 4 ,nombre ='AdministracionAccionesControl.aspx' , Descripcion='Administración Acciones Captura'  WHERE IdAplicacion=3033


  --- aplicaciones  estructura

    select  *  from Aplicacion WHERE  IdAplicacion=3037
  update Aplicacion  set  IdModuloSistema= 1006 , nombre ='AdministracionArea.aspx' , Descripcion='Administración de Áreas de trabajo'  WHERE IdAplicacion=3037

  select  *  from Aplicacion WHERE  IdAplicacion=4044
  update Aplicacion  set IdModuloSistema= 1006 ,nombre ='AdministracionPuesto.aspx' , Descripcion='Administración Puestos'  WHERE IdAplicacion=4044
  
   --- aplicaciones  seguridad

  select  *  from Aplicacion WHERE  IdAplicacion=3035
  update Aplicacion  set IdModuloSistema= 3 , nombre ='AdministracionAplicacion.aspx' , Descripcion='Administración de Aplicaciones'  WHERE IdAplicacion=3035

  select  *  from Aplicacion WHERE  IdAplicacion=3039
  update Aplicacion  set IdModuloSistema= 3 ,nombre ='AdministracionGrupo.aspx' , Descripcion='Administración Grupos'  WHERE IdAplicacion=3039


  select  *  from Aplicacion WHERE  IdAplicacion=3040
  update Aplicacion  set nombre ='AdministracionPerfil.aspx' , Descripcion='Administración de Perfiles'  WHERE IdAplicacion=3040

  select  *  from Aplicacion WHERE  IdAplicacion=4043
  update Aplicacion  set IdModuloSistema= 3 ,nombre ='AdministracionSuscripcion.aspx' , Descripcion='Administración Suscripciones'  WHERE IdAplicacion=4043

  select  *  from Aplicacion WHERE  IdAplicacion=3041
  update Aplicacion  set IdModuloSistema= 3 ,nombre ='AdministracionUsuarios.aspx' , Descripcion='Administración de Usuarios'  WHERE IdAplicacion=3041
  
  
  select  *  from Aplicacion WHERE  IdAplicacion=6049
  update Aplicacion  set IdModuloSistema= 3 ,nombre ='AdministracionPrivilegios.aspx' , Descripcion='Administración de Privilegios'  WHERE IdAplicacion=6049


  
  -----   otras  aplicaciones  

  select  *  from ModuloSistema WHERE  IdModuloSistema=1002
    select  *  from Aplicacion WHERE  IdAplicacion=7072
  update Aplicacion  set IdModuloSistema= 1002 , nombre ='AdministracionCliente.aspx' , Descripcion='Administración Clientes'  WHERE IdAplicacion=7072
  
  select  *  from Aplicacion WHERE  IdAplicacion=1
  update Aplicacion  set IdModuloSistema= 1 , nombre ='Menu.aspx' , Descripcion='Menús  de Sitio'  WHERE IdAplicacion=1
 
 update  Aplicacion
  set Clave='AdministradorPrivilegios'
  where  IdAplicacion= 6049






  SELECT TOP (1000) [IdPerfil]
      ,[Nombre]
      ,[Pagina]
      ,[IdSuscriptor]
      ,[Activo]
      ,[IdMenu]
      ,[Privilegios]
  FROM [DB_A72B95_drp].[dbo].[Perfil]

  SELECT TOP (1000)*  from  Privilegio   where  IdPrivilegio=

     SELECT TOP (1000)*  from  Privilegio where  IdPrivilegio<6156

   SELECT TOP (1000)*  from  PrivilegioAsignado
------------------------------------------------------


SELECT TOP 1000 a.IdAplicacion,a.Clave  as ClaveAplicacion,A.Capa,A.IdModuloSistema,A.Clase,A.TIPO,
  P.IdPrivilegio, p.Clave, p.Permiso ,P.Descripcion,
  pa.IdPrivilegiAsignado, pa.TipoElemento,pa.IdElemento
  FROM  Privilegio p    
  INNER JOIN Aplicacion  a ON  p.IdAplicacion=a.IdAplicacion
  LEFT  OUTER   JOIN  PrivilegioAsignado PA  ON  P.Clave=PA.Clave
  WHERE  p.Activo=1  and  a.IdAplicacion=1
  ---AND IdPrivilegio<6156
  ORDER BY  1



  BEGIN TRANSACTION

  --------  VARIABLES

 DECLARE @INICIAR  int=1   ---- O INICIAR  1 AGREGAR
 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionConfiguracion',@descAplicacion  varchar(max) ='Parámetros de Configuración' ,@idAplicacion  int=0
 --- DECLARE @claveAplicacion  varchar(max) ='AdministracionGrupo',@descAplicacion  varchar(max) =' Grupo' ,@idAplicacion  int=0
 --- DECLARE @claveAplicacion  varchar(max) ='AdministracionUsuarios',@descAplicacion  varchar(max) =' Usuarios' ,@idAplicacion  int=0

 -- DECLARE @claveAplicacion  varchar(max) ='AdministracionAplicacion',@descAplicacion  varchar(max) ='Aplicación' ,@idAplicacion  int=0
 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionSuscripcion',@descAplicacion  varchar(max) ='Suscripción' ,@idAplicacion  int=0
--- DECLARE @claveAplicacion  varchar(max) ='AdministracionCatalogo',@descAplicacion  varchar(max) ='Catálogos' ,@idAplicacion  int=0
 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionMenu',@descAplicacion  varchar(max) ='Menus' ,@idAplicacion  int=0
 
--- DECLARE @claveAplicacion  varchar(max) ='AdministracionCuestionarios',@descAplicacion  varchar(max) ='Cuestionario' ,@idAplicacion  int=0
 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionArea',@descAplicacion  varchar(max) ='Area' ,@idAplicacion  int=0


 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionPuesto',@descAplicacion  varchar(max) ='Puesto' ,@idAplicacion  int=0
 ---DECLARE @claveAplicacion  varchar(max) ='AdministracionCliente',@descAplicacion  varchar(max) ='Cliente' ,@idAplicacion  int=0
 -- DECLARE @claveAplicacion  varchar(max) ='AdministracionPerfil',@descAplicacion  varchar(max) ='Perfil' ,@idAplicacion  int=0
 --- DECLARE @claveAplicacion  varchar(max) ='AdministracionPlaneacion',@descAplicacion  varchar(max) ='Planeacion Cuestionarios' ,@idAplicacion  int=0
 --- DECLARE @claveAplicacion  varchar(max) ='AdministracionAccionesControl',@descAplicacion  varchar(max) ='Acciones Control  Captura' ,@idAplicacion  int=0
 --- DECLARE @claveAplicacion  varchar(max) ='AdministradorPrivilegios',@descAplicacion  varchar(max) ='Privilegios' ,@idAplicacion  int=0

 DECLARE @claveAplicacion  varchar(max) ='AdministradorPrivilegios',@descAplicacion  varchar(max) ='Privilegios' ,@idAplicacion  int=0

 8156

  DECLARE @nombrePerfil  varchar(max) ='Administrador Sistema', @idPerfil  int=0   
  
  DECLARE @permisoAbc  varchar(max) ='A,M,E,C', @descAbc  varchar(max)   ='Administración' , @idAbc  int=0
  DECLARE @permisoC  varchar(max) ='C', @descC  varchar(max)   ='Consultar', @idC  int=0
  DECLARE @DESC varchar(max) =''

  SELECT   @idAplicacion=IdAplicacion from   Aplicacion  where Clave=@claveAplicacion
  SELECT 'Aplicacion', @claveAplicacion, @idAplicacion, @descAplicacion

  SELECT   @idPerfil=IdPerfil from   Perfil  where Nombre=@nombrePerfil
  SELECT 'Perfil', @nombrePerfil, @idPerfil


  -------------------------INICIO
  SELECT * FROM Perfil  WHERE  IdPerfil =@idPerfil
  SELECT * FROM  Privilegio  WHERE IdAplicacion =@idAplicacion

  SELECT * FROM  PrivilegioAsignado  WHERE Clave in ( SELECT Clave FROM  Privilegio  WHERE IdAplicacion =@idAplicacion)

  SELECT 'eliminar antaerior'
  DELETE  FROM  Privilegio  WHERE IdAplicacion =@idAplicacion
  DELETE FROM  PrivilegioAsignado  WHERE Clave in ( SELECT Clave FROM  Privilegio  WHERE IdAplicacion =@idAplicacion   AND IdElemento=@idPerfil)
  --------------------  Consulta
  SET @DESC=@descC +' '+@descAplicacion
  SELECT  @idAplicacion,'',@DESC ,@permisoC,1,1, @DESC

  INSERT  INTO  Privilegio SELECT  @idAplicacion,'',@DESC,@permisoC ,1,1, @DESC
  SELECT @idC =IdPrivilegio FROM  Privilegio  WHERE IdAplicacion =@idAplicacion  and Nombre=@DESC
  UPDATE Privilegio   SET Clave=Convert(varchar,IdPrivilegio) WHERE  IdPrivilegio =@idC


  ------------------   abc 

  SET @DESC=@descAbc +' '+@descAplicacion
  SELECT  @idAplicacion,'',@DESC ,@permisoAbc, 1,1, @DESC

  INSERT  INTO  Privilegio SELECT  @idAplicacion,'',@DESC,@permisoAbc ,1,1, @DESC
  SELECT @idAbc =IdPrivilegio  FROM  Privilegio  WHERE IdAplicacion =@idAplicacion  and Nombre=@DESC
  UPDATE Privilegio   SET Clave=Convert(varchar,IdPrivilegio) WHERE  IdPrivilegio =@idAbc
 

  ------------ asignar  permisos

  SELECT   'asignar  permisos' ,@idC , @idAbc
  INSERT  INTO  PrivilegioAsignado SELECT  @idC,'P',@idPerfil,1,1
  INSERT  INTO  PrivilegioAsignado SELECT  @idAbc,'P',@idPerfil,1,1

  IF  @INICIAR=0
	  UPDATE Perfil
	  SET Privilegios=Convert(varchar,@idC)+','+Convert(varchar,@idAbc)
	  WHERE  IdPerfil =@idPerfil
 ELSE
	  UPDATE Perfil
	  SET Privilegios=Privilegios+','+Convert(varchar,@idC)+','+Convert(varchar,@idAbc)
	  WHERE  IdPerfil =@idPerfil

   SELECT * FROM Perfil  WHERE  IdPerfil =@idPerfil
   SELECT * FROM Privilegio  WHERE IdAplicacion =@idAplicacion

  SELECT * FROM  PrivilegioAsignado  WHERE Clave in ( SELECT Clave FROM  Privilegio  WHERE IdAplicacion =@idAplicacion)

  COMMIT  TRANSACTION


  -------OTRAS   ACYUALIZACIONES

   select * from   Privilegio where Permiso='A,M,E,C'  and IdPrivilegio>=6157

    select * from   PrivilegioAsignado where Clave in  (
    select Clave from   Privilegio where Permiso='A,M,E,C'  and IdPrivilegio>=6157   )


	update  PrivilegioAsignado
	set  IdElemento=1
	where  Clave in  (
    select Clave from   Privilegio where Permiso='A,M,E,C'  and IdPrivilegio>=6157   )

  /*

  select * from  PrivilegioAsignado

  
  EXEC ObtenerPrivilegios 2,4,2

  truncate  table  PrivilegioAsignado

  */

  DELETE FROM   PrivilegioAsignado  WHERE  IdPrivilegiAsignado  IN ( 23,27 )