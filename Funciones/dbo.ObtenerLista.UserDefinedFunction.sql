

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[ObtenerLista] ( @lista VARCHAR(MAX), @separador as CHAR(1))
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
 --SELECT * FROM dbo.ObtenerLista ('A,B',',')
--SELECT * FROM dbo.ObtenerListaPorNombreValor('ID:A,NOMBRE:B')
--SELECT * FROM dbo.ObtenerListaPorNombreValorEspecial('ID:A,NOMBRE:B',':',',')

 RETURN
END


