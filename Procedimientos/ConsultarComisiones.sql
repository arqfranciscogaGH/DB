/****** Script for SelectTopNRows command from SSMS  ******/
ALTER  PROCEDURE  ConsultarComisiones
AS
SELECT BC.IdBase, CS.idComision,  BC.IdSocio AS IdsocioOrigen, UO.Cuenta  AS  CuentaOrigen, UD.Cuenta CuentaSocio,CS.idSocio AS idSocio , P.Nombre Socio,nivelRed, comisionSocioRed, CS.Tipo, C.nombre as nombreCliente,
CASE CS.Tipo WHEN 'Socio' THEN 'Ciente:'+C.nombre
			 WHEN 'Red' THEN 'SocioRed:'+UO.Cuenta  
END AS Descricpion,
CASE CS.IdEstatusPago WHEN 0 THEN 'Activa'
					    WHEN 1 THEN 'Por Pagar'
						WHEN 2 THEN 'Pagada'
END AS Estatus
  FROM BaseCalculoServicio BC
  INNER JOIN ComisionServicio CS  ON CS.IdInstancia=BC.IdInstancia
  INNER JOIN CuentaUsuario UO  ON UO.IdUsuario =BC.idSocio
  INNER JOIN CuentaUsuario UD ON UD.IdUsuario =CS.idSocio
  INNER JOIN Persona P ON P.IdUsuario=UD.IdUsuario 
  INNER JOIN Cliente C ON C.id=BC.idCliente
   ORDER BY  CS.idSocio
GO


 ALTER   PROCEDURE  ConsultarComisionesPorSocio
 	@idSocio INT=0 ,
	@tipo varchar(20)='Todos'
AS
IF @tipo='Todos'
	SELECT BC.IdBase, CS.idComision,  BC.IdSocio AS IdsocioOrigen, UO.Cuenta  AS  CuentaOrigen, UD.Cuenta CuentaSocio,CS.idSocio AS idSocio , P.Nombre Socio,nivelRed, comisionSocioRed, CS.Tipo, C.nombre as nombreCliente,
	CASE CS.Tipo WHEN 'Socio' THEN 'Ciente:'+C.nombre
				 WHEN 'Red' THEN 'SocioRed:'+UO.Cuenta  
	END AS Descricpion,
	CASE CS.IdEstatusPago WHEN 0 THEN 'Activa'
					      WHEN 1 THEN 'Por Pagar'
						  WHEN 2 THEN 'Pagada'
	END AS Estatus
	  FROM BaseCalculoServicio BC
	  INNER JOIN ComisionServicio CS  ON CS.IdInstancia=BC.IdInstancia
	  INNER JOIN CuentaUsuario UO  ON UO.IdUsuario =BC.idSocio
	  INNER JOIN CuentaUsuario UD ON UD.IdUsuario =CS.idSocio
	  INNER JOIN Persona P ON P.IdUsuario=UD.IdUsuario 
	  INNER JOIN Cliente C ON C.id=BC.idCliente
	  WHERE CS.idSocio=@IdSocio
	  ORDER BY  CS.idSocio
ELSE
	SELECT BC.IdBase, CS.idComision,  BC.IdSocio AS IdsocioOrigen, UO.Cuenta  AS  CuentaOrigen, UD.Cuenta CuentaSocio,CS.idSocio AS idSocio , P.Nombre Socio,nivelRed, comisionSocioRed, CS.Tipo, C.nombre as nombreCliente,
	CASE CS.Tipo WHEN 'Socio' THEN 'Ciente:'+C.nombre
				 WHEN 'Red' THEN 'SocioRed:'+UO.Cuenta  
	END AS Descricpion,
	CASE CS.IdEstatusPago WHEN 0 THEN 'Activa'
					      WHEN 1 THEN 'Por Pagar'
						  WHEN 2 THEN 'Pagada'
	END AS Estatus
	  FROM BaseCalculoServicio BC
	  INNER JOIN ComisionServicio CS  ON CS.IdInstancia=BC.IdInstancia
	  INNER JOIN CuentaUsuario UO  ON UO.IdUsuario =BC.idSocio
	  INNER JOIN CuentaUsuario UD ON UD.IdUsuario =CS.idSocio
	  INNER JOIN Persona P ON P.IdUsuario=UD.IdUsuario 
	  INNER JOIN Cliente C ON C.id=BC.idCliente
	  WHERE CS.idSocio=@IdSocio AND UPPER(CS.Tipo)=UPPER(@tipo)
	  ORDER BY  CS.idSocio
go

  EXEC ConsultarComisiones

  EXEC ConsultarComisionesPorSocio 1010
  EXEC ConsultarComisionesPorSocio 1007, 'red'


  EXEC  consultarSocios 1,''

  update  ComisionServicio
    set  fechaIActivacion=Getdate()
  where idComision>1  


  

  exec VerFlujoTrabajo 'CP', 1

EXEC ConsultarHistorial 'CP','39937738043'

EXEC Seguimiento 'CP','39937738043'
  

   SELECT * FROM CuentaUsuario

  SELECT * FROM FlujoTrabajoInstancia

 SELECT * FROM  BaseCalculoServicio  
SELECT * FROM  ComisionServicio 

update ComisionServicio
set nivelRed='Franquicia KunGio' , claveNivelRed='F'
where idComision=11

DELETE FROM  BaseCalculoServicio  
DELETE FROM  ComisionServicio 

DELETE FROM  FlujoTrabajoHistorial where IdInstancia>90
DELETE FROM FlujoTrabajoVariable where IdInstancia>90
DELETE FROM FlujoTrabajoInstancia  where IdInstancia>90