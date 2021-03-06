
/****** Object:  StoredProcedure [dbo].[ObtenerTerminologias]    Script Date: 02/03/2022 12:18:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER     procedure  [dbo].[ObtenerTerminologias]
@IdAplicacion INT,
@IdIdioma INT
as

SELECT TOP 1000 T.Clave, TI.Titulo, TI.Texto
  FROM  Terminologia T
  INNER  JOIN  TerminologiaIdioma TI   ON  T.IdTerminologia=TI.IdTerminologia
  WHERE  T.Activo=1  AND Ti.Activo=1  AND  T.IdAplicacion In ( 1,@IdAplicacion) AND  IdIdioma=@IdIdioma

