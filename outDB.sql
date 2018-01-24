/*    ==ScriptingParameters==

    SourceServerVersion : SQL Server 2008 (10.0.2531)
    SourceDatabaseEngineEdition : Microsoft SQL Server Express Edition
    SourceDatabaseEngineType : SQL Server independiente

    TargetServerVersion : SQL Server 2017
    TargetDatabaseEngineEdition : Microsoft SQL Server Standard Edition
    TargetDatabaseEngineType : SQL Server independiente
*/
USE [master]
GO
/****** Object:  Database [OutInDb]    Script Date: 24/01/18 14:01:36 ******/
CREATE DATABASE [OutInDb] ON  PRIMARY 
( NAME = N'OutInDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\OutInDb.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OutInDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\OutInDb_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [OutInDb]
GO
/****** Object:  Table [dbo].[TbCargo]    Script Date: 24/01/18 14:01:36 ******/
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
/****** Object:  Table [dbo].[TbEmpleados]    Script Date: 24/01/18 14:01:36 ******/
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
/****** Object:  Table [dbo].[TbTipoId]    Script Date: 24/01/18 14:01:36 ******/
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
/****** Object:  StoredProcedure [dbo].[accederEmpleado]    Script Date: 24/01/18 14:01:37 ******/
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
/****** Object:  StoredProcedure [dbo].[verEmpleados]    Script Date: 24/01/18 14:01:37 ******/
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
