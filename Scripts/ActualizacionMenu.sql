/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [IdMenu]
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
  FROM [DB_A72B95_drp].[dbo].[Menu]
   where IdMenu in  ( 11, 5026 ,5029)


  SELECT TOP 1000 [IdOpcionMenu]
      ,[IdMenu]
      ,[Orden]
      ,[Titulo]
      ,[Ayuda]
      ,[TipoComando]
      ,[Comando]
      ,[Caracteristicas]
      ,[Parametros]
      ,[IdPrivilegio]
      ,[Color]
      ,[Imagen]
      ,[Activo]
  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] 
     where IdMenu in  ( 11, 5026 ,5029)
	 order by 2

    SELECT TOP 1000 [IdOpcionMenu]
      ,[IdIdioma]
      ,[Titulo]
      ,[Ayuda]
  FROM [DB_A72B95_drp].[dbo].[OpcionMenuIdioma]

  SELECT TOP 1000 [IdPerfil]
      ,[Nombre]
      ,[Pagina]
      ,[IdSuscriptor]
      ,[Activo]
      ,[IdMenu]
      ,[Privilegios]
  FROM [DB_A72B95_drp].[dbo].[Perfil]


----------------------------------INSERT



	GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Titulo], [Caracteristicas], [IdModulo], [IdSuscriptor], [Tipo], [MenuPrincipal], [Marco], [Tamano], [Borde], [Sombra], [Efecto], [MostrarTitulo], [Activo], [ColorMenu], [ColorMarco]) VALUES (1, N'Menú Sitio', N'Orientacion=H;Tipo=Menu Animado ', 1, 1, N'Menu Animado', N'SI', N'Marco', NULL, NULL, N'Sombra', NULL, N'NO', 1, N'ColorTema', N'ColorTema')

SET IDENTITY_INSERT [dbo].[Menu] OFF 

SET IDENTITY_INSERT [dbo].[OpcionMenu] ON 

INSERT [dbo].[OpcionMenu] ([IdOpcionMenu], [IdMenu], [Orden], [Titulo], [Ayuda], [TipoComando], [Comando], [Caracteristicas], [Parametros], [IdPrivilegio], [Color], [Imagen], [Activo]) VALUES (2200, 5026, 2, N'Consultas', NULL, N'URL', N'', NULL, N'', 73, N'', N'', 1)
INSERT [dbo].[OpcionMenu] ([IdOpcionMenu], [IdMenu], [Orden], [Titulo], [Ayuda], [TipoComando], [Comando], [Caracteristicas], [Parametros], [IdPrivilegio], [Color], [Imagen], [Activo]) VALUES (2210, 5026, 3, N'Estadísticas', NULL, N'URL', N'', NULL, N'', 73, N'', N'', 1)
INSERT [dbo].[OpcionMenu] ([IdOpcionMenu], [IdMenu], [Orden], [Titulo], [Ayuda], [TipoComando], [Comando], [Caracteristicas], [Parametros], [IdPrivilegio], [Color], [Imagen], [Activo]) VALUES (2220, 5026, 4, N'Adminictración', NULL, N'URL', N'', NULL, N'', 73, N'', N'', 1)

SET IDENTITY_INSERT [dbo].[OpcionMenu] OFF



----------------------------------update

  update Perfil
  set 
  idMenu=11, 
  Privilegios='75,48,55,33,1095,52,2096,2098,6118,3119,3107,3108,73,1096,74,1100,3118,1099,1101,1098,1097,42,6,7,8,34,27,56,3113,50,6125,80,2104'
  where  idPerfil=4

   update Perfil
  set pagina='~/Paginas/Menu.aspx'
  where  idPerfil in ( 3, 4 )

    update Menu
  	set  titulo='Menú Socio' , Caracteristicas='Orientacion=H;Tipo=Menu Animadoa; MenuPrincipal=SI', tipo='Menu Animado' , MenuPrincipal='SI'
	---- Caracteristicas='Orientacion=H;Tipo=Menu Animado ; MenuPrincipal=SI',  tipo='Menu Animado' 
	 where IdMenu in  (  5026)

	 update Menu
  	set  titulo='Submenú Operaciones' , Caracteristicas='Orientacion=H;Tipo=Menu Lista; MenuPrincipal=NO', tipo='Menu Lista' , MenuPrincipal='NO'
	---- Caracteristicas='Orientacion=H;Tipo=Menu Animado ; MenuPrincipal=SI',  tipo='Menu Animado' 
	 where IdMenu in  (  5029)



    update OpcionMenu
	set Comando=5029 , Titulo='Operaciones'
    where IdOpcionMenu in  ( 50)


	 update OpcionMenu
	set Color='colorRojo' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8139)


	 update OpcionMenu
	set Color='colorMorado' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8140)

	update OpcionMenu
	set Color='colorAmarillo' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8141)


	update OpcionMenu
	set Color='colorAzul' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8142)

	update OpcionMenu
	set Color='colorAzulClaro' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8143)

		update OpcionMenu
	set Color='colorVerdeClaro' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 8144)



	update OpcionMenu
	set Color='colorNaranja' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 2200)

	update OpcionMenu
	set Color='colorRojo' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 2210)

	update OpcionMenu
	set Color='colorRosa' ,  Imagen=' icon-list' 
    where IdOpcionMenu in  ( 2220)

  update [OpcionMenu] 
  set  Comando='~/AdministracionCliente.aspx'
   where IdOpcionMenu=8141