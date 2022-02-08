
/****** Object:  UserDefinedFunction [dbo].[ObtenerListaPorNobreValor]    Script Date: 04/02/2022 02:19:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP FUNCTION [dbo].[ObtenerListaPorNobreValor] 
GO

CREATE FUNCTION [dbo].[ObtenerListaPorNobreValor] ( @lista VARCHAR(MAX), @separador as CHAR(1))
RETURNS
@returnList TABLE (elemento [nvarchar] (100))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(@separador, @lista) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(@separador, @lista)  
  SELECT @name = rtrim(ltrim(SUBSTRING(@lista, 1, @pos-1)))
  
  INSERT INTO @returnList 
  SELECT @name

  SELECT @lista = SUBSTRING(@lista, @pos+1, LEN(@lista)-@pos)
 END

 INSERT INTO @returnList
 SELECT @lista

 RETURN
END

GO
