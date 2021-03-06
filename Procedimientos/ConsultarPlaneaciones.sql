
/****** Object:  StoredProcedure [dbo].[ConsultarPlaneaciones]    Script Date: 02/03/2022 12:31:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  procedure  [dbo].[ConsultarPlaneaciones]
(

---declare 
@TipoCaptura  nvarchar(3) ,
@IdAplicacion int,
@IdSuscriptor int,
@publico int,
@IdUsuario  nvarchar(250) ,
@IdPerfil  nvarchar(250) ,
@IdGrupos nvarchar(250) ,
@IdPuesto nvarchar(250) ,
@IdArea nvarchar(250) ,
@IdEstausCaptura smallint
)
AS
DECLARE  @Anio nvarchar(4) ,
         @Semesstre  nvarchar(1) ,
		 @Trimesstre nvarchar(1) ,
		 @Mes nvarchar(2) ,
		 @Semana  nvarchar(4) ,
		 @Dia nvarchar(1) 
--- Parametrsos
SET @IdAplicacion=5049
SET @IdSuscriptor=1
SET @publico=0
SET @IdUsuario='1'
SET @IdPerfil='1'
SET @IdGrupos='1'
SET @IdEstausCaptura=0

 SET @Anio =DATEPART (YYYY,GETDATE() )
 
 SET @Trimesstre =DATEPART (QQ,GETDATE() )
 SET @Mes =DATEPART (MM,GETDATE() )
 SET @Semana  =DATEPART (WW,GETDATE() )
 SET @Dia =DATEPART (DW,GETDATE() )
 IF ( @Mes >0 AND @Mes <=6)
	SET @Semesstre  =1
ELSE
	SET @Semesstre  =2

---	SELECT @Anio,@Trimesstre, @Mes,@Semana,@Dia


SELECT  DISTINCT p.IdPlaneacionCaptura, P.Descripcion, c.IdCaptura,
CASE WHEN c.IdEstausCaptura IS NULL THEN 'Planeado'
     WHEN c.IdEstausCaptura =0 THEN 'Planeado'
     WHEN c.IdEstausCaptura =1 THEN 'Pendiente'
     WHEN c.IdEstausCaptura =2 THEN 'Terminado'
END as  Estatus
 FROM PlaneacionCaptura p
inner  join DefinicionCaptura dc on p.IdPlaneacionCaptura=dc.IdPlaneacionCaptura
left  outer  join  AccesoCaptura  ac on   ac.IdDefinicionCaptura=dc.IdDefinicionCaptura  
left  outer  join  Captura  c on   c.IdPlaneacionCaptura=p.IdPlaneacionCaptura  
WHERE  ( p.IdAplicacion=@IdAplicacion )
AND ( p.IdSuscriptor=@IdSuscriptor OR dc.Publico=@publico )
AND p.Activo=1
AND dc.Activo=1
--- filtro TipoCaptura  ENC, EVA, CAP
AND p.TipoCaptura=@TipoCaptura
---  filtros  por seguridad , puestos y areas
AND (
	( ac.Tipo='IdUsuario'  AND  ac.Acceso IN ( select  l.elemento from  ObtenerLista(@IdUsuario ,',') l ) )
	OR ( ac.Tipo='IdPerfil'  AND  ac.Acceso IN ( select  l.elemento from  ObtenerLista(@IdPerfil ,',') l ) )
	OR ( ac.Tipo='IdGrupo'  AND  ac.Acceso IN ( select  l.elemento from  ObtenerLista(@IdGrupos ,',') l ) )
	OR ( ac.Tipo='IdPuesto'  AND  ac.Acceso IN ( select  l.elemento from  ObtenerLista(@IdPuesto ,',') l ) )
	OR ( ac.Tipo='IdArea'  AND  ac.Acceso IN ( select  l.elemento from  ObtenerLista(@IdArea ,',') l ) )
	OR dc.Publico=@publico 
)
---  filtros  por planeación
AND
(
	   (  
	       ( p.TipoEvento='DEM' OR  p.TipoEvento='UNA' OR  p.TipoEvento='SIE'  ) AND  c.IdEstausCaptura IS NULL
	   ) 
	   OR 
	   (  
			(
				  p.TipoEvento='PER'  AND  c.IdEstausCaptura IS NULL 
			)
			AND
			(
				  P.TipoPeriodo='Anual' and  P.Periodicidad=@Anio 
				  OR  P.TipoPeriodo='Semestral' and  P.Periodicidad=@Semesstre  
				  OR  P.TipoPeriodo='Semestral' and  P.Periodicidad=@Trimesstre 
				  OR  P.TipoPeriodo='Mensual' and  P.Periodicidad=@Mes  
				  OR  P.TipoPeriodo='Semanal' and  P.Periodicidad=@Semana 
				  OR  P.TipoPeriodo='Diario' and  P.Periodicidad=@Dia 
			 )
		)

		---  filtros  por estatus de  captura
		OR ( 
			 c.IdEstausCaptura=1 OR c.IdEstausCaptura=@IdEstausCaptura  
		 )
)
