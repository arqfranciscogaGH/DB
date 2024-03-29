/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [id]
      ,[llave]
      ,[clave]
      ,[nombre]
      ,[descricpion]
      ,[idTipoPersona]
      ,[idUsuario]
      ,[apellidoPaterno]
      ,[apellidoMaterno]
      ,[rfc]
      ,[curp]
      ,[telefono]
      ,[telefonoMovil]
      ,[correo]
      ,[genero]
      ,[direccion]
      ,[referencia]
      ,[banco]
      ,[cuentaBanco]
      ,[importe]
      ,[saldo]
      ,[rutaFoto]
      ,[urlFoto]
      ,[fechaNacimiento]
      ,[fecha]
      ,[fechaEntrega]
      ,[fechaRegistro]
      ,[idSuscriptor]
      ,[fechaEstatus]
      ,[estatus]
  FROM [DB_A72B95_drp].[dbo].[Persona]

  truncate   table  [DB_A72B95_drp].[dbo].[Persona]

  ---  primer  parte
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Monica Araceli Rios Piña','39937738043','07/02/1977',118791.14,1,1010)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('David González Aguilar','30988020381','22/09/1980',477000,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Nelly Jair Marino Pacheco','11018337607','12/07/1983',429332.54,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Alma Nashieli Rios Ortiz','30886801361','17/03/1968',259712.03,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Alejandro Rodríguez Limón','37947111417','18/07/1971',526888.85,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Oscar Baca Botello','92907375726','19/03/1975',93609.08,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jose Guadalupe Cruz Landero','62856918354','25549',465271,1,4)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Carlos Hernandez Hernandez','01907402703','27196',218532.85,1,1008)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Abraham Elias Bolaños Alonso','92028605829','31483',99988,1,1008)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Francisco Alejandro Romero Gutierrez','30947539083','27400',206359.43,1,1008)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Karina Oceguera Torres','68927728482','04/12/1977',150840.45,1,1008)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Moises Gonzalez Torres','92998305368','30433',138387,1,1008)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Eduardo Octavio Ochoa Reyes','11967512143','27560',259057.99,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Nora Andrea Azcue Funtanet','11068107447','29695',140145,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Guadalupe Hernandez Cortes','45977806384','28574',268580,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Francisco Garcia Almaraz','53896939138','25260',337809.98,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jose Alberto Martínez Gutierrez','16068005632','29228',262191.81,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Armando Gonzalez Rodriguez','16077601736','28163',126651.19,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Gerardo Reyes Alcocer','16907310441','27014',217259,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Juan Luis Juarez Avila','20977718921','28269',289947.51,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Alejandro Intriago Sierra','16866421783','23505',517051,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Ricardo Carrillo Sierra','01937416756','27186',170102.8485,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Isrrael Valverde Torres','92907356148','26675',227903.03,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Juan Manuel Zarate Hernández','37058100761','29654',152834.5,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jennifer Marcela Romero Arenas','45088408955','30928',135145.27,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Edgar Oswaldo Moguel Avila','01997501190','27530',131113.07,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Marco Antonio Huerta Altamirano','02917418663','27182',177193.61,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Nevio Nava Masironi','92905705221','20975',477000,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jonathan Sergio Reyes Reyes','92038320666','30567',84763.37,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Blanca Selene Rubio Tapia','92998000670','29366',270644.36,1,2)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Roberto Ramirez Jimenez','68957516393','27710',181540.07,1,2)

 


  INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Raquel Olvera Cordero','45927488408','21/09/1974',491459.76,1,1035)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Fabiola Lopez Vazquez','07068510184','07/05/1985',111488.2,1,1017)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Norma Escobar Lopez','11947433626','24/12/1974',277183.35,1,1017)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Antonio Israel Fuentes Jauregui','11967614592','15/05/1976',477000,1,1017)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Julio Cesar Aguilar Saldivar','92109111408','16/04/1991',119517,1,1017)


  INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Humberto Jose Luis Hernandez Falcon','92886863817','07/05/1968',111759,1,1025)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Danny Sánchez Solorio','45048104801','',197133.79,1,1034)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Juan Mauricio Robles Aroche','20088605165','19/11/1986',150875.23,1,1016)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jesus Miguel Perez Alvarez','16048646281','30/06/1986',143024.67,1,1016)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jose Guadalupe Martinez Alonso','01017401520','20/07/1974',156828.77,1,1030)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Leovigildo Sosa Hernandez','78098815299','08/11/1988',107037,1,1030)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Laura Mijares Maldonado','30927481652','',210795.41,1,1029)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Shanna Ambar Johnson Navarro','11068708483','30/05/1987',177578.14,1,1029)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Maria del Carmen Sanchez Herrera','92957747097','05/06/1977',112275.86,1,1029)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Beatriz Adriana Alvarado Madrazo','30927309630','29/10/1974',98375.25,1,1031)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Máximo Javier Castillo de la Rosa','90947536257','14/12/1975',477000,1,1028)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Elizabeth Flores Perez','42866830328','20/11/1968',98381.31,1,1046)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Ana Verónica Garcia Rincón','45028338601','16/03/1983',104515,1,1041)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Jose Antonio Moreno Anaya','39998113896','13/12/1981',146073,1,1027)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Armando Espinosa Garcia','03146208305','24/11/1969',98580.69,1,1027)
 INSERT INTO [DB_A72B95_drp].[dbo].[Persona] (nombre, referencia, fechaNacimiento, saldo, estatus, idSuscriptor)   VALUES ('Ana Cecilia Marin Rodriguez','90038429487','03/12/1984',144907,1,1027)



 EXEC  AvanzarActividad 'LINEAIV','39937738043', 'INICIAR','','','@Importe:118791.14, @Nombre:Monica Araceli Rios Piña','@IdSocio:1010, @importe:118791.14'
