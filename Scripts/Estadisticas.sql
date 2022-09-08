USE [DB_A72B95_drp]



---   IdGrupo=3
---  IdSocio=1017'

	    SELECT id , clave,  concepto, count(*) as cuenta   , SUM( CONVERT(int , importe / 1000 ) ) as importe  

			

exec VerEstadisticasFlujoPorTarea 'LINEAIV','' ,1
exec VerEstadisticasFlujoPorTarea  'LINEAIV','' ,1



EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=1' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=1, IdTarea=2,IdTarea=5' ,1  -- TAREA


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2' ,1  -- GRUPO
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=2' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=2, IdGrupo=2,IdGrupo=3' ,1  -- GRUPO 


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3' ,1  -- SOCIO
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=3' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=3, IdSocio=2,IdSocio=4' ,1  -- SOCIO


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3, IdSocio=1017,IdSocio=1029' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=3, IdSocio=1017,IdSocio=1029' ,1  -- SOCIO


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3, IdSocio=1017,IdSocio=1029,IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=3, IdSocio=1017,IdSocio=1029,IdGrupo=3' ,1  -- SOCIO Y  GRUPO

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 ' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 ' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 ' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=4 ' ,1

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdFlujo=10' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 , IdFlujo=10' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdFlujo=10' ,1

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 , IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdGrupo=3' ,1


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdFlujo=10, IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 , IdFlujo=10, IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdFlujo=10, IdGrupo=3' ,1


EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdGrupo=3,IdSocio=1046' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 , IdGrupo=3,IdSocio=1046' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdGrupo=3,IdSocio=1046' ,1

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdGrupo=2,IdSocio=2' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=2 , IdGrupo=2,IdSocio=2' ,1

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdGrupo=2' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdSocio=2' ,1
EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=3 , IdGrupo=2,IdSocio=2' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=1 ' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=2 ' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=3 ' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=4 ' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=1 , IdFlujo=10, IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=2 , IdFlujo=10, IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=3 , IdFlujo=10, IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=4 , IdFlujo=10, IdGrupo=3' ,1

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=1, IdGrupo=3' ,1  --  GRUPO
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=2, IdGrupo=3' ,1  --  GRUPO
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=3, IdGrupo=3' ,1  --  GRUPO
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro 'LINEAIV','vista=4, IdGrupo=3' ,1  --  GRUPO

EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=1 , IdGrupo=3,IdSocio=1046' ,1 --  GRUPO y socio
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=2 , IdGrupo=3,IdSocio=1046' ,1 --  GRUPO y socio
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=3 , IdGrupo=3,IdSocio=1046' ,1 --  GRUPO y socio
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','vista=4 , IdGrupo=3,IdSocio=1046' ,1 --  GRUPO y socio



EXEC VerEstadisticasFlujoPorVista  'LINEAIV','' ,1
EXEC VerEstadisticasFlujoPorVistaDetallePorFiltro  'LINEAIV','' ,1

EXEC VerEstadisticasFlujoPorVista  'LINEAIV','vista=1 , IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVariable  'LINEAIV',' IdGrupo=3' ,1
EXEC VerEstadisticasFlujoPorVariable  'LINEAIV',' IdGrupo=3,IdSocio=1046' ,1



SELECT  Valor FROM dbo.ObtenerListaPorNombreValorEspecial (', IdTarea=13,IdGrupo=2,IdGrupo=3','=',',')  WHERE Variable='IdGrupo'
