

DROP TABLE [dbo].[ComisionServicio]
GO
CREATE TABLE [dbo].[ComisionServicio](
	[idComision] [int] IDENTITY(1,1) NOT NULL,
	[idFlujoTrabajo] [int] NULL,
	[idInstancia] [int]  NOT NULL,
	[idTarea] [int] NULL,
	[idActividad] [int] NULL,
	[idEstatus] [int] NULL,
	tipo [nvarchar](30) NULL,
	[idSocio] [int] NULL,
	[idSocioSuperior] [int] NULL,

	claveNivelRed [nvarchar](max) NULL,
	nivelRed [nvarchar](max) NULL,
	orden [int] NULL,
	[PorcComisionSocio] [decimal](16, 2) NULL,
	[ComisionSocio] [decimal](16, 2) NULL,
    comisionSocioRed [decimal](16, 2) NULL,
	[fechaCalculo] [smalldatetime] NULL,
	[fechaActivacion] [smalldatetime] NULL,
	[fechaPago] [smalldatetime] NULL,
	[IdEstatusPago] [smallint] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_ComisionServicio] PRIMARY KEY CLUSTERED 
(
	[idComision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO