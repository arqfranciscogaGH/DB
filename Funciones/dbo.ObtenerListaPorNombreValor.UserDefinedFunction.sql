
/****** Object:  UserDefinedFunction [dbo].[ObtenerListaPorNombreValor]    Script Date: 18/02/2022 11:36:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[ObtenerListaPorNombreValor] ( @lista VARCHAR(MAX))
RETURNS
@returnList TABLE (nombre [nvarchar] (max) , valor [nvarchar] (max)  )
AS
BEGIN
	 DECLARE @separadorLista as CHAR(1)=',',
			 @separadorVariable as CHAR(1)=':',
			 @elemento NVARCHAR(max),
			 @name NVARCHAR(max),
			 @valor NVARCHAR(max),
			 @pos INT,
			 @pos2 INT
	 --- WHILE CHARINDEX(@separadorLista, @lista) > 0
	 WHILE LEN(@lista) > 0
	 BEGIN
		  SET @pos  = CHARINDEX(@separadorLista, @lista)  
		  IF @pos>0
		  BEGIN
			  SET @elemento = rtrim(ltrim(SUBSTRING(@lista, 1, @pos-1)))
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
			  SET @lista = SUBSTRING(@lista, @pos+1, LEN(@lista)-@pos)
		   END
		   ELSE
		   BEGIN
		      SET @elemento = @lista
			  SET @lista = ''
			  SET @pos2  = CHARINDEX(@separadorVariable, @elemento)  
			  IF @pos2>0
			  BEGIN
				  SET @name = rtrim(ltrim(SUBSTRING(@elemento, 1, @pos2-1)))
				  SET @valor = rtrim(ltrim(SUBSTRING(@elemento,  @pos2+1,len(@elemento))))
				  INSERT INTO @returnList 
				  SELECT @name,@valor
			  END
		   END 
	 END
	 RETURN
 --SELECT * FROM dbo.ObtenerLista ('A,B',',')
--SELECT * FROM dbo.ObtenerListaPorNombreValor('ID:A,NOMBRE:B')
--SELECT * FROM dbo.ObtenerListaPorNombreValorEspecial('ID:A,NOMBRE:B',':',',')
END