EXEC  AvanzarActividad 'LINEAIV','30988020381', 'INICIAR','','','@Importe:477000, @Nombre:David González Aguilar','@IdSocio:4, @importe:477000'
EXEC  AvanzarActividad 'LINEAIV','11018337607', 'INICIAR','','','@Importe:429332.54, @Nombre:Nelly Jair Marino Pacheco','@IdSocio:4, @importe:429332.54'
EXEC  AvanzarActividad 'LINEAIV','30886801361', 'INICIAR','','','@Importe:259712.03, @Nombre:Alma Nashieli Rios Ortiz','@IdSocio:4, @importe:259712.03'
EXEC  AvanzarActividad 'LINEAIV','37947111417', 'INICIAR','','','@Importe:526888.85, @Nombre:Alejandro Rodríguez Limón','@IdSocio:4, @importe:526888.85'
EXEC  AvanzarActividad 'LINEAIV','92907375726', 'INICIAR','','','@Importe:93609.08, @Nombre:Oscar Baca Botello','@IdSocio:4, @importe:93609.08'
EXEC  AvanzarActividad 'LINEAIV','62856918354', 'INICIAR','','','@Importe:465271, @Nombre:Jose Guadalupe Cruz Landero','@IdSocio:4, @importe:465271'
EXEC  AvanzarActividad 'LINEAIV','01907402703', 'INICIAR','','','@Importe:218532.85, @Nombre:Carlos Hernandez Hernandez','@IdSocio:1008, @importe:218532.85'
EXEC  AvanzarActividad 'LINEAIV','92028605829', 'INICIAR','','','@Importe:99988, @Nombre:Abraham Elias Bolaños Alonso','@IdSocio:1008, @importe:99988'
EXEC  AvanzarActividad 'LINEAIV','30947539083', 'INICIAR','','','@Importe:206359.43, @Nombre:Francisco Alejandro Romero Gutierrez','@IdSocio:1008, @importe:206359.43'
EXEC  AvanzarActividad 'LINEAIV','68927728482', 'INICIAR','','','@Importe:150840.45, @Nombre:Karina Oceguera Torres','@IdSocio:1008, @importe:150840.45'
EXEC  AvanzarActividad 'LINEAIV','92998305368', 'INICIAR','','','@Importe:138387, @Nombre:Moises Gonzalez Torres','@IdSocio:1008, @importe:138387'

