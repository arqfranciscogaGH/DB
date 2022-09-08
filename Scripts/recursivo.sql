


------------------------------------------------------------------------------
--- crear red de socios 
------------------------------------------------------------------------------


DROP TABLE RedSocios
GO
CREATE TABLE RedSocios(
      idSocio int NOT NULL,
      nombreSocio [varchar](max) NULL,
	  NivelJerarquia int NOT NULL,
      idSocioSuperior int NOT NULL,
      nombreSocioSuperior [varchar](max) NULL,
	  nivelRedOrigen [varchar](max) NULL,
	  nivelRedActiva [varchar](max) NULL,

	  nivelRedVerical int NOT NULL,
	  nivelRedVericalActiva int NOT NULL,

	  socios int NOT NULL,
	  sociosActivos int NOT NULL,
)


--- cargar  red de socios 

ALTER   PROCEDURE cargarRedSocios
AS
--- CARGAR  RED DE SOCIOS

    DECLARE @NivelJerarquia INT=1
	DECLARE @NivelJerarquiaSiguiente INT=1
	DECLARE @Id INT=0
	DECLARE @Cuenta INT=1

	DELETE FROM RedSocios
	INSERT INTO RedSocios SELECT id,nombre ,1, 0,'',tipo,'',0,0,0,0  FROM Suscripcion WHERE idSuscriptor= 1
    WHILE @Cuenta>0
    BEGIN
	  ---contar  socios que  tiene socio  ---  nivel horizozontal 
	  SELECT @Cuenta=COUNT(*)  FROM Suscripcion WITH (NOLOCK)  WHERE idSuscriptor IN (  SELECT IdSocio FROM RedSocios WITH (NOLOCK)   WHERE  NivelJerarquia=@NivelJerarquia) 
	  SELECT @NivelJerarquia AS NivelJerarquia, @Cuenta as Socios 
	  IF @Cuenta>0
	  BEGIN
	  	SET @NivelJerarquiaSiguiente=@NivelJerarquiaSiguiente+1
	    INSERT INTO RedSocios SELECT s.id,s.nombre ,@NivelJerarquiaSiguiente ,ss.id,ss.nombre,s.tipo,'',0,0,0,0  FROM Suscripcion s WITH (NOLOCK) INNER JOIN Suscripcion ss WITH (NOLOCK)  ON s.idSuscriptor=ss.id WHERE s.idSuscriptor IN (  SELECT IdSocio FROM RedSocios  WHERE  NivelJerarquia=@NivelJerarquia) 
	    SET @NivelJerarquia=@NivelJerarquiaSiguiente
 	  END
    END

    DECLARE @IdSocio INT=1
	DECLARE s_cursor CURSOR FOR   
	SELECT  IdSocio from RedSocios 
	OPEN s_cursor  
  
	FETCH NEXT FROM s_cursor   
	INTO @IdSocio
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		SELECT  '----- SOCIO: ', @IdSocio
		EXEC obetenerNivelRed @IdSocio
		FETCH NEXT FROM s_cursor   
		INTO @IdSocio
	END   
	CLOSE s_cursor;  
	DEALLOCATE s_cursor;  


GO

EXEC cargarRedSocios


--- CONSULTAS
SELECT * FROM RedSocios  WHERE idSocioSuperior=4  order by  NivelJerarquia
SELECT * FROM Suscripcion WHERE id=2
SELECT * FROM Suscripcion WHERE idSuscriptor= 2
SELECT  * from RedSocios where  NivelJerarquia=2
SELECT  * from RedSocios where  idSocio=4


------------------------------------------------------------------------------
 ---- OBTENER   TRAMITES 
