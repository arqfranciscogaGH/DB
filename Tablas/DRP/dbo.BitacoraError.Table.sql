
ALTER TABLE [dbo].[BitacoraError] DROP CONSTRAINT [FK_BitacoraError_IdError]
GO
ALTER TABLE [dbo].[BitacoraError] DROP CONSTRAINT [FK_BitacoraError_Aplicacion]
GO
/****** Object:  Table [dbo].[BitacoraError]    Script Date: 27/01/2022 01:40:26 a. m. ******/
DROP TABLE [dbo].[BitacoraError]
GO
/****** Object:  Table [dbo].[BitacoraError]    Script Date: 27/01/2022 01:40:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraError](
	[IdErrorAplicacion] [int] IDENTITY(1,1) NOT NULL,
	[IdSistema] [int] NULL,
	[IdModulo] [int] NULL,
	[IdAplicacion] [int] NULL,
	[Severidad] [nvarchar](10) NULL,
	[Componente] [nvarchar](250) NULL,
	[Tipo] [nvarchar](20) NULL,
	[Clase] [nvarchar](50) NULL,
	[IdError] [int] NULL,
	[Mensaje] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Referencia] [nvarchar](max) NULL,
	[FechaCreacion] [datetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_ErrorAplicacion] PRIMARY KEY CLUSTERED 
(
	[IdErrorAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BitacoraError] ON 

INSERT [dbo].[BitacoraError] ([IdErrorAplicacion], [IdSistema], [IdModulo], [IdAplicacion], [Severidad], [Componente], [Tipo], [Clase], [IdError], [Mensaje], [Descripcion], [Referencia], [FechaCreacion], [Activo]) VALUES (5039, 1, 1, 1, N'Alta', N'App_Web_cq4hcbz4.dll', N'Tipo', N'ASP.administracioncontroles_evaluacion_aspx', NULL, N'The underlying provider failed on Open.', N'The underlying provider failed on Open.', N'EntityFramework:   en System.Data.Entity.Core.EntityClient.EntityConnection.Open()
   en System.Data.Entity.Core.Objects.ObjectContext.EnsureConnection(Boolean shouldMonitorTransactions)
   en System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   en System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   en System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   en System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   en System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   en System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   en System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source)
   en System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__1[TResult](IEnumerable`1 sequence)
   en System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   en System.Data.Entity.Core.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[TResult](Expression expression)
   en System.Data.Entity.Internal.Linq.DbQueryProvider.Execute[TResult](Expression expression)
   en System.Linq.Queryable.FirstOrDefault[TSource](IQueryable`1 source, Expression`1 predicate)
   en MeNet.Seguridad.Administrador.AdministradorSeguridad.ObtenerSesionUsuario() en C:\fga\Proyectos\net\MENet\Codigo\Librerias\MeNet.Seguridad.Administrador\AdministradorSeguridad.cs:línea 179
   en MeNet.Seguridad.Administrador.AdministradorSeguridad.IniciarSesionUsuario() en C:\fga\Proyectos\net\MENet\Codigo\Librerias\MeNet.Seguridad.Administrador\AdministradorSeguridad.cs:línea 333
   en Sitio.AdministracionControles.Evaluacion.IniciarControladores() en C:\fga\Proyectos\net\MENet\Codigo\Aplicaciones\Sitio\AdministracionControles\Evaluacion.aspx.cs:línea 157
   en Sitio.AdministracionControles.Evaluacion.Page_PreInit(Object sender, EventArgs e) en C:\fga\Proyectos\net\MENet\Codigo\Aplicaciones\Sitio\AdministracionControles\Evaluacion.aspx.cs:línea 93', CAST(0x0000AD9C0008496A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BitacoraError] OFF
ALTER TABLE [dbo].[BitacoraError]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraError_Aplicacion] FOREIGN KEY([IdAplicacion])
REFERENCES [dbo].[Aplicacion] ([IdAplicacion])
GO
ALTER TABLE [dbo].[BitacoraError] CHECK CONSTRAINT [FK_BitacoraError_Aplicacion]
GO
ALTER TABLE [dbo].[BitacoraError]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraError_IdError] FOREIGN KEY([IdError])
REFERENCES [dbo].[ErrorPersonalizado] ([IdError])
GO
ALTER TABLE [dbo].[BitacoraError] CHECK CONSTRAINT [FK_BitacoraError_IdError]
GO
