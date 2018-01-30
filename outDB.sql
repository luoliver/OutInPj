/*    ==ScriptingParameters==

    SourceServerVersion : SQL Server 2016 (13.0.1601)
    SourceDatabaseEngineEdition : Microsoft SQL Server Enterprise Edition
    SourceDatabaseEngineType : SQL Server independiente

    TargetServerVersion : SQL Server 2017
    TargetDatabaseEngineEdition : Microsoft SQL Server Standard Edition
    TargetDatabaseEngineType : SQL Server independiente
*/
USE [master]
GO
/****** Object:  Database [OutInDb]    Script Date: 30/01/2018 4:54:34 p. m. ******/
CREATE DATABASE [OutInDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OutInDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OutInDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OutInDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OutInDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OutInDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OutInDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OutInDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OutInDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OutInDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OutInDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OutInDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OutInDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OutInDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OutInDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OutInDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OutInDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OutInDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OutInDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OutInDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OutInDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OutInDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OutInDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OutInDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OutInDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OutInDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OutInDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OutInDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OutInDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OutInDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OutInDb] SET  MULTI_USER 
GO
ALTER DATABASE [OutInDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OutInDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OutInDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OutInDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OutInDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OutInDb', N'ON'
GO
ALTER DATABASE [OutInDb] SET QUERY_STORE = OFF
GO
USE [OutInDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OutInDb]
GO
/****** Object:  Table [dbo].[TbCargo]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCargo](
	[ca_Id] [int] IDENTITY(1,1) NOT NULL,
	[ca_Descripcion] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ca_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCategoria]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCategoria](
	[cat_Id] [int] IDENTITY(1,1) NOT NULL,
	[cat_Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TbCategoria] PRIMARY KEY CLUSTERED 
(
	[cat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbEmpleados]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEmpleados](
	[em_identificacion] [varchar](30) NOT NULL,
	[em_fechaNacimiento] [date] NOT NULL,
	[em_nombre] [varchar](70) NOT NULL,
	[em_contrasena] [varchar](50) NOT NULL,
	[em_tipoId] [int] NOT NULL,
	[em_direccion] [varchar](50) NOT NULL,
	[em_cargo] [int] NOT NULL,
	[em_contacto] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[em_identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProducto]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbProducto](
	[pd_IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[pd_Nombre] [varchar](50) NOT NULL,
	[pd_Cantidad] [int] NOT NULL,
	[pd_Precio] [money] NOT NULL,
	[pd_Unidades] [int] NOT NULL,
	[pd_StockMin] [int] NOT NULL,
	[pd_StockMax] [int] NOT NULL,
	[pd_CantidadXUnidad] [varchar](50) NOT NULL,
	[pd_IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_TbProducto] PRIMARY KEY CLUSTERED 
(
	[pd_IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbTipoId]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbTipoId](
	[tid_Id] [int] IDENTITY(1,1) NOT NULL,
	[tid_Nombre] [varchar](5) NOT NULL,
	[tid_Descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TbTipoId__45D5FA8707020F21] PRIMARY KEY CLUSTERED 
(
	[tid_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_TbProducto]    Script Date: 30/01/2018 4:54:35 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_TbProducto] ON [dbo].[TbProducto]
(
	[pd_IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_TbEmpleados_TbCargo] FOREIGN KEY([em_cargo])
REFERENCES [dbo].[TbCargo] ([ca_Id])
GO
ALTER TABLE [dbo].[TbEmpleados] CHECK CONSTRAINT [FK_TbEmpleados_TbCargo]
GO
ALTER TABLE [dbo].[TbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_TbEmpleados_TbTipoId] FOREIGN KEY([em_tipoId])
REFERENCES [dbo].[TbTipoId] ([tid_Id])
GO
ALTER TABLE [dbo].[TbEmpleados] CHECK CONSTRAINT [FK_TbEmpleados_TbTipoId]
GO
ALTER TABLE [dbo].[TbProducto]  WITH CHECK ADD  CONSTRAINT [FK_TbProducto_TbCategoria] FOREIGN KEY([pd_IdCategoria])
REFERENCES [dbo].[TbCategoria] ([cat_Id])
GO
ALTER TABLE [dbo].[TbProducto] CHECK CONSTRAINT [FK_TbProducto_TbCategoria]
GO
/****** Object:  StoredProcedure [dbo].[accederEmpleado]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[accederEmpleado]
@usuario varchar(30),
@contrasena varchar(50)
as
begin
	Select e.em_identificacion as 'Identificacion',e.em_fechaNacimiento as 'Fecha Nacimiento',e.em_nombre as 'Nombre',e.em_contrasena as 'Contrasena',t.tid_Nombre as 'Tipo Documento',e.em_direccion as 'Direccion' ,c.ca_Descripcion as 'Cargo',e.em_contacto as 'Telefono de Contacto' 
	from TbEmpleados e inner join TbCargo c 
	on e.em_cargo = c.ca_Id inner join TbTipoId t
	on e.em_tipoId = t.tid_Id
	where e.em_identificacion = @usuario and e.em_contrasena = @contrasena
end
GO
/****** Object:  StoredProcedure [dbo].[crearCatgoria]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[crearCatgoria]
@des varchar(50)
as
begin
	insert into TbCategoria(cat_Descripcion)
	values (@des)
end
GO
/****** Object:  StoredProcedure [dbo].[crearProducto]    Script Date: 30/01/2018 4:54:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[crearProducto]
@nombre varchar(50),
@cantidad int,
@Precio money,
@Unidades int,
@sMin int,
@sMax int,
@cantXunidad varchar(50),
@Cat int
as
begin
	insert into TbProducto (pd_Nombre,pd_Cantidad,pd_Precio,pd_Unidades,pd_StockMin,pd_StockMax,pd_CantidadXUnidad,pd_IdCategoria)
	values (@nombre,@cantidad,@Precio,@Unidades,@sMin,@sMax,@cantXunidad,@Cat)
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarCategoria]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarCategoria]
@id int
as
begin
	Delete from TbCategoria where cat_Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarEmpleado]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarEmpleado]
@id varchar(30)
as
begin 
	delete from TbEmpleados where em_identificacion = @id
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarProducto]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarProducto]
@id int
as
begin
	Delete from TbProducto where pd_IdProducto = @id
end
GO
/****** Object:  StoredProcedure [dbo].[listarCatgoria]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarCatgoria]
as
begin
	Select cat_Id,cat_Descripcion from TbCategoria
end
GO
/****** Object:  StoredProcedure [dbo].[listarProductos]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarProductos]
as
begin
	select p.pd_IdProducto,p.pd_Nombre,p.pd_Cantidad,p.pd_Precio,p.pd_Unidades,p.pd_StockMin,p.pd_StockMax,p.pd_CantidadXUnidad,c.cat_Descripcion from TbProducto p inner join TbCategoria c 
	on p.pd_IdCategoria = c.cat_Id
end
GO
/****** Object:  StoredProcedure [dbo].[registrarEmpleado]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registrarEmpleado]
@id varchar(30),
@nacimiento date,
@nombre varchar(70),
@contrasena varchar(50),
@tipo int,
@dir varchar(50),
@cargo int,
@telefono varchar(60)
as
begin 
	insert into TbEmpleados (em_identificacion,em_fechaNacimiento,em_nombre,em_contrasena,em_tipoId,em_direccion,em_cargo,em_contacto)
	values (@id,@nacimiento,@nombre,@contrasena,@tipo,@dir,@cargo,@telefono)
end
GO
/****** Object:  StoredProcedure [dbo].[verEmpleados]    Script Date: 30/01/2018 4:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verEmpleados]
as
begin
	Select e.em_identificacion as 'Identificacion',e.em_fechaNacimiento as 'Fecha Nacimiento',e.em_nombre as 'Nombre',e.em_contrasena as 'Contrasena',t.tid_Nombre as 'Tipo Documento',e.em_direccion as 'Direccion' ,c.ca_Descripcion as 'Cargo',e.em_contacto as 'Telefono de Contacto' 
	from TbEmpleados e inner join TbCargo c 
	on e.em_cargo = c.ca_Id inner join TbTipoId t
	on e.em_tipoId = t.tid_Id
end
GO
USE [master]
GO
ALTER DATABASE [OutInDb] SET  READ_WRITE 
GO