EXEC  AvanzarActividad 'LINEAIV','11967512143', 'INICIAR','','','@Importe:259057.99, @Nombre:Eduardo Octavio Ochoa Reyes','@IdSocio:2, @importe:259057.99'
EXEC  AvanzarActividad 'LINEAIV','11068107447', 'INICIAR','','','@Importe:140145, @Nombre:Nora Andrea Azcue Funtanet','@IdSocio:2, @importe:140145'
EXEC  AvanzarActividad 'LINEAIV','45977806384', 'INICIAR','','','@Importe:268580, @Nombre:Guadalupe Hernandez Cortes','@IdSocio:2, @importe:268580'
EXEC  AvanzarActividad 'LINEAIV','53896939138', 'INICIAR','','','@Importe:337809.98, @Nombre:Francisco Garcia Almaraz','@IdSocio:2, @importe:337809.98'
EXEC  AvanzarActividad 'LINEAIV','16068005632', 'INICIAR','','','@Importe:262191.81, @Nombre:Jose Alberto Martínez Gutierrez','@IdSocio:2, @importe:262191.81'
EXEC  AvanzarActividad 'LINEAIV','16077601736', 'INICIAR','','','@Importe:126651.19, @Nombre:Armando Gonzalez Rodriguez','@IdSocio:2, @importe:126651.19'
EXEC  AvanzarActividad 'LINEAIV','16907310441', 'INICIAR','','','@Importe:217259, @Nombre:Gerardo Reyes Alcocer','@IdSocio:2, @importe:217259'
EXEC  AvanzarActividad 'LINEAIV','20977718921', 'INICIAR','','','@Importe:289947.51, @Nombre:Juan Luis Juarez Avila','@IdSocio:2, @importe:289947.51'
EXEC  AvanzarActividad 'LINEAIV','16866421783', 'INICIAR','','','@Importe:517051, @Nombre:Alejandro Intriago Sierra','@IdSocio:2, @importe:517051'
EXEC  AvanzarActividad 'LINEAIV','01937416756', 'INICIAR','','','@Importe:170102.8485, @Nombre:Ricardo Carrillo Sierra','@IdSocio:2, @importe:170102.8485'
EXEC  AvanzarActividad 'LINEAIV','92907356148', 'INICIAR','','','@Importe:227903.03, @Nombre:Isrrael Valverde Torres','@IdSocio:2, @importe:227903.03'
EXEC  AvanzarActividad 'LINEAIV','37058100761', 'INICIAR','','','@Importe:152834.5, @Nombre:Juan Manuel Zarate Hernández','@IdSocio:2, @importe:152834.5'
EXEC  AvanzarActividad 'LINEAIV','45088408955', 'INICIAR','','','@Importe:135145.27, @Nombre:Jennifer Marcela Romero Arenas','@IdSocio:2, @importe:135145.27'
EXEC  AvanzarActividad 'LINEAIV','01997501190', 'INICIAR','','','@Importe:131113.07, @Nombre:Edgar Oswaldo Moguel Avila','@IdSocio:2, @importe:131113.07'
EXEC  AvanzarActividad 'LINEAIV','02917418663', 'INICIAR','','','@Importe:177193.61, @Nombre:Marco Antonio Huerta Altamirano','@IdSocio:2, @importe:177193.61'
EXEC  AvanzarActividad 'LINEAIV','92905705221', 'INICIAR','','','@Importe:477000, @Nombre:Nevio Nava Masironi','@IdSocio:2, @importe:477000'
EXEC  AvanzarActividad 'LINEAIV','92038320666', 'INICIAR','','','@Importe:84763.37, @Nombre:Jonathan Sergio Reyes Reyes','@IdSocio:2, @importe:84763.37'
EXEC  AvanzarActividad 'LINEAIV','92998000670', 'INICIAR','','','@Importe:270644.36, @Nombre:Blanca Selene Rubio Tapia','@IdSocio:2, @importe:270644.36'
EXEC  AvanzarActividad 'LINEAIV','68957516393', 'INICIAR','','','@Importe:181540.07, @Nombre:Roberto Ramirez Jimenez','@IdSocio:2, @importe:181540.07'

------------------------

EXEC  AvanzarActividad 'LINEAIV','45927488408', 'INICIAR','','','@Importe:491459.76, @Nombre:Raquel Olvera Cordero','@IdSocio:1035, @importe:491459.76,@Grupo:3'
EXEC  AvanzarActividad 'LINEAIV','07068510184', 'INICIAR','','','@Importe:111488.2, @Nombre:Fabiola Lopez Vazquez','@IdSocio:1017, @importe:111488.2,@Grupo:3'
EXEC  AvanzarActividad 'LINEAIV','11947433626', 'INICIAR','','','@Importe:277183.35, @Nombre:Norma Escobar Lopez','@IdSocio:1017, @importe:277183.35,@Grupo:3'
EXEC  AvanzarActividad 'LINEAIV','11967614592', 'INICIAR','','','@Importe:477000, @Nombre:Antonio Israel Fuentes Jauregui','@IdSocio:1017, @importe:477000,@Grupo:3'
EXEC  AvanzarActividad 'LINEAIV','92109111408', 'INICIAR','','','@Importe:119517, @Nombre:Julio Cesar Aguilar Saldivar','@IdSocio:1017, @importe:119517,@Grupo:3'


