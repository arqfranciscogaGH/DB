USE [DB_A72B95_drp]
GO
/****** Object:  StoredProcedure [dbo].[VerTramite]    Script Date: 01/04/2022 01:53:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[VerTramite]
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
	IF ( @IdGrupo='' AND @IdSocio='' )
	BEGIN
	    IF @Clave='' OR @Clave =NULL
			SELECT F.clave,I.idInstancia,I.idTarea, A.idActividad ,A.clave as claveActividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.idSocio 
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )			
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor
			ORDER BY 1		
	    IF @Clave<>'' 
		BEGIN
		    DECLARE @IdFlujoTrabajo INT=0, @NumeroVersion INT=0
	        SELECT  @IdFlujoTrabajo=dbo.ObtenerFlujoTrabajo(@Clave,@NumeroVersion)  
			SELECT F.clave,I.idInstancia,I.idTarea, A.idActividad ,A.clave as claveActividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
			FROM  FlujoTrabajo F WITH (NOLOCK) 
			INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
			INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
			INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
			LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
			LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.IdCliente
			LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=I.idSocio 
			LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )					
			LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor
			WHERE  F.IdFlujoTrabajo=@IdFlujoTrabajo 
			ORDER BY 1		
		END
	END
	ELSE
		BEGIN
			IF @IdSocio>0
				SELECT F.clave,I.idInstancia,I.idTarea, A.idActividad ,A.clave as claveActividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
				FROM FlujoTrabajo F WITH (NOLOCK) 
				INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
				INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
				INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
				LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
				LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
				LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio 
				LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )		
				LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.idSuscriptor
				WHERE  C.idSocio=@IdSocio
				ORDER BY 1
			ELSE  IF @IdGrupo>0
				SELECT F.clave,I.idInstancia,I.idTarea, A.idActividad ,A.clave as claveActividad,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
				FROM FlujoTrabajo F WITH (NOLOCK) 
				INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
				INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
				INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
				LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
				LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
				LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio 
				LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo  IN (SELECT TOP  1 * from dbo.ObtenerLista (U.grupos,',')  ORDER BY  1 )		
				LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=I.IdSuscriptor
				WHERE G.IdGrupo =@IdGrupo
				ORDER BY 1
		END
