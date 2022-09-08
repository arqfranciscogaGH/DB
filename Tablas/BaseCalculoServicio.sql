USE [DB_A72B95_drp]
GO

/****** Object:  Table [dbo].[Comision]    Script Date: 03/05/2022 12:52:23 a. m. ******/
SET ANSI_NULLS ON
GO


DROP TABLE [dbo].[BaseCalculoServicio]
GO
CREATE TABLE [dbo].[BaseCalculoServicio](
	[IdBase] [int] IDENTITY(1,1) NOT NULL,
	[IdFlujoTrabajo] [int] NULL,
	[IdInstancia] [int]  NOT NULL,
	[IdTarea] [int] NULL,
	[IdActividad] [int] NULL,
	[IdEstatus] [int] NULL,


	[IdCliente] [int] NULL,
	[IdSocio] [int] NULL,
	[IdSuscriptor] [int] NULL,


	[ImporteOperacion] [decimal](16, 2) NULL,
	[ImporteGastos] [decimal](16, 2) NULL,
	[ImporteDisponible] [decimal](16, 2) NULL,

	porcComisionServicio [decimal](16, 2) NULL,
	comisionServicio [decimal](16, 2) NULL,


	[Anticipo] [decimal](16, 2) NULL,
	[Finiquito] [decimal](16, 2) NULL,

	--[Importe] [decimal](16, 2) NULL,
	--[Importe2] [decimal](16, 2) NULL,
	--[Importe3] [decimal](16, 2) NULL,
	--[Importe4] [decimal](16, 2) NULL,
	--[Importe5] [decimal](16, 2) NULL,
	--[Numero] [int] NULL,
	--[Numero2] [int] NULL,
	--[Numero3] [int] NULL,
	--[Numero4] [int] NULL,
	--[Numero5] [int] NULL,
	[Dato] [nvarchar](max) NULL,
	[Dato2] [nvarchar](max) NULL,
	[Dato3] [nvarchar](max) NULL,
	[Dato4] [nvarchar](max) NULL,
	[Dato5] [nvarchar](max) NULL,

	[FechaCalculo] [smalldatetime] NULL,

	[IdEstatusPago] [smallint] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_BaseCalculoServicio] PRIMARY KEY CLUSTERED 
(
	[IdBase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


