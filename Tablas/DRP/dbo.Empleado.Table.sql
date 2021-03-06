
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Clave] [varchar](10) NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[FechaTerminacion] [smalldatetime] NULL,
	[IdEmpresa] [int] NULL,
	[IdArea] [int] NULL,
	[IdPuesto] [int] NULL,
	[CostoHora] [decimal](12, 2) NULL,
	[Sueldo] [decimal](12, 2) NULL,
	[NumeroSeguro] [varchar](20) NULL,
	[IdSuscriptor] [int] NULL,
	[IdEstatus] [varchar](1) NULL,
	[Activo] [bit] NULL,
	[IdEmpledoSuperior] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (2, 6, N'', NULL, NULL, 1, NULL, 5, NULL, NULL, N'', NULL, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (4, 2, N'00q', NULL, CAST(0xA9C80000 AS SmallDateTime), 1, 4, 5, CAST(100.00 AS Decimal(12, 2)), CAST(20000.00 AS Decimal(12, 2)), N'1234567890', 2, N'A', 1, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (5, 3, N'00q', NULL, NULL, 1, 5, 5, CAST(100.00 AS Decimal(12, 2)), CAST(20000.00 AS Decimal(12, 2)), N'1234567890', 3, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (8, 2010, N'ffga444', NULL, NULL, 1, 5, 5, CAST(100.00 AS Decimal(12, 2)), CAST(10000.00 AS Decimal(12, 2)), N'1234567890', 1, N'A', 1, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (1002, 3007, N'ffga444', NULL, NULL, 1, 5, 5, CAST(100.00 AS Decimal(12, 2)), CAST(10000.00 AS Decimal(12, 2)), N'1234567890', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (2004, 1, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3004, 4009, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3005, 4010, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3006, 4011, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3007, 4014, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3008, 4015, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3009, 4016, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (3010, 4017, N'', NULL, NULL, 1, 5, 5, NULL, NULL, N'', 1, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (4004, 1041, N'', NULL, NULL, 1, 4, 1, NULL, NULL, N'', 2, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (4005, 1010, N'', NULL, NULL, 1, 4, 1, NULL, NULL, N'', 2, N'A', 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdUsuario], [Clave], [FechaIngreso], [FechaTerminacion], [IdEmpresa], [IdArea], [IdPuesto], [CostoHora], [Sueldo], [NumeroSeguro], [IdSuscriptor], [IdEstatus], [Activo], [IdEmpledoSuperior]) VALUES (4006, 4, N'', NULL, NULL, 1, 4, 1, NULL, NULL, N'', 2, N'A', 1, NULL)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