------------------------------------------------------------------------------
   drop table  tramitesRealizados
   select I.IdInstancia, I.Identificador,I.Numero as IdPersona,  I.nombre  as NombreCliente ,I.importe, ( I.importe * 1 )as baseCalculo,    S.id as idSocio, S.Nombre as NombreSocio, S.idSuscriptor as idSocioSuperior, S.Tipo  as  NivelRed
   into tramitesRealizados
	FROM  FlujoTrabajo F WITH (NOLOCK)
		INNER  JOIN  FlujoTrabajoHistorial  H WITH (NOLOCK) ON F.IdFlujoTrabajo=H.IdFlujoTrabajo 
		INNER  JOIN FlujoTrabajoInstancia  I WITH (NOLOCK) ON I.IdInstancia=H.IdInstancia
		LEFT  OUTER  JOIN  FlujoTrabajoActividad A  WITH  (NOLOCK) ON  A.IdActividad=H.IdActividad
		--LEFT  OUTER  JOIN  FlujoTrabajoEstatus  E WITH  (NOLOCK) ON E.IdEstatus=I.IdEstatus
		INNER  JOIN  FlujoTrabajoTarea T WITH (NOLOCK) ON T.IdTarea=H.IdTarea 

		LEFT  OUTER  JOIN  Persona  P  WITH (NOLOCK) ON P.Id=I.Numero
	    LEFT  OUTER   JOIN  Suscripcion  S  WITH (NOLOCK) ON S.id=P.idSuscriptor
		lEFT  OUTER   JOIN  Usuario  U  WITH (NOLOCK) ON U.idSuscriptor=P.idSuscriptor   
		LEFT  OUTER   JOIN  Grupo  G  WITH (NOLOCK) ON G.id=U.grupos  	
		where  H.IdEstatus=43 --- AND   I.IdInstancia = 47

	SELECT  * from tramitesRealizados where  IdSocioSuperior=2


------------------------------------------------------------------------------
---- OBTENER NIVEL DE RED
------------------------------------------------------------------------------

