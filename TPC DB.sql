create database TP_Final
go
use TP_Final
go
create table CATEGORIA
(
	ID smallint not null primary key identity (1,1),
	Descripcion varchar(50) not null
)
go
create table MARCA
(
	ID smallint not null primary key identity (1,1),
	Descripcion varchar(50) not null
)
go
create table ARTICULOS
(
	ID smallint not null primary key identity (1,1),
	Codigo varchar(50) not null unique,
	Nombre varchar(50) not null,
	Descripcion varchar(150),
	IdMarca smallint not null foreign key references MARCA(ID),
	IdCategoria smallint not null foreign key references CATEGORIA(ID), 
	ImagenURL varchar(1000),
	Precio money not null,
	Estado bit not null
)
go
create table TIPO_DE_USUARIO
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar(50) not null
)
go
create table USUARIO
(
	ID smallint primary key identity (1,1),
	Email varchar(100) not null unique,
	Contrase�a varchar(50) not null,
	IdTipoUsuario smallint not null foreign key references TIPO_DE_USUARIO(ID)
)
go
create table CLIENTE
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	IdUsuario smallint not null foreign key references USUARIO(ID)
)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTH','Medias', 'Medias termicas para hombre', 1, 3, 'https://http2.mlstatic.com/pack-x12-floyd-medias-termicas-fantasia-hombre-art-1416-D_Q_NP_623482-MLA30406376369_052019-F.webp', 500, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTM','Medias', 'Medias termicas para mujer', 1, 3, 'https://http2.mlstatic.com/pack-x3-floyd-medias-termica-dama-estampa-ctoalla-a-mj12-D_Q_NP_902474-MLA30131098317_042019-F.webp', 500, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTN','Medias', 'Medias termicas para ni�os', 1, 3, 'https://http2.mlstatic.com/pack-x6-medias-termicas-floyd-talle-4-art-55-D_NQ_NP_745045-MLA42477351089_072020-F.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTHE','Medias', 'Medias termicas para hombre', 2, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSePHTWukhwbTUgBDjyulRWbG9w2QYZECBU_A&usqp=CAU', 700, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTME','Medias', 'Medias termicas para mujer', 2, 3, 'https://http2.mlstatic.com/D_NQ_NP_635020-MLA31908034086_082019-V.jpg', 700, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MTNE','Medias', 'Medias termicas para ni�os', 2, 3, 'https://d26lpennugtm8s.cloudfront.net/stores/001/142/679/products/0010rn1-91846f4a0d2c2d01f015858650687274-1024-1024.jpg', 600, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MPH','Medias', 'Medias plantines para hombre', 2, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MPM','Medias', 'Medias plantines para mujer', 2, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MPME','Medias', 'Medias plantines para mujer estampadas', 2, 3,'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('M34H','Medias', 'Medias 3/4 para hombres', 2, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MB1','Medias', 'Medias de bebes', 2, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('MDH','Medias', 'Medias deportivas hockey', 2, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 800, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('BXH', 'Calzones', 1, 3, N'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('BXN', 'Calzones', 'Medias Nike', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('BXX', 'Calzones', 'Medias Nike', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 500, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('VED', 'Vedetina', 'Medias Nike', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('COEN', 'Colaless','Colaless de encaje', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 400, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('COAL', 'colaless','Colaless de algodon', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 350, 1)
GO
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('CUEN', 'Culotte','Culotte de encaje', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 300, 1)
go
INSERT [dbo].[ARTICULOS] ( [Codigo], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [ImagenURL], [Precio], [Estado]) VALUES ('CODP', 'Corpi�o','Corpi�o deportivo', 1, 3, 'https://sporting.vteximg.com.br/arquivos/ids/195136-1500-1500/1.jpg', 550, 1)