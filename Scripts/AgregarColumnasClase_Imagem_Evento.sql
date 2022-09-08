/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IdTareaEstatus]
      ,[IdTarea]
      ,[FlujoBasico]
      ,[Accion]
      ,[Variable]
      ,[Operador]
      ,[Valor]
      ,[IdEstatus]
      ,[IdTareaSiguiente]
      ,[Activo]
  FROM [DB_A72B95_drp].[dbo].[FlujoTrabajoTareaEstatus]


ALTER TABLE FlujoTrabajoTareaEstatus 
ADD Evento INT NULL ;

ALTER TABLE FlujoTrabajo 
ADD Clase nvarchar(max) NULL ;

ALTER TABLE FlujoTrabajo 
ADD Imagen nvarchar(max) NULL ;

select * from   FlujoTrabajoTareaEstatus where  IdTarea=107

update FlujoTrabajoTareaEstatus set Evento=1 where  IdTarea=107



select * from   FlujoTrabajo where  IdFlujoTrabajo=40
EXPRESS
update FlujoTrabajo set Clase='ELITE' , Imagen='Comun/servicios/remolavit.jpj'  where   IdFlujoTrabajo=10
update FlujoTrabajo set Clase='ELITE' , Imagen='Comun/servicios/mejoravit.jpj'  where   IdFlujoTrabajo=20
update FlujoTrabajo set Clase='ELITE' , Imagen='Comun/servicios/mejoravit.jpj'  where   IdFlujoTrabajo=30
update FlujoTrabajo set Clase='ELITE' , Imagen='Comun/servicios/mejoravit.jpj'  where   IdFlujoTrabajo=40
update FlujoTrabajo set Clase='ELITE' , Imagen='Comun/servicios/mejoravit.jpj'  where   IdFlujoTrabajo=50

