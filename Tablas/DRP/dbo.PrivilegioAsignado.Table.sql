USE [DB_A72B95_drp]
GO
/****** Object:  Table [dbo].[PrivilegioAsignado]    Script Date: 18/05/2022 08:50:03 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrivilegioAsignado]') AND type in (N'U'))
DROP TABLE [dbo].[PrivilegioAsignado]
GO
/****** Object:  Table [dbo].[PrivilegioAsignado]    Script Date: 18/05/2022 08:50:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegioAsignado](
	[IdPrivilegiAsignado] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](50) NULL,
	[TipoElemento] [varchar](20) NULL,
	[IdElemento] [int] NOT NULL,
	[IdSuscriptor] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_PrivilegiAsignado] PRIMARY KEY CLUSTERED 
(
	[IdPrivilegiAsignado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PrivilegioAsignado] ON 

INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (1, N'6156', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (2, N'6157', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (3, N'6158', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (4, N'6159', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (5, N'6160', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (6, N'6161', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (7, N'6162', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (8, N'6163', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (9, N'6164', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (10, N'6165', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (11, N'6166', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (12, N'6167', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (13, N'6168', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (14, N'6169', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (15, N'6170', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (16, N'6171', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (17, N'6172', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (18, N'6173', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (19, N'6174', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (20, N'6175', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (21, N'6176', N'P', 4, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (22, N'6177', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (27, N'7', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (28, N'56', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (29, N'8', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (30, N'2104', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (31, N'6', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (32, N'27', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (33, N'52', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (34, N'53', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (35, N'55', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (36, N'51', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (37, N'2220', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (38, N'3107', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (39, N'3108', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (40, N'3110', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (41, N'50', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (42, N'80', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (43, N'3113', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (44, N'1095', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (45, N'2096', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (46, N'2098', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (47, N'6118', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (53, N'2105', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (54, N'', N'U', 1043, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (55, N'6178', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (56, N'6179', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (57, N'6180', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (58, N'6181', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (59, N'6182', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (60, N'6183', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (61, N'6184', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (62, N'6185', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (63, N'6186', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (64, N'6187', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (65, N'6188', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (66, N'6189', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (67, N'6190', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (68, N'6191', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (69, N'6192', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (70, N'6193', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (71, N'6194', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (72, N'6195', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (73, N'8156', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (74, N'8157', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (75, N'8158', N'P', 1, 1, 1)
INSERT [dbo].[PrivilegioAsignado] ([IdPrivilegiAsignado], [Clave], [TipoElemento], [IdElemento], [IdSuscriptor], [Activo]) VALUES (76, N'8141', N'P', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PrivilegioAsignado] OFF
GO
