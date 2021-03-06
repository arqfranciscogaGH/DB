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
  FROM Persona


  SELECT TOP 1000 [IdInstancia]
      ,[IdFlujoTrabajo]
      ,[IdTarea]
      ,[IdActividad]
      ,[IdEstatus]
      ,[FechaInicio]
      ,[FechaTernimacion]
      ,[Identificador]
      ,[Nombre]
      ,[Descripcion]
      ,[Clasificacion]
      ,[Importe]
      ,[Numero]
      ,[Referencia]
      ,[Variables]
      ,[IdUsuario]
      ,[IdPerfil]
      ,[IdEquipo]
      ,[IdEstatusTarea]
      ,[Activo]
  FROM FlujoTrabajoInstancia  WHERE  Identificador='3'

ALTER  PROCEDURE  [dbo].[ConsultarServiciosPorCliente]
@id INT=0 ,
@filtro INT=0 
AS
   IF @id>0
	   SELECT P.id,I.idInstancia,I.identificador,I.nombre,I.importe, I.idFlujoTrabajo,f.nombre as servicio  FROM Persona P WITH (NOLOCK) 
	   INNER JOIN  FlujoTrabajoInstancia I WITH (NOLOCK)  ON P.id=i.Numero
	   INNER JOIN    FlujoTrabajo  F WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
	   WHERE I.idInstancia=@id
   ELSE 
	   SELECT P.id,I.idInstancia,I.identificador,I.nombre,I.importe, I.idFlujoTrabajo,f.nombre as servicio  FROM Persona P WITH (NOLOCK) 
	   INNER JOIN  FlujoTrabajoInstancia I WITH (NOLOCK)  ON P.id=i.Numero
	   INNER JOIN    FlujoTrabajo  F WITH (NOLOCK) ON I.IdFlujoTrabajo=F.IdFlujoTrabajo
	   WHERE P.id=@filtro
go

  EXEC  ConsultarServiciosPorCliente 0,10
  EXEC  ConsultarServiciosPorCliente 1,0