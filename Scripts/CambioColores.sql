/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IdOpcionMenu]
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
  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=11 ORDER   BY Orden


  
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorRojoO10'  WHERE  IdMenu=11 AND IdOpcionMenu=50
   
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorMoradoO10'  WHERE  IdMenu=11 AND IdOpcionMenu=33


  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorAzulO10'  WHERE  IdMenu=11 AND IdOpcionMenu=32

     UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorAzulVerdeC10'  WHERE  IdMenu=11 AND IdOpcionMenu=34


   UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorVerdeO10'  WHERE  IdMenu=11 AND IdOpcionMenu=8160

   UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]
   SET Color='colorAmarilloO10'  WHERE  IdMenu=11 AND IdOpcionMenu=6121


   /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=516 ORDER   BY Orden

  
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO09'  WHERE  IdMenu=516 AND IdOpcionMenu=80
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO08'  WHERE  IdMenu=516 AND IdOpcionMenu=82
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO07'  WHERE  IdMenu=516 AND IdOpcionMenu=84
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO06'  WHERE  IdMenu=516 AND IdOpcionMenu=86
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO05'  WHERE  IdMenu=516 AND IdOpcionMenu=88
  UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorRojoO04'  WHERE  IdMenu=516 AND IdOpcionMenu=6120

SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=5031 ORDER   BY Orden

SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=516 ORDER   BY Orden

SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=214 ORDER   BY Orden

SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=12 ORDER   BY Orden

UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC09'  WHERE  IdMenu=12 AND IdOpcionMenu=6
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC08'  WHERE  IdMenu=12 AND IdOpcionMenu=7
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC07'  WHERE  IdMenu=12 AND IdOpcionMenu=8
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC06'  WHERE  IdMenu=12 AND IdOpcionMenu=27
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC05'  WHERE  IdMenu=12 AND IdOpcionMenu=51
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorAzulVerdeC04'  WHERE  IdMenu=12 AND IdOpcionMenu=2105

SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=1001 ORDER   BY Orden

UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO09'  WHERE  IdMenu=1001 AND IdOpcionMenu=1097
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO08'  WHERE  IdMenu=1001 AND IdOpcionMenu=1098
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO07'  WHERE  IdMenu=1001 AND IdOpcionMenu=1099
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO06'  WHERE  IdMenu=1001 AND IdOpcionMenu=1100
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO05'  WHERE  IdMenu=1001 AND IdOpcionMenu=1101
UPDATE  [DB_A72B95_drp].[dbo].[OpcionMenu]  SET Color='colorVerdeO04'  WHERE  IdMenu=1001 AND IdOpcionMenu=3113

colorVerdeO10
SELECT  *  FROM [DB_A72B95_drp].[dbo].[OpcionMenu] WHERE  IdMenu=2003 ORDER   BY Orden