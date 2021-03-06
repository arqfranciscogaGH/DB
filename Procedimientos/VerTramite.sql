
/****** Object:  StoredProcedure [dbo].[VerTramite]    Script Date: 15/02/2022 10:27:01 p. m. ******/
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
		SELECT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
		FROM  FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
		LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio 
		LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos			
		LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
  	 	  	
		WHERE  F.Clave=@Clave 
		ORDER BY 1		
	ELSE
		SELECT I.idInstancia,I.idTarea, A.idActividad ,A.clave,A.Nombre AS actividad, E.nombre AS estatus,I.identificador, I.nombre  ,convert(int ,  I.importe / 1000 )  as importe,C.id  ,C.fechaNacimiento, C.rfc, C.curp,C.telefonoMovil,C.correo,  C.idSocio , U.Cuenta as  socio, G.idGrupo , G.nombre  AS  grupo 
         FROM   dbo.ObtenerListaPorNombreValorEspecial (@Variables,'=',',')  VF ,FlujoTrabajo F WITH (NOLOCK) 
		INNER  JOIN  FlujoTrabajoInstancia  I  WITH (NOLOCK) ON F.IdFlujoTrabajo=I.IdFlujoTrabajo
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=I.IdTarea 
		INNER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON A.IdActividad=I.IdActividad
		LEFT  OUTER  JOIN   FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		LEFT  JOIN  Cliente  C WITH (NOLOCK) ON C.Id=I.Numero
		LEFT  JOIN  CuentaUsuario  U  WITH (NOLOCK) ON U.IdUsuario=C.idSocio 
		LEFT  JOIN  Grupo  G  WITH (NOLOCK) ON G.IdGrupo=U.grupos			
		LEFT  JOIN  Suscripcion  S  WITH (NOLOCK) ON S.IdSuscriptor=C.idSuscriptor
		LEFT  OUTER JOIN  FlujoTrabajoVariable V WITH  (NOLOCK) ON  V.IdInstancia=I.IdInstancia 
		WHERE  F.Clave=@Clave 	  AND   ( V.Variable= VF.Variable  AND V.Valor= VF.Valor )
		ORDER BY 1
