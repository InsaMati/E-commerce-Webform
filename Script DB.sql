USE [master]
GO
/****** Object:  Database [TP_Final]    Script Date: 29/1/2021 09:37:04 ******/
CREATE DATABASE [TP_Final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_Final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP_Final.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_Final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP_Final_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TP_Final] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_Final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_Final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_Final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_Final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_Final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_Final] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_Final] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TP_Final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_Final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_Final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_Final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_Final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_Final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_Final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_Final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_Final] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TP_Final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_Final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_Final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_Final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_Final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_Final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_Final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_Final] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP_Final] SET  MULTI_USER 
GO
ALTER DATABASE [TP_Final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_Final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_Final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_Final] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_Final] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP_Final] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TP_Final] SET QUERY_STORE = OFF
GO
USE [TP_Final]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ID_usuario] [smallint] NOT NULL,
	[Costo_Total] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESTADO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ID_carrito] [smallint] NOT NULL,
	[ID_estado] [smallint] NOT NULL,
	[Fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ListarAdmPedidos]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_ListarAdmPedidos] as
select P.ID, P.ID_CARRITO [Nro Remito],P.ID_ESTADO,P.Fecha, C.Costo_Total[Importe],E.Descripcion [Estado] From PEDIDO as P
inner join CARRITO as C on C.ID = P.ID_carrito
inner join ESTADO as E on E.ID = P.ID_estado
GO
/****** Object:  Table [dbo].[TIPO_DE_USUARIO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_DE_USUARIO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[IdTipoUsuario] [smallint] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_Listar_Usuarios]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_Listar_Usuarios] as
select U.ID,U.Email, U.Contraseña, U.Estado, TU.ID as IdTipo, TU.Nombre as TipoUsuario from USUARIO as U
inner join TIPO_DE_USUARIO as TU on TU.ID = U.IdTipoUsuario
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MARCA](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [smallint] NOT NULL,
	[IdCategoria] [smallint] NOT NULL,
	[ImagenURL] [varchar](1000) NULL,
	[Precio] [money] NOT NULL,
	[Stock] [smallint] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_ListarArticulos]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ListarArticulos] as
	select P.ID, P.Codigo,P.Nombre, P.Descripcion, M.Nombre as Marca, C.Nombre as Categoria, P.ImagenUrl,P.Precio,M.ID as IDmarca, C.ID as IDcategoria,P.Estado, P.Stock
	from ARTICULOS P
	inner join MARCA M on m.ID = p.IdMarca
	inner join CATEGORIA C on c.ID = p.IdCategoria
GO
/****** Object:  Table [dbo].[ARTICULOS_X_CARRITO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS_X_CARRITO](
	[ID_carrito] [smallint] NOT NULL,
	[ID_articulos] [smallint] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Subtotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_carrito] ASC,
	[ID_articulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS_BANCARIOS]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DATOS_BANCARIOS](
	[ID_usuario] [smallint] NOT NULL,
	[Banco] [varchar](50) NOT NULL,
	[Cuil] [bigint] NOT NULL,
	[CBU] [bigint] NOT NULL,
	[Alias] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DATOS_PERSONALES]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DATOS_PERSONALES](
	[ID_usuario] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NOT NULL,
	[Direccion] [varchar](100) NULL,
	[ID_Provincia] [smallint] NULL,
	[ID_Genero] [smallint] NULL,
	[Telefono] [bigint] NULL,
	[Fecha_Nac] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatosEnvios]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatosEnvios](
	[ID_Pedido] [smallint] NOT NULL,
	[ID_usuario] [smallint] NOT NULL,
	[Correo] [varchar](100) NULL,
	[Localidad] [varchar](100) NULL,
	[Calle] [varchar](100) NULL,
	[EntreCalles] [varchar](100) NULL,
	[CodigoPostal] [smallint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ID_pedido] [smallint] NOT NULL,
	[ID_usuario] [smallint] NOT NULL,
	[Fecha] [date] NOT NULL,
	[ID_FormPago] [smallint] NOT NULL,
	[Importe] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GENERO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GENERO](
	[ID_Genero] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HISTORIAL]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HISTORIAL](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Codigo] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
	[UsuarioNombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidosRechazados]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidosRechazados](
	[IDPedido] [smallint] NOT NULL,
	[Motivo] [varchar](60) NULL,
	[Mensaje] [varchar](1000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_DE_PAGO]    Script Date: 29/1/2021 09:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_DE_PAGO](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ARTICULOS] ON 
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (1, N'MTH', N'Medias', N'Medias termicas para hombre', 1, 3, N'https://http2.mlstatic.com/pack-x12-floyd-medias-termicas-fantasia-hombre-art-1416-D_Q_NP_623482-MLA30406376369_052019-F.webp', 500.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (2, N'MTM', N'Medias', N'Medias termicas para mujer', 1, 3, N'https://http2.mlstatic.com/pack-x3-floyd-medias-termica-dama-estampa-ctoalla-a-mj12-D_Q_NP_902474-MLA30131098317_042019-F.webp', 500.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (3, N'MTN', N'Medias', N'Medias termicas para niños', 1, 3, N'https://http2.mlstatic.com/pack-x6-medias-termicas-floyd-talle-4-art-55-D_NQ_NP_745045-MLA42477351089_072020-F.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (4, N'MTHE', N'Medias', N'Medias termicas para hombre', 2, 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSePHTWukhwbTUgBDjyulRWbG9w2QYZECBU_A&usqp=CAU', 700.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (5, N'MTME', N'Medias', N'Medias termicas para mujer', 2, 3, N'https://http2.mlstatic.com/D_NQ_NP_635020-MLA31908034086_082019-V.jpg', 700.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (6, N'MTNE', N'Medias', N'Medias termicas para niños', 2, 3, N'https://d26lpennugtm8s.cloudfront.net/stores/001/142/679/products/0010rn1-91846f4a0d2c2d01f015858650687274-1024-1024.jpg', 600.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (7, N'MPH', N'Medias', N'Medias plantines para hombre', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (8, N'MPM', N'Medias', N'Medias plantines para mujer', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (9, N'MPME', N'Medias', N'Medias plantines para mujer estampadas', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (10, N'M34H', N'Medias', N'Medias 3/4 para hombres', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (11, N'MB1', N'Medias', N'Medias de bebes', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (12, N'MDH', N'Medias', N'Medias deportivas hockey', 2, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 800.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (13, N'BXH', N'Calzones', N'Calzones para hombre', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (14, N'BXN', N'Calzones', N'Medias Nike', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (15, N'BXX', N'Calzones', N'Medias Nike', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (16, N'VED', N'Vedetina', N'Medias Nike', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (17, N'COEN', N'Colaless', N'Colaless de encaje', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (18, N'COAL', N'colaless', N'Colaless de algodon', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (19, N'CUEN', N'Culotte', N'Culotte de encaje', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 300.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (20, N'CODP', N'Corpiño', N'Corpiño deportivo', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 550.0000, 15, 1)
GO
INSERT [dbo].[ARTICULOS] ([ID], [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Stock], [Estado]) VALUES (21, N'COPP', N'Corpiño', N'Corpiño deportivo', 1, 3, N'https://th.bing.com/th/id/OIP.DJJRiwY9Xc0yPA3Se63boAHaHa?pid=Api&rs=1', 1500.0000, 30, 1)
GO
SET IDENTITY_INSERT [dbo].[ARTICULOS] OFF
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (1, 2, 5, 2500.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (2, 2, 4, 2000.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (3, 2, 6, 3000.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (4, 2, 6, 3000.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (5, 2, 10, 5000.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (6, 2, 6, 3000.0000)
GO
INSERT [dbo].[ARTICULOS_X_CARRITO] ([ID_carrito], [ID_articulos], [Cantidad], [Subtotal]) VALUES (7, 2, 3, 1500.0000)
GO
SET IDENTITY_INSERT [dbo].[CARRITO] ON 
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (1, 1, 2500.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (2, 1, 2000.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (3, 1, 3000.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (4, 1, 3000.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (5, 4, 5000.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (6, 1, 3000.0000, 1)
GO
INSERT [dbo].[CARRITO] ([ID], [ID_usuario], [Costo_Total], [Estado]) VALUES (7, 1, 1500.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[CARRITO] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([ID], [Nombre], [Estado]) VALUES (1, N'Termica', 1)
GO
INSERT [dbo].[CATEGORIA] ([ID], [Nombre], [Estado]) VALUES (2, N'Deportivo', 1)
GO
INSERT [dbo].[CATEGORIA] ([ID], [Nombre], [Estado]) VALUES (3, N'Ropa Interior', 1)
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
INSERT [dbo].[DATOS_PERSONALES] ([ID_usuario], [Nombre], [Apellido], [Dni], [Direccion], [ID_Provincia], [ID_Genero], [Telefono], [Fecha_Nac]) VALUES (1, N'Matias', N'Insaurralde', 39878942, N'Segurola 1530', 1, 1, 1157482476, CAST(N'1996-10-16' AS Date))
GO
INSERT [dbo].[DATOS_PERSONALES] ([ID_usuario], [Nombre], [Apellido], [Dni], [Direccion], [ID_Provincia], [ID_Genero], [Telefono], [Fecha_Nac]) VALUES (2, N'Jose', N'Deodo', 40568790, N'Cordoba 2450', 1, 1, 1157482476, CAST(N'2000-10-20' AS Date))
GO
INSERT [dbo].[DATOS_PERSONALES] ([ID_usuario], [Nombre], [Apellido], [Dni], [Direccion], [ID_Provincia], [ID_Genero], [Telefono], [Fecha_Nac]) VALUES (4, N'Matias', N'Insaurralde', 1111111, N'Segurola 1530', 1, 1, 1157482476, CAST(N'2020-12-09' AS Date))
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (1, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (2, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (3, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (4, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (5, 4, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (6, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
INSERT [dbo].[DatosEnvios] ([ID_Pedido], [ID_usuario], [Correo], [Localidad], [Calle], [EntreCalles], [CodigoPostal]) VALUES (7, 1, N'Oca', N'Buenos Aires', N'Segurola 1530', N'Callao y williams', 1648)
GO
SET IDENTITY_INSERT [dbo].[ESTADO] ON 
GO
INSERT [dbo].[ESTADO] ([ID], [Descripcion]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[ESTADO] ([ID], [Descripcion]) VALUES (2, N'Rechazado')
GO
INSERT [dbo].[ESTADO] ([ID], [Descripcion]) VALUES (3, N'En Camino')
GO
INSERT [dbo].[ESTADO] ([ID], [Descripcion]) VALUES (4, N'Entregado')
GO
SET IDENTITY_INSERT [dbo].[ESTADO] OFF
GO
SET IDENTITY_INSERT [dbo].[FACTURA] ON 
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (1, 1, 1, CAST(N'2020-12-04' AS Date), 1, 2500.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (2, 2, 1, CAST(N'2020-12-04' AS Date), 5, 2000.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (3, 3, 1, CAST(N'2020-12-04' AS Date), 5, 3000.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (4, 4, 1, CAST(N'2020-12-09' AS Date), 5, 3000.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (5, 5, 4, CAST(N'2020-12-11' AS Date), 5, 5000.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (6, 6, 1, CAST(N'2020-12-11' AS Date), 5, 3000.0000)
GO
INSERT [dbo].[FACTURA] ([ID], [ID_pedido], [ID_usuario], [Fecha], [ID_FormPago], [Importe]) VALUES (7, 7, 1, CAST(N'2020-12-11' AS Date), 2, 1500.0000)
GO
SET IDENTITY_INSERT [dbo].[FACTURA] OFF
GO
SET IDENTITY_INSERT [dbo].[GENERO] ON 
GO
INSERT [dbo].[GENERO] ([ID_Genero], [Nombre]) VALUES (1, N'Masculino')
GO
INSERT [dbo].[GENERO] ([ID_Genero], [Nombre]) VALUES (2, N'Femenino')
GO
INSERT [dbo].[GENERO] ([ID_Genero], [Nombre]) VALUES (3, N'Otro')
GO
SET IDENTITY_INSERT [dbo].[GENERO] OFF
GO
SET IDENTITY_INSERT [dbo].[HISTORIAL] ON 
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (1, CAST(N'2020-12-04' AS Date), N'MTH', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (2, CAST(N'2020-12-04' AS Date), N'MTM', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (3, CAST(N'2020-12-04' AS Date), N'MTN', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (4, CAST(N'2020-12-04' AS Date), N'MTHE', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (5, CAST(N'2020-12-04' AS Date), N'MTME', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (6, CAST(N'2020-12-04' AS Date), N'MTNE', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (7, CAST(N'2020-12-04' AS Date), N'MPH', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (8, CAST(N'2020-12-04' AS Date), N'MPM', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (9, CAST(N'2020-12-04' AS Date), N'MPME', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (10, CAST(N'2020-12-04' AS Date), N'M34H', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (11, CAST(N'2020-12-04' AS Date), N'MB1', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (12, CAST(N'2020-12-04' AS Date), N'MDH', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (13, CAST(N'2020-12-04' AS Date), N'BXH', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (14, CAST(N'2020-12-04' AS Date), N'BXN', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (15, CAST(N'2020-12-04' AS Date), N'BXX', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (16, CAST(N'2020-12-04' AS Date), N'VED', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (17, CAST(N'2020-12-04' AS Date), N'COEN', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (18, CAST(N'2020-12-04' AS Date), N'COAL', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (19, CAST(N'2020-12-04' AS Date), N'CUEN', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (20, CAST(N'2020-12-04' AS Date), N'CODP', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
INSERT [dbo].[HISTORIAL] ([ID], [Fecha], [Codigo], [Descripcion], [UsuarioNombre]) VALUES (21, CAST(N'2020-12-04' AS Date), N'COPP', N'Registro nuevo', N'DESKTOP-C7AMVOI\matia')
GO
SET IDENTITY_INSERT [dbo].[HISTORIAL] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 
GO
INSERT [dbo].[MARCA] ([ID], [Nombre], [Estado]) VALUES (1, N'Floyd', 1)
GO
INSERT [dbo].[MARCA] ([ID], [Nombre], [Estado]) VALUES (2, N'Elemento', 1)
GO
INSERT [dbo].[MARCA] ([ID], [Nombre], [Estado]) VALUES (3, N'Kolper', 1)
GO
INSERT [dbo].[MARCA] ([ID], [Nombre], [Estado]) VALUES (4, N'Puma', 1)
GO
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
SET IDENTITY_INSERT [dbo].[PEDIDO] ON 
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (1, 1, 2, CAST(N'2020-12-04' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (2, 2, 2, CAST(N'2020-12-04' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (3, 3, 2, CAST(N'2020-12-04' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (4, 4, 4, CAST(N'2020-12-09' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (5, 5, 4, CAST(N'2020-12-11' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (6, 6, 4, CAST(N'2020-12-11' AS Date))
GO
INSERT [dbo].[PEDIDO] ([ID], [ID_carrito], [ID_estado], [Fecha]) VALUES (7, 7, 3, CAST(N'2020-12-11' AS Date))
GO
SET IDENTITY_INSERT [dbo].[PEDIDO] OFF
GO
INSERT [dbo].[PedidosRechazados] ([IDPedido], [Motivo], [Mensaje]) VALUES (1, N'Error en el envio', N'Direccion erronea')
GO
INSERT [dbo].[PedidosRechazados] ([IDPedido], [Motivo], [Mensaje]) VALUES (2, N'Falta de stock', N'Disculpe las moletias nos encontramos sin stock de ese producto')
GO
INSERT [dbo].[PedidosRechazados] ([IDPedido], [Motivo], [Mensaje]) VALUES (3, N'Falta de stock', N'Problemas en el stock')
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] ON 
GO
INSERT [dbo].[PROVINCIA] ([ID], [Nombre]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[PROVINCIA] ([ID], [Nombre]) VALUES (2, N'Santa Fe')
GO
INSERT [dbo].[PROVINCIA] ([ID], [Nombre]) VALUES (3, N'Cordoba')
GO
INSERT [dbo].[PROVINCIA] ([ID], [Nombre]) VALUES (4, N'Entre Rios')
GO
INSERT [dbo].[PROVINCIA] ([ID], [Nombre]) VALUES (5, N'La Pampa')
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_DE_PAGO] ON 
GO
INSERT [dbo].[TIPO_DE_PAGO] ([ID], [Descripcion]) VALUES (1, N'Efectivo')
GO
INSERT [dbo].[TIPO_DE_PAGO] ([ID], [Descripcion]) VALUES (2, N'Tarjeta Credito/Debito')
GO
INSERT [dbo].[TIPO_DE_PAGO] ([ID], [Descripcion]) VALUES (3, N'Transferencia Bancaria')
GO
INSERT [dbo].[TIPO_DE_PAGO] ([ID], [Descripcion]) VALUES (4, N'Paypal')
GO
INSERT [dbo].[TIPO_DE_PAGO] ([ID], [Descripcion]) VALUES (5, N'MercadoPago')
GO
SET IDENTITY_INSERT [dbo].[TIPO_DE_PAGO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_DE_USUARIO] ON 
GO
INSERT [dbo].[TIPO_DE_USUARIO] ([ID], [Nombre]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[TIPO_DE_USUARIO] ([ID], [Nombre]) VALUES (2, N'Empleado')
GO
INSERT [dbo].[TIPO_DE_USUARIO] ([ID], [Nombre]) VALUES (3, N'Visita')
GO
INSERT [dbo].[TIPO_DE_USUARIO] ([ID], [Nombre]) VALUES (4, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[TIPO_DE_USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([ID], [Email], [Contraseña], [IdTipoUsuario], [Estado]) VALUES (1, N'matiasinsaurralde51@gmail.com', N'MQAyADMANAA1ADYANwA=', 3, 1)
GO
INSERT [dbo].[USUARIO] ([ID], [Email], [Contraseña], [IdTipoUsuario], [Estado]) VALUES (2, N'josedeodo@gmail.com', N'MQAyADMANAA1ADYANwA=', 1, 1)
GO
INSERT [dbo].[USUARIO] ([ID], [Email], [Contraseña], [IdTipoUsuario], [Estado]) VALUES (4, N'matiasinsaurralde53@gmail.com', N'MQAyADMANAA1ADYANwA=', 3, 1)
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ARTICULO__06370DAC78CFFF84]    Script Date: 29/1/2021 09:37:05 ******/
ALTER TABLE [dbo].[ARTICULOS] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__DATOS_PE__C03085750EB37A28]    Script Date: 29/1/2021 09:37:05 ******/
ALTER TABLE [dbo].[DATOS_PERSONALES] ADD UNIQUE NONCLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USUARIO__A9D10534F07F91AA]    Script Date: 29/1/2021 09:37:05 ******/
ALTER TABLE [dbo].[USUARIO] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([ID])
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([ID])
GO
ALTER TABLE [dbo].[ARTICULOS_X_CARRITO]  WITH CHECK ADD FOREIGN KEY([ID_articulos])
REFERENCES [dbo].[ARTICULOS] ([ID])
GO
ALTER TABLE [dbo].[ARTICULOS_X_CARRITO]  WITH CHECK ADD FOREIGN KEY([ID_carrito])
REFERENCES [dbo].[CARRITO] ([ID])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[USUARIO] ([ID])
GO
ALTER TABLE [dbo].[DATOS_BANCARIOS]  WITH CHECK ADD FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[USUARIO] ([ID])
GO
ALTER TABLE [dbo].[DATOS_PERSONALES]  WITH CHECK ADD FOREIGN KEY([ID_Genero])
REFERENCES [dbo].[GENERO] ([ID_Genero])
GO
ALTER TABLE [dbo].[DATOS_PERSONALES]  WITH CHECK ADD FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[PROVINCIA] ([ID])
GO
ALTER TABLE [dbo].[DATOS_PERSONALES]  WITH CHECK ADD FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[USUARIO] ([ID])
GO
ALTER TABLE [dbo].[DatosEnvios]  WITH CHECK ADD FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[PEDIDO] ([ID])
GO
ALTER TABLE [dbo].[DatosEnvios]  WITH CHECK ADD FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[USUARIO] ([ID])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([ID_FormPago])
REFERENCES [dbo].[TIPO_DE_PAGO] ([ID])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([ID_pedido])
REFERENCES [dbo].[PEDIDO] ([ID])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[USUARIO] ([ID])
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD FOREIGN KEY([ID_carrito])
REFERENCES [dbo].[CARRITO] ([ID])
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD FOREIGN KEY([ID_estado])
REFERENCES [dbo].[ESTADO] ([ID])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TIPO_DE_USUARIO] ([ID])
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD CHECK  (([stock]>=(0)))
GO
ALTER TABLE [dbo].[ARTICULOS_X_CARRITO]  WITH CHECK ADD CHECK  (([cantidad]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Articulo]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Agregar_Articulo](
@Codigo varchar (50),
@Nombre varchar (50),
@Descripcion varchar (150),
@Marca smallint,
@Categoria smallint,
@Imagen varchar (1000),
@Precio money,
@Stock smallint,
@Estado bit
)
as
BEGIN TRY 
	INSERT INTO ARTICULOS (Codigo,Nombre,Descripcion,IdMarca,IdCategoria,ImagenURL,Precio,Stock,Estado)
	VALUES (@Codigo,@Nombre,@Descripcion,@Marca,@Categoria,@Imagen,@Precio,@Stock,@Estado)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Articulo',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_DatosEnvio]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Agregar_DatosEnvio](
   
	@IdPedido smallint,
	@IdUsuario smallint,
	@Correo varchar(100),
	@Localidad varchar(100),
	@Calle varchar(100),
	@EntreCalles varchar(100),
	@CodigoPostal smallint
)
as
BEGIN TRY 
	INSERT INTO DatosEnvios(ID_pedido,ID_usuario,Correo,Localidad,Calle,EntreCalles,CodigoPostal)
	VALUES (@IdPedido,@IdUsuario,@Correo,@Localidad,@Calle,@EntreCalles,@CodigoPostal)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Datos de envio',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AgregarUsuario](

