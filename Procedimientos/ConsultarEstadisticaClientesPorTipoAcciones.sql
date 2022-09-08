	create procedure ConsultarEstadisticaClientesPorTipoAcciones
	as

	select idTipoCliente, acciones,observaciones, count(*) as Clientes FROM [DB_A72B95_drp].[dbo].[Cliente] 
	group by idTipoCliente, acciones,observaciones
	go

		exec ConsultarEstadisticaClientesPorTipoAcciones