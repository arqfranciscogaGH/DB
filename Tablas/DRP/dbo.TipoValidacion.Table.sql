
/****** Object:  Table [dbo].[TipoValidacion]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[TipoValidacion]
GO
/****** Object:  Table [dbo].[TipoValidacion]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValidacion](
	[IdTipoValidacion] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](150) NULL,
	[Nombre] [nvarchar](200) NULL,
	[ExpresionValidacion] [nvarchar](250) NULL,
	[MensajeValidacion] [nvarchar](max) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoValidacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoValidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TipoValidacion] ON 

INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (1, N'Ninguno', N'Ninguno', N'', N'', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2, N'NumerosIimitado', N'Numeros  Ilimitado', N'^[0-9]{1,1000}$', N'Escriba  solo números', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (3, N'LetrasIimitado', N'Letras Ilimitado', N'^[a-zA-Z ñÑáéíóúÁÉÍÓÚ\s]{1,1000}$', N'Escriba  solo letras', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (1002, N'LetrasNumeroIlimitado', N'Letras y números Ilimitado', N'^[a-zA-Z0-9]{1,1000}$', N'Escriba letras  y números', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2002, N'LetrasNumeroEspecialesIlimitado', N'Letras,Acentos,Números, especiales Ilimitado', N'^[a-zA-Z0-9-.,*=#&_() ñÑáéíóúÁÉÍÓÚ\s]{1,1000}$', N'Escriba letras,acentos , números y caracteres especiales', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2003, N'LetrasMinusculasIimitado', N'Letras Minusculas IIimitado', N'^[a-z ñáéíóú\s]{1,1000}$', N'Escriba Letras Minusculas IIimitado', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2004, N'LetrasMayusculasIimitado', N'Letras Mayusculas IIimitado', N'^[A-Z ÁÉÍÓÚ\s]{1,1000}$', N'Esciba Letras Mayusculas IIimitado', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2005, N'Correo', N'Correo', N'@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"', N'Ecriba Correo', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2006, N'Codigo postal', N'Codigo postal', N'^[0-9]{1,6}$', N'Escriba hasta  6 digitos', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2007, N'', N'', N'', N'', 0)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2008, N'Numeros10', N'Telëfono', N'^[0-9]{1,10}$', N'Escriba hasta  10 digitos', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2009, N'Numeros20', N'Numeros 20 digitos', N'^[0-9]{1,20}$', N'Escriba hasta  20 digitos', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2010, N'Numeros50', N'Numeros 50 digitos', N'^[0-9]{1,50}$', N'Escriba hasta  50 digitos', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2011, N'Numeros100', N'Numeros 100 digitos', N'^[0-9]{1,100}$', N'Escriba hasta  100 digitos', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2012, N'LetrasNumero10', N'Letras y números hasta 10', N'^[a-zA-Z0-9]{1,10}$', N'Escriba letras  y números hasta 10', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2013, N'LetrasNumero20', N'Letras y números hasta 20', N'^[a-zA-Z0-9]{1,20}$', N'Escriba letras  y números hasta 20', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2014, N'LetrasNumero50', N'Letras y números hasta 50', N'^[a-zA-Z0-9]{1,50}$', N'Escriba letras  y números hasta 50 ', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2015, N'LetrasNumero100', N'Letras y números hasta 100', N'^[a-zA-Z0-9]{1,100}$', N'Escriba letras  y números hasta 100', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2016, N'LetrasNumeroEspeciales10', N'Letras y números, especial hasta 10', N'^[a-zA-Z0-9-.,*=#&_() ñÑáéíóúÁÉÍÓÚ\s]{1,10}$', N'Escriba letras,acentos , números y caracteres especiales hasta 10', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2017, N'LetrasNumeroEspeciales20', N'Letras y números, especial hasta 20', N'^[a-zA-Z0-9-.,*=#&_() ñÑáéíóúÁÉÍÓÚ\s]{1,20}$', N'Escriba letras,acentos , números y caracteres especiales hasta 20', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2018, N'LetrasNumeroEspeciales50', N'Letras y números, especial hasta 50', N'^[a-zA-Z0-9-.,*=#&_() ñÑáéíóúÁÉÍÓÚ\s]{1,50}$', N'Escriba letras,acentos , números y caracteres especiales hasta 50', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2019, N'LetrasNumeroEspeciales100', N'Letras y números, especial hasta 100', N'^[a-zA-Z0-9-.,*=#&_() ñÑáéíóúÁÉÍÓÚ\s]{1,100}$', N'Escriba letras,acentos , números y caracteres especiales hasta 100', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2020, N'Sitio', N'Sitio', N'http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?', N'Escriba Sitio', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2021, N'Fecha DDMMAAAA', N'Fecha DDMMAAAA', N'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$', N'Escriba fecha DDMMAAAA', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2022, N'Fecha DD/MM/AAAA', N'Fecha DD/MM/AAAA', N'(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/]\d{4}', N'Escriba fecha DD/MM/AAAA', 1)
INSERT [dbo].[TipoValidacion] ([IdTipoValidacion], [Id], [Nombre], [ExpresionValidacion], [MensajeValidacion], [Activo]) VALUES (2023, N'Fecha DD-MM-AAAA', N'Fecha DD-MM-AAAA', N'(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}', N'Escriba fecha DD-MM-AAAA', 1)
SET IDENTITY_INSERT [dbo].[TipoValidacion] OFF