ALTER   PROCEDURE obetenerNivelRed
@Id INT
AS
	DECLARE @Nivel INT=1
	DECLARE @NivelSiguiente INT=1
	DECLARE @SociosActivosRed INT=1
	DECLARE @Cuenta INT=1
	DECLARE @CuentaSocios INT=0
	DECLARE @SociosActivosHorizontal INT=0
	
	DECLARE @NivelRedActiva VARCHAR(MAX)
	SELECT  DISTINCT s.idSocio ,s.nombreSocio, s.idSocioSuperior , nombreSocioSuperior, @Nivel AS  nivel INTO #NivelSocio from  RedSocios  s    inner join tramitesRealizados t   on  s.idSocio=t.idSocio  WHERE t.idSocio= @Id

    WHILE @Cuenta>0
    BEGIN
		SELECT  @Cuenta=Count(*) FROM  #NivelSocio   WHERE Nivel=@Nivel
		--- SELECT  idSocio FROM  #NivelSocio   WHERE Nivel=@Nivel
		--- SELECT @Nivel AS Nivel, @Cuenta as Socios 
		IF  @Cuenta>0
		BEGIN
			SET @NivelSiguiente=@NivelSiguiente+1
			---SELECT  DISTINCT s.idSocio , s.idSocioSuperior , @NivelSiguiente AS  Nivel from  RedSocios  s    inner join tramitesRealizados t   on  s.idSocio=t.idSocio  WHERE s.idSocioSuperior IN  ( SELECT  idSocio FROM  #NivelSocio   WHERE Nivel=@Nivel )
			INSERT  #NivelSocio 
			SELECT  DISTINCT s.idSocio ,s.nombreSocio, s.idSocioSuperior , nombreSocioSuperior , @NivelSiguiente AS  Nivel from  RedSocios  s    inner join tramitesRealizados t   on  s.idSocio=t.idSocio  WHERE s.idSocioSuperior IN  ( SELECT  idSocio FROM  #NivelSocio   WHERE Nivel=@Nivel )
			SET @Nivel=@NivelSiguiente
			---SELECT @Nivel AS Nivel, @NivelSiguiente as NivelSiguiente 
		END

    END

	SELECT @CuentaSocios=COUNT(*) from  RedSocios  s  WHERE s.IdSocioSuperior= @Id
 
    SELECT @SociosActivosHorizontal=COUNT(*) from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio  WHERE s.IdSocioSuperior= @Id
	SELECT @SociosActivosRed=MAX(nivel) FROM  #NivelSocio 

	--set @SociosActivosHorizontal=5
	--set @SociosActivosRed=6

	IF  ( @SociosActivosHorizontal=0 AND @SociosActivosRed=0 )
	  SET @NivelRedActiva='NA'
	ELSE IF  ( @SociosActivosHorizontal=1 AND @SociosActivosRed>=0 ) OR  ( @SociosActivosHorizontal>=0 AND @SociosActivosRed=1 )
	    SET @NivelRedActiva='Bronce'
	ELSE IF  ( @SociosActivosHorizontal=2 AND @SociosActivosRed>=2 ) OR  ( @SociosActivosHorizontal>=0 AND @SociosActivosRed=2 )
	    SET @NivelRedActiva='Silver'
	ELSE IF  ( @SociosActivosHorizontal=3 AND @SociosActivosRed>=3 ) OR  ( @SociosActivosHorizontal>=0 AND @SociosActivosRed=3 )
	    SET @NivelRedActiva='Gold'
	ELSE IF  ( @SociosActivosHorizontal=4 AND @SociosActivosRed>=4 ) OR  ( @SociosActivosHorizontal>=0 AND @SociosActivosRed=4 )
	    SET @NivelRedActiva='WideGold'
	ELSE IF  ( @SociosActivosHorizontal=5 AND @SociosActivosRed>=5 ) OR  ( @SociosActivosHorizontal>=0 AND @SociosActivosRed=5 )
	    SET @NivelRedActiva='PureGold'

	SELECT 'tramites red horizontal'
    SELECT * from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio  WHERE s.IdSocioSuperior= @Id
	SELECT 'tramites red vertical'
	SELECT * FROM  #NivelSocio 
	SELECT 'variables'
	SELECT @SociosActivosHorizontal  as SociosActivosHorizontal,@SociosActivosRed as SociosActivosRed, @NivelRedActiva, @CuentaSocios
	---UPDATE  RedSocios SET  NivelRedActiva=@NivelRedActiva ,nivelRedVericalActiva=@NivelRedActivos ,socios= @CuentaSocios,  sociosActivos=@SociosActivosHorizontal WHERE  idSocio=@Id

	---DROP  TABLE  #NivelSocio
GO

EXEC obetenerNivelRed 1027

SELECT  * from RedSocios where  idSocio=2
SELECT COUNT(*) from  RedSocios  s  WHERE s.IdSocioSuperior= 2
SELECT * from  RedSocios  s  WHERE s.IdSocioSuperior= 2
SELECT t.idSocio,* from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio where s.IdSocioSuperior= 2


SELECT  * from tramitesRealizados where  idSocioSuperior=4
SELECT  * from RedSocios where  idSocioSuperior=4

  ----------------
  SELECT * FROM  FlujoTrabajoInstancia





--- CALCULO DE  COMISIONES de tramite
 DROP TABLE  ComisionTramite 
 go
  CREATE TABLE  ComisionTramite (
      IdInstancia [int] NOT NULL,
	  Identificador  [varchar](max) NULL,
	  NombreCliente [varchar](max) NULL,
	  BaseCalculo Decimal( 12,2 ),
	  IdSocio [int] NOT NULL,
	  NombreSocio [varchar](max) NULL,
	  NivelRed [varchar](max) NULL ,
	  Comision Decimal( 12,2 )
)


select  * from ComisionTramite 


SELECT Identificador, NombreCliente,BaseCalculo, s.idSocio,s.NombreSocio from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio

---obenter   coisiones de todos los niveles 
delete  from ComisionTramite 

	DECLARE @idSocioSuperior INT=1
	DECLARE @CuentaSocios INT=0
	DECLARE @idInstancia INT=0 
	DECLARE @identificador  [varchar](max)=''
	DECLARE @nombreCliente [varchar](max)=''
	DECLARE @nombreSocio [varchar](max)=''
	DECLARE @NivelRedActiva [varchar](max)=''
	DECLARE @IdSocio INT=0
	DECLARE @baseCalculo INT=0
	DECLARE s_cursor CURSOR FOR   
	SELECT idInstancia,Identificador, NombreCliente, t.idSocio,t.nombreSocio, t.idSocioSuperior,baseCalculo,NivelRedActiva from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio --- WHERE  idinstancia=47
	OPEN s_cursor  
  	FETCH NEXT FROM s_cursor   
	INTO @idInstancia,@identificador,@nombreCliente,@IdSocio,@nombreSocio,@idSocioSuperior, @baseCalculo,@NivelRedActiva
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		SELECT  '-----COMISION  SOCIO: ', @idInstancia,@identificador,@nombreCliente,@IdSocio,@idSocioSuperior, @baseCalculo
		INSERT  INTO ComisionTramite SELECT  @idInstancia, @identificador,@nombreCliente,@baseCalculo ,@IdSocio,@nombreSocio,@NivelRedActiva  ,0
    	WHILE @idSocioSuperior>1
        BEGIN
		    SELECT @IdSocio=s.idSocio, @nombreSocio=nombreSocio ,@idSocioSuperior=s.idSocioSuperior, @NivelRedActiva=NivelRedActiva FROM  RedSocios  s WHERE S.idSocio= @idSocioSuperior
		    SELECT '-----COMISION  SOCIO SUPERIOR', * FROM RedSocios  s WHERE   s.idSocio=@idSocioSuperior
			---IF @NivelRedActiva<>''
			    INSERT  INTO ComisionTramite SELECT  @idInstancia, @identificador,@nombreCliente,@baseCalculo ,@IdSocio,@nombreSocio,@NivelRedActiva  ,0

			SELECT  '----- SIG SOCIO: ', @idInstancia,@identificador,@nombreCliente,@IdSocio,@nombreSocio,@idSocioSuperior, @baseCalculo
		END


		FETCH NEXT FROM s_cursor   
		INTO @idInstancia,@identificador,@nombreCliente,@IdSocio,@nombreSocio,@idSocioSuperior, @baseCalculo,@NivelRedActiva
	END   
	CLOSE s_cursor;  
	DEALLOCATE s_cursor;  

	SELECT  * from ComisionTramite



SELECT  * from RedSocios where  idSocio=2
SELECT  * from RedSocios where  idSocio=1014
SELECT  * from RedSocios where  idSocio=1028

SELECT t.idSocio,* from tramitesRealizados t  where t.idSocio=2

SELECT t.idSocio,* from tramitesRealizados t  where t.idSocio=1014

SELECT t.idSocio,* from tramitesRealizados t  where t.idSocio=1028


SELECT COUNT(*) from  RedSocios  s  WHERE s.IdSocioSuperior= 2
SELECT * from  RedSocios  s  WHERE s.IdSocioSuperior= 2
SELECT t.idSocio,* from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio where s.IdSocioSuperior= 2



	  INSERT  INTO ComisionTramite SELECT  @Id, @CuentaSocios,@contador,@NivelRed
	  ---SELECT @Id=idSuscriptor FROM Suscripcion WHERE id= @Id
	  SELECT @Id=idSocioSuperior FROM tramitesRealizados  t WHERE t.idSocio= @Id


	SELECT idInstancia,Identificador, NombreCliente, t.idSocio,t.idSocioSuperior,baseCalculo from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio 
	order by 1 
	
		select  * from ComisionTramite  WHERE  idSocio=1028
		select  * from tramitesRealizados  WHERE  idSocio=1028

		select  * from ComisionTramite  WHERE  idSocio=1014
		select  * from tramitesRealizados  WHERE  idSocio=1014

	SELECT  * from tramitesRealizados   WHERE  idinstancia=47
	SELECT  * from RedSocios where  NivelJerarquia=3

	SELECT  * from RedSocios where  idSocio=4

	SELECT  * from tramitesRealizados where  IdSocioSuperior=4
	SELECT  * from RedSocios  where  IdSocioSuperior=4

	SELECT  * from Suscripcion where   idSuscriptor=1


	update  Suscripcion
	set idSuscriptor = 2
	where  id  in (  4,1017, 1027)


	 SELECT * from tramitesRealizados t    inner join  RedSocios  s on  s.idSocio=t.idSocio  WHERE s.IdSocioSuperior= 4
	select  * from ComisionTramite 

	  