@Email varchar(100),
@Contraseña varchar(100),
@IdTipoUsuario smallint,
@Nombre varchar(50),
@Apellido varchar(50),
@Dni int,
@Genero smallint,
@Direccion varchar(100),
@Provincia smallint,
@FechaNacimiento date,
@Telefono bigint
) AS
BEGIN TRY
	BEGIN TRANSACTION

	    DECLARE @IDUSUARIO SMALLINT
		
		INSERT INTO USUARIO (Email,Contraseña,IdTipoUsuario,Estado)
		VALUES (@Email,@Contraseña,@IdTipoUsuario,1)

		select @IDUSUARIO = ID from USUARIO where Email = @Email and Contraseña = @Contraseña

		INSERT INTO DATOS_PERSONALES (ID_usuario,Nombre,Apellido,Dni,ID_Genero,Direccion,ID_Provincia,Fecha_Nac,Telefono)
		VALUES (@IDUSUARIO,@Nombre,@Apellido,@Dni,@Genero,@Direccion,@Provincia,@FechaNacimiento,@Telefono)
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 BEGIN
	ROLLBACK TRANSACTION 
	END
	RAISERROR('ERROR AL CARGAR UN USUARIO',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Alta_Carrito]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Alta_Carrito](
@IdUsuario smallint,
@Costo money,
@Estado bit
)
as
BEGIN TRY 
	INSERT INTO CARRITO(ID_usuario,Costo_Total,Estado)
	VALUES (@IdUsuario,@Costo,@Estado)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Carrito',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Alta_ElementoCarrito]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Alta_ElementoCarrito](
    @ID_carrito smallint,
	@ID_articulos smallint,
	@Cantidad smallint,
	@Subtotal money
)
as
BEGIN TRY 
	INSERT INTO ARTICULOS_X_CARRITO(ID_carrito,ID_articulos,Cantidad,Subtotal)
	VALUES (@ID_carrito,@ID_articulos,@Cantidad,@Subtotal)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Elemento Carrito',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Alta_Factura]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Alta_Factura](
   
	@ID_pedido smallint,
	@ID_usuario smallint,
	@Fecha date,
	@ID_FormPago smallint,
	@Importe money
)
as
BEGIN TRY 
	INSERT INTO FACTURA(ID_pedido,ID_usuario,Fecha,ID_FormPago,Importe)
	VALUES (@ID_pedido,@ID_usuario,@Fecha,@ID_FormPago,@Importe)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Factura',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Alta_Pedido]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Alta_Pedido](
