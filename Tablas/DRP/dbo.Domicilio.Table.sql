
/****** Object:  Table [dbo].[Domicilio]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Domicilio]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domicilio](
	[IdDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdPersona] [int] NULL,
	[TipoDomicilio] [varchar](1) NULL,
	[Longitud] [float] NULL,
	[Latitud] [float] NULL,
	[IdPais] [int] NULL,
	[Pais] [varchar](50) NULL,
	[ClaveEstado] [varchar](10) NULL,
	[Estado] [varchar](50) NULL,
	[ClaveMunicipio] [varchar](10) NULL,
	[Municipio] [varchar](70) NULL,
	[ClaveLocalidad] [varchar](20) NULL,
	[Localidad] [varchar](70) NULL,
	[ClaveColonia] [varchar](20) NULL,
	[Colonia] [varchar](100) NULL,
	[CP] [varchar](10) NULL,
	[Calle] [varchar](100) NULL,
	[NumeroInterior] [varchar](30) NULL,
	[NumeroExterior] [varchar](30) NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[IdDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Domicilio] ON 

INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (1, 2010, NULL, N'C', NULL, NULL, NULL, NULL, N'15', NULL, N'15090', NULL, N'150900001', NULL, NULL, N'Ensueños', N'54740', N'olimpo  ', N'11', N'a', 1, 1)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2, 3007, NULL, N'C', NULL, NULL, NULL, NULL, N'15', NULL, N'15121', NULL, N'151210001', NULL, NULL, N'Ensueños', N'54740', N'olimpo  ', N'11', N'a', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (1002, 3, NULL, N'C', NULL, NULL, NULL, NULL, N'15', NULL, N'15090', NULL, N'150900001', NULL, NULL, N'', N'', N'', N'', N'', 3, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (1003, 2, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'1', N'', N'', N'', N'', 2, 1)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (1006, 1, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2006, 4009, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2007, 4010, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2008, 4011, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2009, 4014, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2010, 4015, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2012, 4016, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (2013, 4017, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 1, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (3006, 1041, NULL, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 2, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (3007, 1010, 1010, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 2, 0)
INSERT [dbo].[Domicilio] ([IdDomicilio], [IdUsuario], [IdPersona], [TipoDomicilio], [Longitud], [Latitud], [IdPais], [Pais], [ClaveEstado], [Estado], [ClaveMunicipio], [Municipio], [ClaveLocalidad], [Localidad], [ClaveColonia], [Colonia], [CP], [Calle], [NumeroInterior], [NumeroExterior], [IdSuscriptor], [Activo]) VALUES (3008, 4, 4, N'C', NULL, NULL, NULL, NULL, N'09', NULL, N'09009', NULL, N'090090015', NULL, NULL, N'', N'', N'', N'', N'', 2, 1)
SET IDENTITY_INSERT [dbo].[Domicilio] OFF
