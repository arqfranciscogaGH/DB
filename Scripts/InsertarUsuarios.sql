


 SELECT TOP 1000 [id]
      ,[clave]
      ,[nombre]
      ,[tipo]
	  ,fechainicio
      ,[idSuscriptor]
      ,[estatus]
	   FROM [DB_A72B95_drp].[dbo].[Suscripcion]  where  id> 1013   and  idSuscriptor in ( 1016 ) 



 SELECT  '  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES (' + ''''+clave+'''' +','+'''123'',' +''''+nombre+'''' +','+''''+fechainicio+''''+ ','+convert(varchar,id) +',''6'''+ ',1)' 
  FROM [DB_A72B95_drp].[dbo].[Suscripcion]  where  id> 1013   and  idSuscriptor  in ( 1016 ) 




    INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('jose.rosaliano','123','Jose Manuel Rosaliano Mendez','27132',1033,'6',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('lorena.cureno','123','Lorena Cureño','',1034,'6',1)

    INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('loreto.velazquez','123','Maria de Loreto Velazquez Cornejo','08/11/1970',1032,'8',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('isaac.vazquez','123','Isaac Vazquez Diaz','22/09/1970',1043,'8',1)


    INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('enrique.trujillo','123','Enrique Aaron Trujillo','32325',1041,'5',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('valeria.luna','123','Valeria Luna Juarez','36038',1042,'5',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('pablo.sanchez','123','Pablo Jesus Sanchez de la Cruz','24366',1044,'5',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('alan.maldonado','123','Alan Aldahir Maldonado Lopez','36003',1045,'5',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('juan.cisneros','123','Juan Francisco Cisneros Flores','35760',1046,'5',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('sara.lopez','123','Sara Lopez Alfaro','27547',1047,'5',1)


    INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('rodrigo.montes','123','Rodrigo Montes de Oca Soto','30026',1028,'7',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('diana.gonzalez','123','Diana Paola Gonzalez Lozada','30991',1029,'7',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('daniel.padilla','123','Daniel Padilla Gomez','29252',1030,'7',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('jose.gonzalez','123','Jose Aurelio Gonzalez Mondragon','17126',1031,'7',1)


  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('desiree.hernandez','123','Desiree Yolotzin Hernandez Gomez','34468',1035,'3',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('Christopher.hernandez','123','Christopher Donovan Hernandez Gomez','36820',1036,'3',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('hugo.sevilla','123','Hugo Edmundo Sevilla Aldana','31293',1037,'3',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('Miguel.jasso','123','Miguel Angel Aparicio Jasso','31700',1038,'3',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('imelda.carrillo','123','Imelda Yolanda Carrillo Estrada','24273',1039,'3',1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('isabel.rodriguez','123','Maria Isabel Rodriguez Sanchez','28792',1040,'3',1)


  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('ricardo.velasco','123','Ricardo Esteban Velasco España','14/05/1962',1015,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('marco.robles','123','Marco Antonio Robles Aroche','01/11/1979',1016,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('ignacio.martinez','123','Ignacio Martinez Bautista','12/04/1985',1017,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('Francisco.Garcia','123','Francisco Garcia Almaraz','26/02/1969',1018,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('andres.romero','123','Andres Arturo Romero Arenas','19/10/1987',1019,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('alfonso.hernandez','123','Alfonso Cuauhtemoc Hernandez Sandoval','22/01/1973',1020,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('jose.lopez','123','Jose de Jesus Lopez Moran','24/08/1977',1021,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('angeles.jimenez','123','Angeles Jimenez Tenorio','13/01/1988',1022,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('isrrael.valverde','123','Isrrael Valverde Torres','11/01/1973',1023,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('veronica.ramirez','123','Veronica Ramirez Cruz','09/06/1986',1024,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('Xavier.García','123','Xavier Garcia Trejo','',1025,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('Olivia.cazares','123','Olivia Cazares Leyva','17/07/1985',1026,1)
  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, estatus)   VALUES ('noel.maldonado','123','Noel Maldonado Ortiz','24/06/1979',1027,1)


  INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('alexa.arzate','123','Alejandra Ivonne Arzate Gonzalez','07/12/1986',1014,'7',1)


    INSERT INTO Usuario (cuenta, contrasena,nombre,fecha, idSuscriptor, grupos,estatus)   VALUES ('martha.cordova','123','Martha Leticia Cordova Barrera','',1013,'4',1)

select  * from  usuario

select  cuenta, contrasena, nombre, fecha, idSuscriptor , estatus from  usuario 

UPDATE  usuario
SET  grupos='3'
where   id  =1018

select  * from  usuario

select  * from  grupo

insert  grupo select  '','','giorgio' , '',1,'',1

insert  grupo select  '','','B&D' , '',1,'',1
insert  grupo select  '','','Cuauh' , '',1,'',1
insert  grupo select  '','','Soccer' , '',1,'',1
insert  grupo select  '','','Jc&Mar' , '',1,'',1
insert  grupo select  '','','Redes' , '',1,'',1
insert  grupo select  '','','L&R' , '',1,'',1




 INSERT INTO Suscripcion (nombre, tipo,fechaInicio, idSuscriptor, estatus)   VALUES ('Alejandra Ivonne Arzate Gonzalez','Gold','07/12/1986',2,1)

