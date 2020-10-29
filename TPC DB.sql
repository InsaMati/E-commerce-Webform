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
	Contraseña varchar(50) not null,
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