@IdCarrito smallint,
@IdEstado smallint,
@Fecha date
)
as
BEGIN TRY 
	INSERT INTO PEDIDO(ID_carrito,ID_estado,Fecha)
	VALUES (@IdCarrito,@IdEstado,@Fecha)
END TRY
BEGIN CATCH
	RAISERROR('Error al Agregar Pedido',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_ComprarCarrito]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ComprarCarrito](
	@ID_pedido smallint,
	@IdUsuario smallint,
	@ID_FormaDePago smallint,
	@CostoTotal money
) as
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			insert into FACTURA (ID_pedido, ID_usuario, Fecha, ID_FormPago, Importe)
			values (@ID_pedido,@IdUsuario,Getdate(),@ID_FormaDePago,@CostoTotal)
			declare @idcarrito SMALLINT
			select @idcarrito = c.ID FROM CARRITO as c
			inner join pedido as p on p.ID_carrito = c.ID
			insert into PEDIDO (ID_carrito,ID_estado,Fecha)
			values(@idcarrito,1,getdate())
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		RAISERROR('ERROR AL CARGAR UN PEDIDO',16,1)
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Compras_X_Usuario]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Compras_X_Usuario](
	@ID_Pedido smallint

) as
BEGIN TRY
	select A.Nombre [Nombre],A.Descripcion[Descripcion] , AXC.CANTIDAD, AXC.SUBTOTAL FROM ARTICULOS_X_CARRITO AS AXC
