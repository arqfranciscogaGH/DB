
/****** Object:  StoredProcedure [dbo].[ActualizarPrivilegios]    Script Date: 03/02/2022 08:13:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP   procedure [dbo].[ActualizarPrivilegios]
GO
CREATE   procedure [dbo].[ActualizarPrivilegios]
@Accion varchar(1),
@TipoElemento varchar(10),
@IdElemento int,
@Privilegios nvarchar(max)
as
delete PrivilegioAsignado where TipoElemento=@TipoElemento and  IdElemento=@IdElemento
---SET IDENTITY_INSERT PrivilegioAsignado ON;  
IF  NOT @Accion='E'
BEGIN
	INSERT  INTO PrivilegioAsignado ( Clave, TipoElemento,  IdElemento, IdSuscriptor,  Activo  )
	SELECT elemento, @TipoElemento, @IdElemento,1,1 FROM  dbo.ObtenerLista (@Privilegios,',') 
END
