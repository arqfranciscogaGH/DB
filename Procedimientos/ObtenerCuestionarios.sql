
/****** Object:  StoredProcedure [dbo].[ObtenerCuestionarios]    Script Date: 31/01/2022 12:20:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP  procedure  [dbo].[ObtenerCuestionarios]
go
CREATE  procedure  [dbo].[ObtenerCuestionarios]
(
@IdPlaneacionCaptura int,
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
select distinct dc.Orden, cc.*
from PlaneacionCaptura pla with (nolock)  
left  outer  join  DefinicionCaptura dc  with (nolock)  on    dc.IdPlaneacionCaptura=pla.IdPlaneacionCaptura 
left  outer  join  AccesoCaptura  ac on   ac.IdDefinicionCaptura=dc.IdDefinicionCaptura  
inner join  ContenedorControl cc with (nolock)   on  dc.IdContenedor=cc.IdContenedor   
--inner  join  ObtenerLista(@IdGrupos ,',') l  on l.elemento=ac.Acceso  and ac.Tipo='IdGrupo'
where pla.IdPlaneacionCaptura=@IdPlaneacionCaptura
and   pla.IdAplicacion=@IdAplicacion 
and  ( pla.IdSuscriptor=@IdSuscriptor or  pla.IdSuscriptor=1 )
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
order by  dc.Orden

