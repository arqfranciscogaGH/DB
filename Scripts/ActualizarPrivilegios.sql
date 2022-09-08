 -------------MENU
 DECLARE  @IdMmenu  int=5026
SELECT  * FROM  OpcionMenu where idmenu=@IdMmenu   order by Orden



 update  OpcionMenu set  IdPrivilegio=8131   where IdMenu= 5026  and  IdOpcionMenu=8131
  update  OpcionMenu set  IdPrivilegio=2200  where IdMenu= 5026  and  IdOpcionMenu=2200
  update  OpcionMenu set  IdPrivilegio=2210   where IdMenu= 5026  and  IdOpcionMenu=2210
  update  OpcionMenu set  IdPrivilegio=53   where IdMenu= 5026  and  IdOpcionMenu=2220
 ------------Privilegio

 SELECT *  from  Privilegio   where Clave in ('27','51','52' ,'53','2220'  )
 SELECT *  from  Privilegio  where  Nombre like '%Ingresar%' and  Activo=1

     SELECT *   from  Privilegio   where Clave in ('56', '32','2104' )

    DELETE  from  Privilegio   where Clave in ('2104' )
	  DELETE  from  Privilegio   where Clave in ('2220' )
   DELETE  from  Privilegio   where Clave in ('8156' )


     SELECT *  from  Privilegio   where Clave in ('8131','2200','2210' , '53')
   SET IDENTITY_INSERT [dbo].[Privilegio] ON 

	INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (8131,1,8131, 'Ingresar a Operaciones ', 'C', 1, 1, 'Ingresar a Operaciones ')

	INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (2200,1,2200, 'Ingresar a Consultas ', 'C', 1, 1, 'Ingresar a Consultas ')
	INSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (2210,1,2210, 'Ingresar a Estadísticas   ', 'C', 1, 1, 'Ingresar a Estadísticas ')
	
	iNSERT [dbo].[Privilegio] ([IdPrivilegio], [IdAplicacion], [clave], [Descripcion], [Permiso], [IdSuscriptor], [Activo], [Nombre] ) VALUES (2210,1,2210, 'Ingresar a Estadísticas   ', 'C', 1, 1, 'Ingresar a Estadísticas ')
	
	SET IDENTITY_INSERT [dbo].[Privilegio] OFF


    DELETE  from  Privilegio   where Clave in ('80' )
    DELETE  from  Privilegio   where Clave in ('8157' )
   DELETE  from  Privilegio   where Clave in ('8158' )

   DELETE  from  PrivilegioAsignado  where Clave in ('80' ,'8157','8158' )

   UPDATE   Privilegio  SET Descripcion='Ingresar a Configuración ' , Nombre='Ingresar a Configuración'  where Clave in ('56' )

    ------------PrivilegioAsignado

	SELECT TOP (1000) [IdPrivilegiAsignado]
      ,[Clave]
      ,[TipoElemento]
      ,[IdElemento]
      ,[IdSuscriptor]
      ,[Activo]
  FROM [DB_A72B95_drp].[dbo].[PrivilegioAsignado]

  where   Clave in  ('27','51','52' ,'53','2220' ) and IdElemento='3'  

  insert into  PrivilegioAsignado   select  '27','P','1',1,1 
  insert into  PrivilegioAsignado   select  '51','P','1',1,1 
  insert into  PrivilegioAsignado   select  '52','P','1',1,1 
  insert into  PrivilegioAsignado   select  '53','P','1',1,1 


  DELETE  FROM PrivilegioAsignado  where  Clave in   ('27','51','52' ,'53','2220' )  and  IdElemento=1 

  insert into  PrivilegioAsignado
  select  Clave,TipoElemento,3,1,1 from  PrivilegioAsignado
  where  Clave in   ('27','51','52' ,'53' )  and  IdElemento=1



  ------------Perfil
SELECT TOP (1000) [IdPerfil]
      ,[Nombre]
      ,[Pagina]
      ,[IdSuscriptor]
      ,[Activo]
      ,[IdMenu]
      ,[Privilegios]
  FROM [DB_A72B95_drp].[dbo].[Perfil]

  update  Perfil set IdMenu=5026, Privilegios='6191,6157,6195,6193,6177,6161,6165,53,51,52,27'  where IdPerfil=3

 