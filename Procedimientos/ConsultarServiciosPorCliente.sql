

ALTER  PROCEDURE  [dbo].[ConsultarServiciosPorCliente]
@id INT=0 ,
@filtro nvarchar(100)=''
AS
   IF @filtro='INSTANCIA'  AND  @id>0
	   SELECT C.id,I.idInstancia,I.identificador,I.nombre,I.importe, I.idFlujoTrabajo,f.nombre as servicio  FROM Cliente C  WITH (NOLOCK) 
	   INNER JOIN  FlujoTrabajoInstancia I WITH (NOLOCK)  ON I.IdCliente=C.Id
	   INNER JOIN    FlujoTrabajo  F WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
	   WHERE I.idInstancia=@id
   ELSE IF @filtro='CLIENTE'  AND  @id>0
	   SELECT C.id,I.idInstancia,I.identificador,I.nombre,I.importe, I.idFlujoTrabajo,f.nombre as servicio  FROM Cliente C WITH (NOLOCK) 
	   INNER JOIN  FlujoTrabajoInstancia I WITH (NOLOCK)  ON I.IdCliente=C.Id
	   INNER JOIN    FlujoTrabajo  F WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
	   WHERE C.Id=@id
go

  EXEC  ConsultarServiciosPorCliente 20,'INSTANCIA'
  EXEC  ConsultarServiciosPorCliente 87, 'CLIENTE'