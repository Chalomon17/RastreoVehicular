USE [master]
GO
/****** Object:  Database [DBRastreoVehicular]    Script Date: 17/05/2024 05:21:51 p. m. ******/
CREATE DATABASE [DBRastreoVehicular]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBRastreoVehicular', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBRastreoVehicular.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBRastreoVehicular_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBRastreoVehicular_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBRastreoVehicular] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBRastreoVehicular].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBRastreoVehicular] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBRastreoVehicular] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBRastreoVehicular] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBRastreoVehicular] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBRastreoVehicular] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBRastreoVehicular] SET  MULTI_USER 
GO
ALTER DATABASE [DBRastreoVehicular] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBRastreoVehicular] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBRastreoVehicular] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBRastreoVehicular] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBRastreoVehicular] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBRastreoVehicular] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBRastreoVehicular] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBRastreoVehicular] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBRastreoVehicular]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 17/05/2024 05:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[IdPropietario] [uniqueidentifier] NOT NULL,
	[Nombres] [varchar](150) NOT NULL,
	[ApellidoPaterno] [varchar](100) NOT NULL,
	[ApellidoMaterno] [varchar](100) NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Telefono] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RastreoVehiculo]    Script Date: 17/05/2024 05:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RastreoVehiculo](
	[IdRastreoVehiculo] [uniqueidentifier] NOT NULL,
	[Latitud] [decimal](9, 6) NOT NULL,
	[Longitud] [decimal](9, 6) NOT NULL,
	[IdVehiculo] [uniqueidentifier] NULL,
	[IdPropietario] [uniqueidentifier] NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRastreoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVehiculo]    Script Date: 17/05/2024 05:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVehiculo](
	[IdTipoVehiculo] [uniqueidentifier] NOT NULL,
	[ClaveTipoVehiculo] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 17/05/2024 05:21:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[IdVehiculo] [uniqueidentifier] NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[SubMarca] [varchar](200) NOT NULL,
	[Modelo] [int] NOT NULL,
	[IdTipoVehiculo] [uniqueidentifier] NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioModificacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Propietario] ADD  DEFAULT (newid()) FOR [IdPropietario]
GO
ALTER TABLE [dbo].[Propietario] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[RastreoVehiculo] ADD  DEFAULT (newid()) FOR [IdRastreoVehiculo]
GO
ALTER TABLE [dbo].[RastreoVehiculo] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[TipoVehiculo] ADD  DEFAULT (newid()) FOR [IdTipoVehiculo]
GO
ALTER TABLE [dbo].[TipoVehiculo] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Vehiculo] ADD  DEFAULT (newid()) FOR [IdVehiculo]
GO
ALTER TABLE [dbo].[Vehiculo] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[RastreoVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Propietario] FOREIGN KEY([IdPropietario])
REFERENCES [dbo].[Propietario] ([IdPropietario])
GO
ALTER TABLE [dbo].[RastreoVehiculo] CHECK CONSTRAINT [FK_Propietario]
GO
ALTER TABLE [dbo].[RastreoVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([IdVehiculo])
GO
ALTER TABLE [dbo].[RastreoVehiculo] CHECK CONSTRAINT [FK_Vehiculo]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Vehiculo] FOREIGN KEY([IdTipoVehiculo])
REFERENCES [dbo].[TipoVehiculo] ([IdTipoVehiculo])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Tipo_Vehiculo]
GO
USE [master]
GO
ALTER DATABASE [DBRastreoVehicular] SET  READ_WRITE 
GO
