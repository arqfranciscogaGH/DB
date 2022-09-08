/****** Script for SelectTopNRows command from SSMS  ******/
---- 5027,  5028. 5029 , 5030

 DECLARE  @IdMmenu  int=5030
SELECT  * FROM  OpcionMenu where idmenu=@IdMmenu   order by Orden
SELECT DISTINCT pa.IdPrivilegiAsignado,m.IdOpcionMenu, p.* , PA.*,M.*
  FROM  [OpcionMenu]   M 
  LEFT  OUTER  JOIN Privilegio P  ON M.IdPrivilegio =P.IdPrivilegio
  LEFT  OUTER   JOIN  PrivilegioAsignado PA  ON  P.Clave=PA.Clave
  WHERE idmenu=@IdMmenu and  PA.Clave IS NOT  NULL 

     SELECT *  from  Privilegio  where  IdAplicacion<>1  and  activo  =0  order  by  2

    SELECT *  from  Privilegio where Clave=53

		update  OpcionMenu set  IdPrivilegio=0   where IdMenu= 5028  and  IdPrivilegio=73
	
	update  OpcionMenu set  IdPrivilegio=0   where IdMenu= 5029  and  IdPrivilegio=73

	update  OpcionMenu set  IdPrivilegio=0   where IdMenu= 5030

	update  OpcionMenu set  IdPrivilegio=0   where IdMenu= 5030
	
	update  OpcionMenu set  IdPrivilegio=8141   where IdOpcionMenu= 8141


	update  OpcionMenu set  IdPrivilegio=27   where IdOpcionMenu= 8133
		update  OpcionMenu set  IdPrivilegio=51   where IdOpcionMenu= 8134
	update  OpcionMenu set  IdPrivilegio=52   where IdOpcionMenu= 8135

	update  OpcionMenu set  IdPrivilegio=8157   where IdOpcionMenu= 8157
		update  OpcionMenu set  IdPrivilegio=8158   where IdOpcionMenu= 8158
			update  OpcionMenu set  IdPrivilegio=8156   where IdOpcionMenu= 8156

  SELECT *  from  Privilegio where Clave=3110

  SELECT  * FROM  Privilegio   WHERE  ACTIVO=1 ORDER  BY  1
    SELECT  * FROM  Privilegio   WHERE IdPrivilegio  in ( 2104)
SELECT *  from  PrivilegioAsignado where Clave=2104
SELECT *  from  PrivilegioAsignado where TipoElemento='G'
delete  from  PrivilegioAsignado where TipoElemento='G'
SELECT *  from  PrivilegioAsignado where IdPrivilegiAsignado in ( 48, 49,50,51,52)
delete from  PrivilegioAsignado where IdPrivilegiAsignado in ( 48, 49,50,51,52)

----   menu    214

 UPDATE Privilegio SET activo=1 where Clave=3110

 UPDATE Privilegio SET activo=1 where Clave=2104
UPDATE Privilegio SET  Descripcion ='Ingresar a Acciones Captura', Nombre ='Ingresar a Acciones Captura'  WHERE  IdPrivilegio=2096
UPDATE Privilegio SET  Descripcion ='Ingresar a Planeación  Captura', Nombre ='Ingresar a Planeación  Captura'  WHERE  IdPrivilegio=2096
UPDATE Privilegio SET  Permiso ='C'  WHERE  IdPrivilegio=6118
UPDATE Privilegio SET  IdAplicacion =1  WHERE  IdPrivilegio=3109
UPDATE Privilegio set activo=1  WHERE IdPrivilegio  in (  2105)
UPDATE OpcionMenu SET  IdPrivilegio=50  ,  orden =5  WHERE  IdMenu=516
----  menu    11
UPDATE OpcionMenu SET  orden =1  WHERE  IdOpcionMenu=32
UPDATE OpcionMenu SET  orden =2  WHERE  IdOpcionMenu=34
UPDATE OpcionMenu SET  orden =3  WHERE  IdOpcionMenu=6121
UPDATE OpcionMenu SET  orden =4  WHERE  IdOpcionMenu=8160


