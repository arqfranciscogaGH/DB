/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [id]
      ,[llave]
      ,[clave]
      ,[nombre]
      ,[fecha]
      ,[tipo]
      ,[idNivelRed]
      ,[usuarios]
      ,[equipos]
      ,[negocios]
      ,[costo]
      ,[fechaInicio]
      ,[fechaVencimiento]
      ,[Informacion]
      ,[idSuscriptor]
      ,[fechaEstatus]
      ,[estatus]
  FROM [DB_A72B95_drp].[dbo].[Suscripcion]


 SELECT TOP 1000 [id]
      ,[llave]
      ,[clave]
      ,[nombre]
      ,[tipo]
      ,[idSuscriptor]
      ,[estatus]
	   FROM [DB_A72B95_drp].[dbo].[Suscripcion]


update Suscripcion
	   set  clave='Cuauhtemoc.Baez' WHERE Nombre='Cuauhtemoc Baez Main'
update Suscripcion
	   set  clave='rafael.reyes' WHERE Nombre='Elias Rafael Reyes Valdes'
update Suscripcion
	   set  clave='ingrid.rodriguez' WHERE Nombre='Ingrid Rodriguez Arcipreste'
update Suscripcion
	   set  clave='victor.chavez' WHERE Nombre='Victor Chavez Ramirez'
update Suscripcion
	   set  clave='ismael.jaramillo' WHERE Nombre='Ismael Jaramillo Lagunas'



update Suscripcion
	   set  clave='martin.barri'  ,  nombre ='Leon Sergio Martin Barri Gonzalez'  WHERE Nombre='Martin Barri'

update Suscripcion
	   set  clave='claudia.rios',  nombre ='Claudia Patricia Rios Piña'  WHERE Nombre='Claudia Rios'


update Suscripcion
	   set  clave='daniel.novoa' WHERE Nombre='Daniel Novoa'

update Suscripcion
	   set  clave='martha.cordova' WHERE Nombre='Martha Leticia Cordova Barrera' 


update Suscripcion
	   set  clave='guadalupe.marquez' WHERE Nombre='Guadalupe Márquez Beltran'

update Suscripcion
	   set  clave='alexa.arzate' WHERE Nombre='Alejandra Ivonne Arzate Gonzalez'
update Suscripcion
	   set  clave='rodrigo.montes' WHERE Nombre='Rodrigo Montes de Oca Soto'
update Suscripcion
	   set  clave='diana.gonzalez' WHERE Nombre='Diana Paola Gonzalez Lozada'
update Suscripcion
	   set  clave='daniel.padilla' WHERE Nombre='Daniel Padilla Gomez'
update Suscripcion
	   set  clave='jose.gonzalez' WHERE Nombre='Jose Aurelio Gonzalez Mondragon'

update Suscripcion
	   set  clave='ricardo.velasco' WHERE Nombre='Ricardo Esteban Velasco España'
update Suscripcion
	   set  clave='loreto.velazquez' WHERE Nombre='Maria de Loreto Velazquez Cornejo'
update Suscripcion
	   set  clave='isaac.vazquez' WHERE Nombre='Isaac Vazquez Diaz'

update Suscripcion
	   set  clave='marco.robles' WHERE Nombre='Marco Antonio Robles Aroche'
update Suscripcion
	   set  clave='jose.rosaliano' WHERE Nombre='Jose Manuel Rosaliano Mendez'
update Suscripcion
	   set  clave='lorena.cureno' WHERE Nombre='Lorena Cureño'

update Suscripcion
	   set  clave='ignacio.martinez' WHERE Nombre='Ignacio Martinez Bautista'
update Suscripcion
	   set  clave='Francisco.Garcia' WHERE Nombre='Francisco Garcia Almaraz'
update Suscripcion
	   set  clave='desiree.hernandez' WHERE Nombre='Desiree Yolotzin Hernandez Gomez'
update Suscripcion
	   set  clave='Christopher.hernandez' WHERE Nombre='Christopher Donovan Hernandez Gomez'
update Suscripcion
	   set  clave='hugo.sevilla' WHERE Nombre='Hugo Edmundo Sevilla Aldana'
update Suscripcion
	   set  clave='Miguel.jasso' WHERE Nombre='Miguel Angel Aparicio Jasso'
update Suscripcion
	   set  clave='imelda.carrillo' WHERE Nombre='Imelda Yolanda Carrillo Estrada'
update Suscripcion
	   set  clave='isabel.rodriguez' WHERE Nombre='Maria Isabel Rodriguez Sanchez'

update Suscripcion
	   set  clave='giorgio' WHERE Nombre='Jorge Arturo Rizo Espinosa'