inner join ARTICULOS as A on A.ID = AXC.ID_articulos
inner join PEDIDO as P on P.ID_carrito = AXC.ID_carrito
inner join FACTURA as F on F.ID_pedido = P.ID
where F.ID_pedido = @ID_Pedido
END TRY
BEGIN CATCH
	RAISERROR('Error al listar articulos',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_facturas_por_usuario]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listar_facturas_por_usuario]
(
@Id_Usuario smallint

)
as
select F.ID, F.ID_PEDIDO[Nro Remito],F.ID_usuario,E.Descripcion [Estado] , F.Fecha, TP.[Descripcion], F.Importe from FACTURA as F
inner join PEDIDO AS P on P.ID = F.ID_pedido
inner join ESTADO AS E on E.ID = P.ID_estado
inner join TIPO_DE_PAGO as TP on TP.ID = F.ID_FormPago
where F.ID_usuario = @Id_Usuario
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarUsuarios]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarUsuarios](@Tipo smallint) as
BEGIN TRY
	SELECT * FROM USUARIO
	WHERE USUARIO.IdTipoUsuario = @Tipo
END TRY
BEGIN CATCH
	RAISERROR('ERROR AL LISTAR ALUMNOS POR TIPO',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Modificar_Articulo]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Modificar_Articulo](
@ID  smallint,
@Codigo varchar (50),
@Nombre varchar (50),
@Descripcion varchar (150),
@Marca smallint,
@Categoria smallint,
@Imagen varchar (1000),
@Precio money,
@Stock smallint,
@Estado bit
)
as
BEGIN TRY 
	UPDATE  ARTICULOS set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMarca = @Marca, IdCategoria = @Categoria, ImagenURL = @Imagen, Precio = @Precio,
	Stock = @Stock, Estado = @Estado where ID = @ID
