


DROP TABLE Franquicia

GO

CREATE TABLE Franquicia (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[llave] [varchar](max) NULL,
	[clave] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[direccion] [varchar](max) NULL,
	[fechaEstatus] [varchar](10) NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO




SET IDENTITY_INSERT Franquicia ON 

INSERT Franquicia ([id], [llave], [clave], [nombre], [Direccion], [fechaEstatus], [estatus]) VALUES (1, N'', N'CORP', 'Corporaivo Kungio', N'Valle dorado',  '', 1)
INSERT Franquicia ([id], [llave], [clave], [nombre], [Direccion], [fechaEstatus], [estatus]) VALUES (2, N'', N'CALLCENTER_VALLEDORADO', 'Call Center Valle Dorado Kungio', N'Valle dorado', '', 1)

SET IDENTITY_INSERT Franquicia OFF

select * from Franquicia

