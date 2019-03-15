USE [master]
GO
/****** Object:  Database [prueba_tecnica_altioracorp]    Script Date: 14/3/2019 1:01:02 ******/
CREATE DATABASE [prueba_tecnica_altioracorp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba_tecnica_altioracorp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\prueba_tecnica_altioracorp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_tecnica_altioracorp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\prueba_tecnica_altioracorp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba_tecnica_altioracorp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET RECOVERY FULL 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET  MULTI_USER 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET QUERY_STORE = OFF
GO
USE [prueba_tecnica_altioracorp]
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
USE [prueba_tecnica_altioracorp]
GO
/****** Object:  Table [dbo].[tArticulos]    Script Date: 14/3/2019 1:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tArticulos](
	[IdArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](8) NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[CreadoPor] [char](32) NULL,
	[FechaCreacion] [datetime] NULL,
	[EstacionCreacion] [varchar](32) NULL,
	[ModificadoPor] [varchar](32) NULL,
	[UltimaModificacion] [datetime] NULL,
	[EstacionModificacion] [varchar](32) NULL,
 CONSTRAINT [PK_tArticulos_IdArticulo] PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tClientes]    Script Date: 14/3/2019 1:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tClientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](32) NOT NULL,
	[Apellidos] [varchar](32) NOT NULL,
	[NombresApellidos] [varchar](64) NOT NULL,
	[CreadoPor] [char](32) NULL,
	[FechaCreacion] [datetime] NULL,
	[EstacionCreacion] [varchar](32) NULL,
	[ModificadoPor] [varchar](32) NULL,
	[UltimaModificacion] [datetime] NULL,
	[EstacionModificacion] [varchar](32) NULL,
 CONSTRAINT [PK_tClientes_IdCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrdenes]    Script Date: 14/3/2019 1:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrdenes](
	[IdOrden] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[CreadoPor] [char](32) NULL,
	[FechaCreacion] [datetime] NULL,
	[EstacionCreacion] [varchar](32) NULL,
	[ModificadoPor] [varchar](32) NULL,
	[UltimaModificacion] [datetime] NULL,
	[EstacionModificacion] [varchar](32) NULL,
 CONSTRAINT [PK_tOrdenes_IdOrden] PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_tOrdenes_tArticulos] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[tArticulos] ([IdArticulo])
GO
ALTER TABLE [dbo].[tOrdenes] CHECK CONSTRAINT [FK_tOrdenes_tArticulos]
GO
ALTER TABLE [dbo].[tOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_tOrdenes_tClientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tClientes] ([IdCliente])
GO
ALTER TABLE [dbo].[tOrdenes] CHECK CONSTRAINT [FK_tOrdenes_tClientes]
GO
USE [master]
GO
ALTER DATABASE [prueba_tecnica_altioracorp] SET  READ_WRITE 
GO
