USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSocios]    Script Date: 11/07/2022 10:07:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[ConsultarSocios]
    @Id int,
    @Filtro nvarchar(150) 

AS
declare @IdPerfil int=4
  IF @Filtro=''
	  SELECT  U.idUsuario ,cuenta, P.nombre,idUsuarioSuperior ,N.Id AS idNivelRed , N.clave AS claveNivelRed , N.nombre AS nivelRed ,orden,comision, u.Activo FROM CuentaUsuario  U 
	  INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	  INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	  WHERE  @IdPerfil in (select * from dbo.ObtenerLista (U.perfiles,',')  )
	  order by orden,3
  ELSE IF @Filtro='idSocio'
  	  SELECT  U.idUsuario ,cuenta, P.nombre,idUsuarioSuperior ,N.Id AS idNivelRed , N.clave AS claveNivelRed , N.nombre AS nivelRed ,orden,comision, u.Activo  FROM CuentaUsuario  U 
	  INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	  INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	  WHERE U.idUsuario=@Id AND @IdPerfil in (select * from dbo.ObtenerLista (U.perfiles,',')  )
	  order by orden,3
  ELSE IF @Filtro='idSuperior'
  	  SELECT  U.idUsuario ,cuenta, P.nombre,idUsuarioSuperior ,N.Id AS idNivelRed , N.clave AS claveNivelRed , N.nombre AS nivelRed,orden ,comision, u.Activo  FROM CuentaUsuario  U 
	  INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	  INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	  WHERE idUsuarioSuperior=@Id  AND  @IdPerfil in (select * from dbo.ObtenerLista (U.perfiles,',')  )
	  order by orden,3
  ELSE IF @Filtro='idNivelRed'
  	  SELECT  U.idUsuario ,cuenta, P.nombre,idUsuarioSuperior ,N.Id AS idNivelRed , N.clave AS claveNivelRed , N.nombre AS nivelRed ,orden,comision, u.Activo  FROM CuentaUsuario  U 
	  INNER  JOIN Persona P   ON  U.IdUsuario = P.IdUsuario
	  INNER  JOIN NivelRed N   ON  N.Id = P.IdTipoPersona
	  WHERE N.Id=@Id AND  @IdPerfil in (select * from dbo.ObtenerLista (U.perfiles,',')  )
	  order by orden,3
