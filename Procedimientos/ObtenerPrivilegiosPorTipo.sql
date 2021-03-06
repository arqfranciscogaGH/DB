
/****** Object:  StoredProcedure [dbo].[ObtenerPrivilegiosPorTipo]    Script Date: 03/02/2022 11:51:31 p. m. ******/
SET ANSI_NULLS ON
GO

DROP   procedure  [dbo].[ObtenerPrivilegiosPorTipo]
GO

CREATE  procedure  [dbo].[ObtenerPrivilegiosPorTipo]
@TipoElemento varchar(50),
@IdElemento int
as
SELECT TOP 1000 
 m.IdModuloSistema as IdNodo1, m.Nombre as Nodo1, 0 as ActivoNodo1 ,
 a.IdAplicacion as IdNodo2, a.Descripcion  as Nodo2, 0 as ActivoNodo2,
 p.Clave as IdNodo3, p.Nombre+ ' , Permiso: '+ p.Permiso as Nodo3,pa.Activo as ActivoNodo3
  FROM  Aplicacion a  
  LEFT OUTER JOIN  ModuloSistema m ON  m.IdModuloSistema=a.IdModuloSistema
  LEFT OUTER JOIN  Privilegio p   ON  p.IdAplicacion=a.IdAplicacion
  LEFT OUTER JOIN PrivilegioAsignado pa ON P.Clave=PA.Clave AND ( TipoElemento=@TipoElemento  ) AND ( IdElemento=@IdElemento )
  WHERE  a.Activo=1  AND p.Activo=1 AND  (a.Tipo='PAGINA' OR a.Tipo='MENU' OR  a.Tipo='PARAMETROS'  )
  AND ( TipoElemento=@TipoElemento OR  TipoElemento=0 OR   TipoElemento IS NULL )  AND  ( IdElemento=@IdElemento OR  IdElemento=0 OR  IdElemento IS NULL  ) 
  ORDER  BY 2,5,8

  go