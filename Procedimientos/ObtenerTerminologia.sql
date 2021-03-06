
/****** Object:  StoredProcedure [dbo].[ObtenerTerminologia]    Script Date: 02/03/2022 12:17:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    procedure  [dbo].[ObtenerTerminologia]
@Clave varchar(50),
@IdIdioma INT
as

SELECT TOP 1000 TI.Titulo, TI.Texto

  FROM  Terminologia T
  INNER  JOIN  TerminologiaIdioma TI   ON  T.IdTerminologia=TI.IdTerminologia
  WHERE  T.Activo=1  AND Ti.Activo=1  AND  T.Clave=@Clave AND  IdIdioma=@IdIdioma