UPDATE Privilegio SET  Descripcion ='Ingresar a Menús de Sitio', Nombre ='Ingresar a Menús de Sitio'  WHERE  IdPrivilegio=50
UPDATE Privilegio SET  Descripcion ='Ingresar a Operaciones', Nombre ='Ingresar a Operaciones'  WHERE  IdPrivilegio=80
UPDATE Privilegio SET  Descripcion ='Ingresar a Menú Flujo de Trabajo', Nombre ='Ingresar a Menú Flujo de Trabajo'  WHERE  IdPrivilegio=3113


----------
UPDATE OpcionMenu SET  Titulo='Catálogos'  WHERE  IdOpcionMenu=53
UPDATE OpcionMenu SET  IdPrivilegio=2105  ,  orden =5  WHERE  IdOpcionMenu=2105
UPDATE OpcionMenu SET  IdPrivilegio=50  ,  orden =5  WHERE  IdOpcionMenu=50
UPDATE OpcionMenu SET  IdPrivilegio=80 ,  orden =6 WHERE  IdOpcionMenu=33
UPDATE   Privilegio SET ACTIVO=0   WHERE   IdPrivilegio >=82   


UPDATE OpcionMenu SET  IdPrivilegio=2220  WHERE  IdOpcionMenu=2220
UPDATE   Privilegio SET ACTIVO=0   WHERE   IdPrivilegio >=82   AND  IdPrivilegio<=6118


----  insertar  privilegio 
SET IDENTITY_INSERT [dbo].[Privilegio] ON 

INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (8141,1,8141, 'Ingresar a Prospectos/Clientes  ', 'C', 1, 1, 'Ingresar a Prospectos/Clientes  ')


SET IDENTITY_INSERT [dbo].[Privilegio] OFF


INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (8157,1,8157, 'Ingresar a Consultas  ', 'C', 1, 1, 'Ingresar a Consultas  ')
INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (8158,1,8158, 'Ingresar a Estadísticas  ', 'C', 1, 1, 'Ingresar a Estadísticas  ')


  INSERT  INTO  PrivilegioAsignado SELECT  8141,'P',1,1,1


  INSERT  INTO  PrivilegioAsignado SELECT  8156,'P',1,1,1
    INSERT  INTO  PrivilegioAsignado SELECT  8157,'P',1,1,1
	  INSERT  INTO  PrivilegioAsignado SELECT  8158,'P',1,1,1








 
  ----ASIGNAR PERMISOS  DE MENU
   DECLARE  @IdPrivilegio  int=3107  ---27,51, 2105
   DECLARE @nombrePerfil  varchar(max) ='Administrador Sistema', @idPerfil  int=1   
   SELECT   @idPerfil=IdPerfil from   Perfil  where Nombre=@nombrePerfil
   SELECT 'Perfil', @nombrePerfil, @idPerfil

    UPDATE  Privilegio  SET  IdAplicacion=1   WHERE  IdPrivilegio=@IdPrivilegio

  insert into PrivilegioAsignado  select  @IdPrivilegio,'P',@idPerfil,1,1
  SELECT * FROM PrivilegioAsignado where  clave=@IdPrivilegio

  
SELECT TOP 1000 a.IdAplicacion,a.Clave  as ClaveAplicacion,A.Capa,A.IdModuloSistema,A.Clase,A.TIPO,
  P.IdPrivilegio, p.Clave, p.Permiso ,P.Descripcion,
  pa.IdPrivilegiAsignado, pa.TipoElemento,pa.IdElemento
  FROM  Privilegio p    
  INNER JOIN Aplicacion  a ON  p.IdAplicacion=a.IdAplicacion
  LEFT  OUTER   JOIN  PrivilegioAsignado PA  ON  P.Clave=PA.Clave
  WHERE  p.Activo=1  and  a.IdAplicacion=1
  ---AND IdPrivilegio<6156
  ORDER BY  1