END TRY
BEGIN CATCH
	RAISERROR('Error al Modificar Articulo',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Modificar_Usuario]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Modificar_Usuario](
@ID smallint,
@Email varchar(100),
@Contraseña varchar(100),
@IdTipoUsuario smallint,
@Estado bit 
)
as
BEGIN TRY 
	UPDATE  USUARIO set Email = @Email, Contraseña = @Contraseña, IdTipoUsuario = @IdTipoUsuario, Estado = @Estado
	where ID = @ID
END TRY
BEGIN CATCH
	RAISERROR('Error al Modificar Usuario',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarEstadoPedido]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ModificarEstadoPedido](
@IdPedido smallint,
@IdEstado smallint
)
as
BEGIN TRY 
	UPDATE  PEDIDO set ID_estado = @IdEstado
	where ID = @IdPedido
END TRY
BEGIN CATCH
	RAISERROR('Error al Modificar estado de pedido',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Ver_Pedido]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Ver_Pedido]
(@IdPedido smallint) as
BEGIN TRY
select A.Nombre, AXC.Cantidad, AXC.Subtotal, DE.Correo,DE.Localidad,DE.Calle,DE.EntreCalles,DE.CodigoPostal from ARTICULOS_X_CARRITO as AXC
inner join ARTICULOS as A on A.ID = AXC.ID_articulos
inner join PEDIDO as P on P.ID_carrito = AXC.ID_carrito
inner join CARRITO as C on C.ID = AXC.ID_carrito
inner join DatosEnvios as DE on DE.ID_usuario = c.ID_usuario
where P.ID = @IdPedido and DE.ID_Pedido =@IdPedido
END TRY
BEGIN CATCH
RAISERROR('Error al mostrar Pedido',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_USUARIO]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_VERIFICAR_USUARIO]
(
@Email varchar(100),
@Contraseña varchar(100)
) as
BEGIN TRY
select ID, Email, Contraseña, IdTipoUsuario, Estado from USUARIO where Email = @Email and Contraseña=@Contraseña
END TRY
BEGIN CATCH
RAISERROR('Usuario Inexistente.',16,1)
END CATCH

select *From USUARIO
select *from DATOS_PERSONALES
GO
/****** Object:  Trigger [dbo].[TR_ArticuloInsert]    Script Date: 29/1/2021 09:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_ArticuloInsert]
on [dbo].[ARTICULOS] for insert  as
begin
	declare @CodigoProducto varchar (50)
	select @CodigoProducto = Codigo from inserted
	insert into HISTORIAL values (getdate(),@CodigoProducto,'Registro nuevo', SYSTEM_USER)
end
GO
ALTER TABLE [dbo].[ARTICULOS] ENABLE TRIGGER [TR_ArticuloInsert]
GO
USE [master]
GO
ALTER DATABASE [TP_Final] SET  READ_WRITE 
GO
