DROP FUNCTION [dbo].[StringSplit] 
GO

CREATE FUNCTION [dbo].[StringSplit] (@stringToSplit NVARCHAR(MAX), @separator as CHAR(1), @position as int)

RETURNS NVARCHAR(MAX)
AS
BEGIN
  DECLARE @value NVARCHAR(MAX), @name NVARCHAR(255), @pos INT, @index INT=0;

  IF @position=0 RETURN @stringToSplit

  WHILE CHARINDEX(@separator, @stringToSplit) > 0
        BEGIN
            SET @index = @index + 1
            SET @pos  = CHARINDEX(@separator, @stringToSplit)  
            SET @value = LEFT(@stringToSplit, @pos-1)
            SET @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
            IF @index = @position BREAK
         END
        ---IF @poradi<@position SET @value=@stringToSplit
    RETURN @value
END

GO
