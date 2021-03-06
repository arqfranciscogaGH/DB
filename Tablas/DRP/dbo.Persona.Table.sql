
/****** Object:  Index [PK_Persona]    Script Date: 01/02/2022 12:17:08 a. m. ******/
ALTER TABLE [dbo].[Persona] DROP CONSTRAINT [PK_Persona]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 01/02/2022 12:17:08 a. m. ******/
DROP TABLE [dbo].[Persona]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 01/02/2022 12:17:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPersona] [varchar](1) NULL,
	[RFC] [varchar](15) NULL,
	[FechaNacimiento] [date] NULL,
	[Curp] [varchar](19) NULL,
	[Nombre] [varchar](100) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Genero] [varchar](1) NULL,
	[Correo] [varchar](150) NULL,
	[Telefono] [varchar](50) NULL,
	[TelefonoMovil] [varchar](30) NULL,
	[Saldo] [decimal](14, 2) NULL,
	[IdSuscriptor] [int] NULL,
	[IdUsuario] [int] NOT NULL,
	[Activo] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (2, N'G', N'', NULL, N'', N'Jorge Arturo Rizo Espinosa', N'', N'', N'F', N'', N'', N'', NULL, 2, 2, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (4, N'G', N'', NULL, N'', N'Cuauhtemoc Baez Main', N'Main', N'Baez ', N'M', N'', N'', N'', NULL, 2, 4, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1006, N'B', NULL, NULL, NULL, N'Victor Chavez Ramirez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1006, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1005, N'B', NULL, NULL, NULL, N'Ismael Jaramillo Lagunas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1005, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1008, N'S', NULL, NULL, NULL, N'Ingrid Rodriguez Arcipreste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1008, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1007, N'S', NULL, NULL, NULL, N'Elias Rafael Reyes Valdes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1007, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1009, N'B', NULL, NULL, NULL, N'Leon Sergio Martin Barri Gonzalez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1009, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1010, N'B', N'', NULL, N'', N'Claudia Patricia Rios Piña', N'', N'', N'F', N'', N'', N'', NULL, 2, 1010, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1011, N'B', NULL, NULL, NULL, N'Daniel Novoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1011, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1012, N'B', NULL, NULL, NULL, N'Guadalupe Márquez Beltran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1012, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1015, N'G', NULL, NULL, NULL, N'Ricardo Esteban Velasco España', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1015, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1016, N'G', NULL, NULL, NULL, N'Marco Antonio Robles Aroche', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1016, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1017, N'G', NULL, NULL, NULL, N'Ignacio Martinez Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1017, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1018, N'G', NULL, NULL, NULL, N'Francisco Garcia Almaraz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1018, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1019, N'B', NULL, NULL, NULL, N'Andres Arturo Romero Arenas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1019, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1020, N'B', NULL, NULL, NULL, N'Alfonso Cuauhtemoc Hernandez Sandoval', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1020, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1021, N'B', NULL, NULL, NULL, N'Jose de Jesus Lopez Moran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1021, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1022, N'B', NULL, NULL, NULL, N'Angeles Jimenez Tenorio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1022, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1023, N'B', NULL, NULL, NULL, N'Isrrael Valverde Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1023, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1024, N'B', NULL, NULL, NULL, N'Veronica Ramirez Cruz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1024, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1025, N'B', NULL, NULL, NULL, N'Xavier Garcia Trejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1025, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1026, N'B', NULL, NULL, NULL, N'Olivia Cazares Leyva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1026, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1027, N'G', NULL, NULL, NULL, N'Noel Maldonado Ortiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1027, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1035, N'B', NULL, NULL, NULL, N'Desiree Yolotzin Hernandez Gomez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1035, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1036, N'B', NULL, NULL, NULL, N'Christopher Donovan Hernandez Gomez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1036, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1037, N'B', NULL, NULL, NULL, N'Hugo Edmundo Sevilla Aldana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1037, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1038, N'B', NULL, NULL, NULL, N'Miguel Angel Aparicio Jasso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1038, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1039, N'B', NULL, NULL, NULL, N'Imelda Yolanda Carrillo Estrada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1039, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1040, N'B', NULL, NULL, NULL, N'Maria Isabel Rodriguez Sanchez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1040, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1028, N'G', NULL, NULL, NULL, N'Rodrigo Montes de Oca Soto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1028, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1029, N'G', NULL, NULL, NULL, N'Diana Paola Gonzalez Lozada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1029, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1030, N'G', NULL, NULL, NULL, N'Daniel Padilla Gomez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1030, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1031, N'G', NULL, NULL, NULL, N'Jose Aurelio Gonzalez Mondragon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1031, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1041, N'S', N'', NULL, N'', N'Enrique Aaron Trujillo', N'', N'', N'F', N'', N'', N'', NULL, 2, 0, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1042, N'S', NULL, NULL, NULL, N'Valeria Luna Juarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1042, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1044, N'B', NULL, NULL, NULL, N'Pablo Jesus Sanchez de la Cruz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1044, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1045, N'B', NULL, NULL, NULL, N'Alan Aldahir Maldonado Lopez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1045, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1046, N'S', NULL, NULL, NULL, N'Juan Francisco Cisneros Flores', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1046, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1047, N'B', NULL, NULL, NULL, N'Sara Lopez Alfaro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1047, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1032, N'S', NULL, NULL, NULL, N'Maria de Loreto Velazquez Cornejo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1032, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1043, N'B', NULL, NULL, NULL, N'Isaac Vazquez Diaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1043, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1033, N'B', NULL, NULL, NULL, N'Jose Manuel Rosaliano Mendez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1033, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1034, N'B', NULL, NULL, NULL, N'Lorena Cureño', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1034, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1014, N'G', NULL, NULL, NULL, N'Alejandra Ivonne Arzate Gonzalez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1014, 1)
INSERT [dbo].[Persona] ([IdPersona], [IdTipoPersona], [RFC], [FechaNacimiento], [Curp], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Genero], [Correo], [Telefono], [TelefonoMovil], [Saldo], [IdSuscriptor], [IdUsuario], [Activo]) VALUES (1013, N'B', NULL, NULL, NULL, N'Martha Leticia Cordova Barrera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1013, 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF
/****** Object:  Index [PK_Persona]    Script Date: 01/02/2022 12:17:08 a. m. ******/
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [PK_Persona] PRIMARY KEY NONCLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
