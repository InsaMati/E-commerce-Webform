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
	Stock smallint not null check (stock >= 0),
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
	Contraseña varchar(50) not null,
	IdTipoUsuario smallint not null foreign key references TIPO_DE_USUARIO(ID)
)
GO
create table PAISES
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar (50)
)
GO
create table DATOS_PERSONALES
(
	ID_usuario smallint not null primary key foreign key references USUARIO(ID),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(100) not null unique,
	Direccion varchar(100),
	ID_pais smallint foreign key references PAISES(ID),
	Telefono bigint,
	Fecha_Nac date not null,
)
GO
create table DATOS_BANCARIOS
(
	ID_usuario smallint not null primary key foreign key references USUARIO(ID),
	Banco varchar(50) not null,
	Cuil bigint not null,
	CBU bigint not null,
	Alias Varchar(50)
)
GO
create table CARRITO
(
	ID smallint not null primary key identity (1,1),
	ID_usuario smallint not null foreign key references USUARIO(ID),
	Costo_Total money not null
)
GO
create table ARTICULOS_X_CARRITO
(
	ID_carrito smallint not null foreign key references CARRITO(ID),
	ID_articulos smallint not null foreign key references ARTICULOS(ID),
	Cantidad smallint not null,
	Subtotal money not null,
	primary key (ID_carrito, ID_articulos)
)
GO
create table ESTADO
(
	ID smallint not null primary key identity (1,1),
	Descripcion varchar(100) not null
)
GO
create table PEDIDO
(
	ID smallint not null primary key identity (1,1),
	ID_carrito smallint not null foreign key references CARRITO(ID),
	ID_estado smallint not null foreign key references ESTADO(ID),
	Fecha date not null
)
GO
create table FACTURA
(
	ID smallint not null primary key identity (1,1),
	ID_pedido smallint not null foreign key references PEDIDO(ID),
	ID_usuario smallint not null foreign key references USUARIO(ID),
	Fecha date not null,
	Forma_de_pago varchar(50) not null,
	Importe money not null
)
go
create table TIPO_DE_PAGO
(
	ID smallint not null primary key identity (1,1),
	Descripcion varchar (50) not null
)
GO
create table PAGOS
(
	ID smallint not null primary key identity (1,1),
	ID_factura smallint not null foreign key references FACTURA(ID),
	ID_tipoPago smallint not null foreign key references TIPO_DE_PAGO(ID),
	Importe money not null
)