EXEC  AvanzarActividad 'LINEAIV','92886863817', 'INICIAR','','','@Importe:111759, @Nombre:Humberto Jose Luis Hernandez Falcon','@IdSocio:1025, @importe:111759,@Grupo:2'
EXEC  AvanzarActividad 'LINEAIV','45048104801', 'INICIAR','','','@Importe:197133.79, @Nombre:Danny Sánchez Solorio','@IdSocio:1034, @importe:197133.79,@Grupo:6'
EXEC  AvanzarActividad 'LINEAIV','20088605165', 'INICIAR','','','@Importe:150875.23, @Nombre:Juan Mauricio Robles Aroche','@IdSocio:1016, @importe:150875.23,@Grupo:6'
EXEC  AvanzarActividad 'LINEAIV','16048646281', 'INICIAR','','','@Importe:143024.67, @Nombre:Jesus Miguel Perez Alvarez','@IdSocio:1016, @importe:143024.67,@Grupo:6'
EXEC  AvanzarActividad 'LINEAIV','01017401520', 'INICIAR','','','@Importe:156828.77, @Nombre:Jose Guadalupe Martinez Alonso','@IdSocio:1030, @importe:156828.77,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','78098815299', 'INICIAR','','','@Importe:107037, @Nombre:Leovigildo Sosa Hernandez','@IdSocio:1030, @importe:107037,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','30927481652', 'INICIAR','','','@Importe:210795.41, @Nombre:Laura Mijares Maldonado','@IdSocio:1029, @importe:210795.41,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','11068708483', 'INICIAR','','','@Importe:177578.14, @Nombre:Shanna Ambar Johnson Navarro','@IdSocio:1029, @importe:177578.14,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','92957747097', 'INICIAR','','','@Importe:112275.86, @Nombre:Maria del Carmen Sanchez Herrera','@IdSocio:1029, @importe:112275.86,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','30927309630', 'INICIAR','','','@Importe:98375.25, @Nombre:Beatriz Adriana Alvarado Madrazo','@IdSocio:1031, @importe:98375.25,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','90947536257', 'INICIAR','','','@Importe:477000, @Nombre:Máximo Javier Castillo de la Rosa','@IdSocio:1028, @importe:477000,@Grupo:7'
EXEC  AvanzarActividad 'LINEAIV','42866830328', 'INICIAR','','','@Importe:98381.31, @Nombre:Elizabeth Flores Perez','@IdSocio:1046, @importe:98381.31,@Grupo:5'
EXEC  AvanzarActividad 'LINEAIV','45028338601', 'INICIAR','','','@Importe:104515, @Nombre:Ana Verónica Garcia Rincón','@IdSocio:1041, @importe:104515,@Grupo:5'
EXEC  AvanzarActividad 'LINEAIV','39998113896', 'INICIAR','','','@Importe:146073, @Nombre:Jose Antonio Moreno Anaya','@IdSocio:1027, @importe:146073,@Grupo:5'
EXEC  AvanzarActividad 'LINEAIV','03146208305', 'INICIAR','','','@Importe:98580.69, @Nombre:Armando Espinosa Garcia','@IdSocio:1027, @importe:98580.69,@Grupo:5'
EXEC  AvanzarActividad 'LINEAIV','90038429487', 'INICIAR','','','@Importe:144907, @Nombre:Ana Cecilia Marin Rodriguez','@IdSocio:1027, @importe:144907,@Grupo:5'


 exec  ConsultarMisPendientes 'LINEAIV','',1




EXEC  AvanzarActividad 'LINEAIV','100', 'TERMINAR','','', '@FechaInicio: 01-01-2021, @FechaTernimacion : 12-02-2021,	@Descripcion: descripcion ,@Clasificacion:Clasificacion ,@Referencia:Referencia, @Numero: 123456789 , @Importe:100000, @Nombre: XXXXXX, @IdUsuario:usuario,@IdPerfil:Perfil,@IdEquipo:equipo,@Observacion:obs,@Resultado:RESUESTA','@IdSocio:1,@IdGrupo:B&D, @importe:310000'

------




 EXEC  AvanzarActividad 'LINEAIV','92998000670', 'INICIAR','','','',''
 EXEC  AvanzarActividad 'LINEAIV','92998000670', 'TERMINAR','','','',''

 92998000670






    select  * from  FlujoTrabajoInstancia  where  identificador ='45088408955'

  select  * from  FlujoTrabajoHistorial where  identificador ='45977806384'



 ---  regresar de estatus
update   FlujoTrabajoInstancia 
set   idtarea=15,  idactividad=15,   Idestatus=36
where idinstancia =16

update   FlujoTrabajoHistorial 
set    IdEstatusTarea=1,   Idestatus=null
where idhistorial in  ( 81   )

delete FlujoTrabajoHistorial   where  idhistorial in  ( 82   )

 select  * from  FlujoTrabajoInstancia  where  identificador ='53896939138'

  select  * from  FlujoTrabajoHistorial where  identificador ='53896939138'



  


   select  * from FlujoTrabajoEstatus
  exec  ConsultarMisPendientes 'LINEAIV','',1