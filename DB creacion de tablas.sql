create database TP_Final
go
use TP_Final
go
create table CATEGORIA
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Estado bit not null

)
go
create table MARCA
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Estado bit not null
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
	Email varchar(100) not null unique,
	Contraseña varchar(100) not null,
	IdTipoUsuario smallint not null foreign key references TIPO_DE_USUARIO(ID),
	Estado bit not null
)

GO
create table PROVINCIA
(
	ID smallint not null primary key identity (1,1),
	Nombre varchar (50)
)
GO
create table GENERO(
	ID_Genero smallint not null primary key identity(1,1),
	Nombre varchar (80) not null
)
GO
create table DATOS_PERSONALES
(
	ID_usuario smallint not null primary key foreign key references USUARIO(ID),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Dni int not null unique,
	Direccion varchar(100),
	ID_Provincia smallint foreign key references Provincia(ID),
	ID_Genero smallint foreign key references GENERO(ID_Genero),
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
	Costo_Total money not null,
	Estado bit not null
)
GO
create table ARTICULOS_X_CARRITO
(
	ID_carrito smallint not null foreign key references CARRITO(ID),
	ID_articulos smallint not null foreign key references ARTICULOS(ID),
	Cantidad smallint not null check (cantidad > 0),
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
create table DatosEnvios
(
       ID_Pedido smallint not null foreign key references PEDIDO(ID), 
       ID_usuario smallint not null foreign key references USUARIO(ID),
       Correo varchar(100),
	   Localidad varchar(100),
	   Calle varchar(100),
	   EntreCalles varchar(100),
	   CodigoPostal smallint not null
)
go
create table TIPO_DE_PAGO
(
	ID smallint not null primary key identity (1,1),
	Descripcion varchar (50) not null
)
GO
create table FACTURA
(
	ID smallint not null primary key identity (1,1),
	ID_pedido smallint not null foreign key references PEDIDO(ID),
	ID_usuario smallint not null foreign key references USUARIO(ID),
	Fecha date not null,
	ID_FormPago smallint not null foreign key references TIPO_DE_PAGO(ID),
	Importe money not null
)
/*create table PAGOS
(
	ID smallint not null primary key identity (1,1),
	ID_factura smallint not null foreign key references FACTURA(ID),
	ID_tipoPago smallint not null foreign key references TIPO_DE_PAGO(ID),
	Importe money not null check (Importe > 0)
)*/
go 
create table HISTORIAL(
	ID smallint not null primary key identity (1,1),
	Fecha date,
	Codigo varchar(50),
	Descripcion varchar(100),
	UsuarioNombre varchar(100)
)


create table PedidosRechazados(
IDPedido smallint not null,
Motivo varchar(60),
Mensaje varchar(1000)
)
