
/****** Object:  StoredProcedure [dbo].[ObtenerControles]    Script Date: 31/01/2022 12:30:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP procedure  [dbo].[ObtenerControles]
GO
CREATE  procedure  [dbo].[ObtenerControles]
(
--@IdPlaneacionCaptura int,
--@IdAplicacion int ,
--@Id varchar (150),

@IdContenedor int =0,
@IdIdiona int 
)
as
--IF @IdContenedor=0
--	select cc.IdContenedor, cc.Id as Contenedor, pc.IdPropiedadControl,  pc.id as IdControl, tc.Nombre  as TipoControl, tc.Prefijo  as Prefijo, 
--	CASE   WHEN  pci.Titulo IS  NULL THEN pc.Titulo  ELSE pci.Titulo END as Titulo,pc.Valor,  pc.Alto, pc.Ancho ,pc.Superior, pc.Izquierda ,tc.CssClass,tv.ExpresionValidacion ,pci.MensajeAyuda ,tv.MensajeValidacion, pc.Visible, pc.Habilitado,pc.Argumentos

--	from PlaneacionCaptura pla with (nolock)  
--	left  outer  join  DefinicionCaptura dc  with (nolock)  on    dc.IdPlaneacionCaptura=pla.IdPlaneacionCaptura 
--	left  outer  join  AccesoCaptura  ac with (nolock) on   ac.IdDefinicionCaptura=dc.IdDefinicionCaptura  
--	inner join  ContenedorControl cc with (nolock)   on  dc.IdContenedor=cc.IdContenedor   
--	inner  join  PropiedadControl  pc  with (nolock) on   cc.IdContenedor=pc.IdContenedor  
--	inner  join  TipoControl  tc  with (nolock) on   tc.IdTipoControl=pc.IdTipoControl  
--	inner  join  TipoValidacion  tv  with (nolock) on   tv.IdTipoValidacion=pc.IdTipoValidacion  
--	left  outer join  PropiedadControlIdioma  pci  with (nolock) on   pc.IdPropiedadControl=pci.IdPropiedadControl  and  pci.IdIdioma=@IdIdiona

--	where pla.IdPlaneacionCaptura=@IdPlaneacionCaptura
--	and pla.IdAplicacion=@IdAplicacion
--	and cc.Id=@Id 

--	and pc.Activo=1
--	order by  cc.IdContenedor, pc.Orden

--ELSE

	select cc.IdContenedor, cc.Id as Contenedor, pc.IdPropiedadControl,  pc.id as IdControl, tc.Nombre  as TipoControl, tc.Prefijo  as Prefijo, 
	CASE   WHEN  pci.Titulo IS  NULL THEN pc.Titulo  ELSE pci.Titulo END as Titulo,pc.Valor,  pc.Alto, pc.Ancho ,pc.Superior, pc.Izquierda ,tc.CssClass,tv.ExpresionValidacion ,pci.MensajeAyuda ,tv.MensajeValidacion, pc.Visible, pc.Habilitado,pc.Argumentos,pc.MarcaAgua

	from   ContenedorControl cc with (nolock)    
	inner  join  PropiedadControl  pc  with (nolock) on   cc.IdContenedor=pc.IdContenedor  
	inner  join  TipoControl  tc  with (nolock) on   tc.IdTipoControl=pc.IdTipoControl  
	inner  join  TipoValidacion  tv  with (nolock) on   tv.IdTipoValidacion=pc.IdTipoValidacion  
	left  outer join  PropiedadControlIdioma  pci  with (nolock) on   pc.IdPropiedadControl=pci.IdPropiedadControl  and  pci.IdIdioma=@IdIdiona
	where cc.IdContenedor=@IdContenedor
	and pc.Activo=1
	order by  cc.IdContenedor, pc.Orden
