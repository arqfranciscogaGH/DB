
GO
DROP   procedure  [dbo].[ObtenerPrivilegios]
GO

CREATE  procedure  [dbo].[ObtenerPrivilegios]
@IdUsuario int,
@IdPerfil int,
@IdGrupo int
as

SELECT TOP 1000 a.Clave  as ClaveAplicacion,
  pa.IdPrivilegiAsignado, p.Clave, p.Permiso
  FROM  Privilegio p    
  INNER JOIN Aplicacion  a ON  p.IdAplicacion=a.IdAplicacion
  LEFT  OUTER   JOIN  PrivilegioAsignado PA  ON  P.Clave=PA.Clave
  WHERE  p.Activo=1  
    AND 
	( 
		(  TipoElemento='U' OR  TipoElemento IS NULL )  AND  ( IdElemento=@IdUsuario OR  IdElemento IS NULL  ) 
		OR ( TipoElemento='P'  OR  TipoElemento IS NULL )  AND  ( IdElemento=@IdPerfil OR  IdElemento IS NULL  ) 
		OR ( TipoElemento='G'  OR  TipoElemento IS NULL )  AND  ( IdElemento=@IdGrupo OR  IdElemento IS NULL  ) 
	)
  ORDER  BY 1
