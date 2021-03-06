
/****** Object:  StoredProcedure [dbo].[ObtenerPlaneacionCaptura]    Script Date: 02/03/2022 12:15:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  procedure  [dbo].[ObtenerPlaneacionCaptura]
(
@IdAplicacion int,
@IdSuscriptor  int,
@IdUsuario  nvarchar(250) ,
@IdPerfil  nvarchar(250) ,
@IdArea nvarchar(250) ,
@IdPuesto nvarchar(250) ,
@IdGrupos nvarchar(250) ,
@IdClasificacionCaptura  nvarchar(250) ,
@IdOtro nvarchar(250) 
)
as
--select ac.*, 
select distinct pla.IdPlaneacionCaptura, pla.Descripcion, pla.TipoCaptura, pla.TipoEvento, pla.Activo
from PlaneacionCaptura pla with (nolock)  
left  outer  join  DefinicionCaptura dc  with (nolock)  on    dc.IdPlaneacionCaptura=pla.IdPlaneacionCaptura 
left  outer  join  AccesoCaptura  ac on   ac.IdDefinicionCaptura=dc.IdDefinicionCaptura  
where pla.IdAplicacion=@IdAplicacion
and  pla.IdSuscriptor=@IdSuscriptor
and pla.Activo=1
and dc.Activo=1
and (
( ac.Tipo='IdGrupo'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdGrupos ,',') l ) )
or ( ac.Tipo='IdUsuario'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdUsuario ,',') l ) )
or ( ac.Tipo='IdArea'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdArea ,',') l ) )
or ( ac.Tipo='IdPerfil'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdPerfil ,',') l ) )
or ( ac.Tipo='IdPuesto'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdPuesto ,',') l ) )
or ( ac.Tipo='IdClasificacionCaptura'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdClasificacionCaptura ,',') l ) )
or ( ac.Tipo='IdOtro'  and  ac.Acceso in ( select  l.elemento from  ObtenerLista(@IdOtro ,',') l ) )
or dc.Publico=1 
)