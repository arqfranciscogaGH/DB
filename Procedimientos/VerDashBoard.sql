
/****** Object:  StoredProcedure [dbo].[VerDashBoard]    Script Date: 15/02/2022 10:25:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[VerDashBoard]
    @Clave nvarchar(100),
	@Variables  nvarchar(max),
	@IdIdioma INT = 1 
AS

	DECLARE  @IdGrupo VARCHAR='' 
	SELECT  @IdGrupo=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdGrupo'
	DECLARE  @IdSocio VARCHAR='' 
	SELECT  @IdSocio=Valor FROM dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  WHERE Variable='IdSocio'
	PRINT  ( @IdGrupo)
	PRINT  ( @IdSocio)
	IF @Clave =''
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,C.id  As idCliente,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.cuenta as  socio,  S.NombreCorto as  Franquicia,  G.IdGrupo AS idGrupo, G.nombre  AS  grupo 
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Cliente  C  WITH (NOLOCK) ON C.Id=I.Numero
			INNER  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio 
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		ELSE
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,C.id  As idCliente,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.cuenta as  socio,  S.NombreCorto as  Franquicia,  G.IdGrupo AS idGrupo, G.nombre  AS  grupo 
			 FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
			INNER  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio  
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos  	  	
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
		END
	ELSE
	BEGIN
		IF ( @IdGrupo='' AND @IdSocio='' )
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,C.id  As idCliente,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.cuenta as  socio,  S.NombreCorto as  Franquicia,  G.IdGrupo AS idGrupo, G.nombre  AS  grupo 
	
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
			INNER  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio  
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos  	 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  F.Clave=@Clave 
		ELSE
			SELECT DISTINCT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre,
			''  AS genero,
			CASE
				WHEN isnull(fechaNacimiento,'') <>'' THEN DATEDIFF (yy, CONVERT(DATETIME,fechaNacimiento,110) ,GETDATE())
				Else 0
			END AS edad,
			ISNULL(CONVERT(VARCHAR ,H.FechaTernimacion,103) ,'') AS fechaTramite,
			convert(int ,  I.importe / 1000 )  as importe,C.id  As idCliente,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.cuenta as  socio,  S.NombreCorto as  Franquicia,  G.IdGrupo AS idGrupo, G.nombre  AS  grupo 
				 FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			LEFT OUTER   JOIN  FlujoTrabajoHistorial H WITH (NOLOCK) ON H.IdInstancia = I.IdInstancia AND  (  H.IdActividad =13 OR  H.IdActividad IS NULL )
			INNER  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
			INNER  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio  
			INNER  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
			INNER  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos  	 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
			WHERE  F.Clave=@Clave 	  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
	END
