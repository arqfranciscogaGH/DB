SELECT TOP (1000) [IdMenu]
      ,[Titulo]
      ,[Caracteristicas]
      ,[IdModulo]
      ,[IdSuscriptor]
      ,[Tipo]
      ,[MenuPrincipal]
      ,[Marco]
      ,[Tamano]
      ,[Borde]
      ,[Sombra]
      ,[Efecto]
      ,[MostrarTitulo]
      ,[Activo]
      ,[ColorMenu]
      ,[ColorMarco]
  FROM [DB_A72B95_drp].[dbo].[Menu]   ----where  IdMenu   in  ( 11,14,5026  )


  SELECT TOP (1000) o.[IdOpcionMenu]
      ,[IdMenu]
      ,[Orden]
      ,o.[Titulo]
      ,i.[Titulo]
      ,[TipoComando]
      ,[Comando]
      ,[Caracteristicas]
      ,[Parametros]
      ,[IdPrivilegio]
      ,[Color]
      ,[Imagen]
      ,[Activo]
  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] o inner join   OpcionMenuIdioma    i on  o.IdOpcionMenu=i.IdOpcionMenu where  IdMenu   in  ( 11,14  )  and  IdIdioma=1
  order by 2,3


  update    [DB_A72B95_drp].[dbo].[Menu]   
  set Caracteristicas='Orientacion=H;'  ,   ColorMarco='ColorTema'  , Tamano=''  , Efecto=''
  where  IdMenu   in  ( 11,14,5026  )




  update   i
  set i.[Titulo]=o.[Titulo]
    FROM [DB_A72B95_drp].[dbo].[OpcionMenu] o inner join   OpcionMenuIdioma    i on  o.IdOpcionMenu=i.IdOpcionMenu where  IdMenu   in  ( 11,14  )  and  IdIdioma=1

  update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Sitio'  , Comando=516  ,IdPrivilegio=80  , Color='colorRojoC3'  , Imagen='icon-globe-1'  , Caracteristicas='Imagen=icon-globe-1 ;Color=colorRojoC3'
  where  IdMenu   in  ( 11,14  ) and  Orden=1

  update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Socio'  , Comando=5031  ,IdPrivilegio=50  , Color='colorMoradoC3'  , Imagen='icon-slideshare-1'  , Caracteristicas='Imagen=icon-slideshare-1 ;Color=colorMoradoC3'
  where  IdMenu   in  ( 11,14  ) and  Orden=2

  update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Configuración'  , Comando=214  ,IdPrivilegio=56  , Color='colorAzulVerdeC3'  , Imagen=' icon-cog'  , Caracteristicas='Imagen= icon-cog ;Color=colorAzulVerdeC3'
  where  IdMenu   in  ( 11,14  ) and  Orden=3

    update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Seguridad'  , Comando=12  ,IdPrivilegio=2104  , Color='colorAzulC3'  , Imagen=' icon-police'  , Caracteristicas='Imagen= icon-police ;Color=colorAzulC3'
  where  IdMenu   in  ( 11,14  ) and  Orden=4


    update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Flujo Trabajo'  , Comando=1001  ,IdPrivilegio=3113  , Color='colorAmarilloC3'  , Imagen=' icon-picasa'  , Caracteristicas='Imagen=icon-picasa ; Color=colorAmarilloC3' , TipoComando='SubMenu'
  where  IdMenu   in  ( 11,14  ) and  Orden=5

      update  [DB_A72B95_drp].[dbo].[OpcionMenuIdioma] 
	set Titulo='Flujo Trabajo'
	where IdOpcionMenu=8160

    update  [DB_A72B95_drp].[dbo].[OpcionMenu] 
  set Titulo='Estructura'  , Comando=2003  ,IdPrivilegio=3110  , Color='colorAmarilloO3'  , Imagen='  icon-flow-tree'  , Caracteristicas='Imagen=  icon-flow-treee ;Color=colorAmarilloO3'
  where  IdMenu   in  ( 11,14  ) and  Orden=6

  icon-users-3     USUARIOS
   icon-address-book-o    icon-address-card  SOCIO

    icon-sitemap   ESTRUCTURA

	 icon-archive   DCUMENTOS