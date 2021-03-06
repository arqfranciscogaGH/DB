
/****** Object:  UserDefinedFunction [dbo].[ObtenerFlujoTrabajo]    Script Date: 04/02/2022 02:19:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION [dbo].[ObtenerFlujoTrabajo] 
GO
CREATE FUNCTION [dbo].[ObtenerFlujoTrabajo] (@Clave nvarchar(100),@NumeroVersion int )  
RETURNS int  
WITH EXECUTE AS CALLER  
AS  
BEGIN  
    DECLARE @IdFlujoTrabajo int;  
	IF @NumeroVersion=0
		SELECT  @IdFlujoTrabajo=ISNULL(MAX(IdFlujoTrabajo),0)  FROM   FlujoTrabajo with (NOLOCK) WHERE  Clave=@Clave AND Activo=1
	ELSE
		SELECT  @IdFlujoTrabajo=ISNULL(MAX(IdFlujoTrabajo),0)  FROM   FlujoTrabajo with (NOLOCK) WHERE  Clave=@Clave AND NumeroVersion=@NumeroVersion AND Activo=1

    RETURN(@IdFlujoTrabajo);  
END

GO
