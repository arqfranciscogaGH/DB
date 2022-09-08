 	CREATE PROCEDURE  ConsultarEstadisticaClientes
	AS

		select 	FORMAT(CONVERT(datetime, fechaRegistro, 103), 'yyyy-MM-dd') as Fecha,idOperacion as Turno,cuentaBanco as Hora
		,count(*) as  Clientes 
		FROM [DB_A72B95_drp].[dbo].[Cliente]
		group  by  FORMAT(CONVERT(datetime, fechaRegistro, 103), 'yyyy-MM-dd') ,idOperacion,cuentaBanco
		order by 1 desc
	GO

	exec ConsultarEstadisticaClientes