update Suscripcion
	   set  clave='andres.romero' WHERE Nombre='Andres Arturo Romero Arenas'
update Suscripcion
	   set  clave='alfonso.hernandez' WHERE Nombre='Alfonso Cuauhtemoc Hernandez Sandoval'
update Suscripcion
	   set  clave='jose.lopez' WHERE Nombre='Jose de Jesus Lopez Moran'
update Suscripcion
	   set  clave='angeles.jimenez' WHERE Nombre='Angeles Jimenez Tenorio'
update Suscripcion
	   set  clave='isrrael.valverde' WHERE Nombre='Isrrael Valverde Torres'
update Suscripcion
	   set  clave='veronica.ramirez' WHERE Nombre='Veronica Ramirez Cruz'
update Suscripcion
	   set  clave='Xavier.García' WHERE Nombre='Xavier Garcia Trejo'
update Suscripcion
	   set  clave='Olivia.cazares' WHERE Nombre='Olivia Cazares Leyva'

update Suscripcion
	   set  clave='noel.maldonado' WHERE Nombre='Noel Maldonado Ortiz'
update Suscripcion
	   set  clave='enrique.trujillo' WHERE Nombre='Enrique Aaron Trujillo'
update Suscripcion
	   set  clave='valeria.luna' WHERE Nombre='Valeria Luna Juarez'
update Suscripcion
	   set  clave='pablo.sanchez' WHERE Nombre='Pablo Jesus Sanchez de la Cruz'
update Suscripcion
	   set  clave='alan.maldonado' WHERE Nombre='Alan Aldahir Maldonado Lopez'
update Suscripcion
	   set  clave='juan.cisneros' WHERE Nombre='Juan Francisco Cisneros Flores'
update Suscripcion
	   set  clave='sara.lopez' WHERE Nombre='Sara Lopez Alfaro'





	   update Suscripcion
	   set  tipo='Silver'   WHERE Nombre='Elias Rafael Reyes Valdes'


	   update Suscripcion
	   set  clave=''  where id =1014

	   --- sosios giorgio
  INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Alejandra Ivonne Arzate Gonzalez','Gold','07/12/1986',2,1)

  INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Ricardo Esteban Velasco España','Gold','14/05/1962',2,1)



 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Marco Antonio Robles Aroche','Gold','01/11/1979',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Ignacio Martinez Bautista','Gold','12/04/1985',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Francisco Garcia Almaraz','Gold','26/02/1969',2,1)
  
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Andres Arturo Romero Arenas','Bronze','19/10/1987',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Alfonso Cuauhtemoc Hernandez Sandoval','Bronze','22/01/1973',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Jose de Jesus Lopez Moran','Bronze','24/08/1977',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Angeles Jimenez Tenorio','Bronze','13/01/1988',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Isrrael Valverde Torres','Bronze','11/01/1973',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Veronica Ramirez Cruz','Bronze','09/06/1986',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Xavier Garcia Trejo','Bronze','',2,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Olivia Cazares Leyva','Bronze','17/07/1985',2,1)

 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Noel Maldonado Ortiz','Gold','24/06/1979',2,1)

	
----

 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Rodrigo Montes de Oca Soto','Gold','30026',1014,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Diana Paola Gonzalez Lozada','Gold','30991',1014,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Daniel Padilla Gomez','Gold','29252',1014,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Jose Aurelio Gonzalez Mondragon','Gold','17126',1014,1)

-----


 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Maria de Loreto Velazquez Cornejo','Silver','08/11/1970',1015,1)
 
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Jose Manuel Rosaliano Mendez','Bronze','27132',1016,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Lorena Cureño','Bronze','',1016,1)

 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Desiree Yolotzin Hernandez Gomez','Bronze','34468',1017,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Christopher Donovan Hernandez Gomez','Bronze','36820',1017,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Hugo Edmundo Sevilla Aldana','Bronze','31293',1017,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Miguel Angel Aparicio Jasso','Bronze','31700',1017,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Imelda Yolanda Carrillo Estrada','Bronze','24273',1017,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Maria Isabel Rodriguez Sanchez','Bronze','28792',1017,1)

 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Enrique Aaron Trujillo','Silver','32325',1027,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Valeria Luna Juarez','Silver','36038',1027,1)


 ----

  INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Isaac Vazquez Diaz','Bronze','22/09/1970',1032,1)


 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Pablo Jesus Sanchez de la Cruz','Bronze','24366',1042,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Alan Aldahir Maldonado Lopez','Bronze','36003',1042,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Juan Francisco Cisneros Flores','Silver','35760',1041,1)
 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Sara Lopez Alfaro','Bronze','27547',1041,1)
