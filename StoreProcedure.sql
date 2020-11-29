use TP_FINAL

-- LISTAR ARTICULO
-- create procedure SP_Listar

-- AGREGAR ARTICULO
create procedure SP_Agregar_Articulo(
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
go
-- MODIFICAR ARTICULO
create procedure SP_Modificar_Articulo(
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

-- LISTAR USUARIOS
create procedure SP_ListarUsuarios(@Tipo smallint) as
BEGIN TRY
	SELECT * FROM USUARIO
	WHERE USUARIO.IdTipoUsuario = @Tipo
END TRY
BEGIN CATCH
	RAISERROR('ERROR AL LISTAR ALUMNOS POR TIPO',16,1)
END CATCH
go
-- AGREGAR USUARIO




-- AGREGAR VENTA                 PROTOTIPO MEDIO TRUCHO
create procedure SP_ComprarCarrito(
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

go

create procedure SP_VERIFICAR_USUARIO
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
go

-- AGREGAR USUARIO

create procedure SP_AgregarUsuario(

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

go

-- MODIFICAR USUARIO
create procedure SP_Modificar_Usuario(
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

---------------------- Ventas

create procedure SP_Alta_Carrito(
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

------- ALTA DE PEDIDO

create procedure SP_Alta_Pedido(
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

--------- ALTA DE ELEMENTO CARRITO

create procedure SP_Alta_ElementoCarrito(
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

--------- LISTAR ELEMENTOS POR USUARIO
create procedure SP_Compras_X_Usuario(
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



--------- ALTA DE FACTURA


create procedure SP_Alta_Factura(
   
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


--- LISTAR FACTURAS POR USUARIO

create procedure sp_listar_facturas_por_usuario
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

--- MODIFICAR ESTADO DE PEDIDO

create procedure SP_ModificarEstadoPedido(
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
go

--- AGREGAR DATOS DE ENVIO

create procedure SP_Agregar_DatosEnvio(
   
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

---- BUSCAR PEDIDO

create procedure SP_Ver_Pedido
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

---  LISTAR ARTICULOS POR MARCA
create procedure SP_Listar_x_Marca(
	@Id_Marca smallint
) as
BEGIN TRY
	select * from ARTICULOS where IdMarca = @Id_Marca
END TRY
BEGIN CATCH
	RAISERROR('Error al buscar marca',16,1)
END CATCH
go
---  LISTAR ARTICULOS POR CATEGORIA

create procedure SP_Listar_x_Categoria(
	@Id_Categoria smallint
) as
BEGIN TRY
	select * from ARTICULOS where IdCategoria = @Id_Categoria
END TRY
BEGIN CATCH
	RAISERROR('Error al buscar categoria',16,1)
END CATCH
go

--- LISTAR POR MARCA Y CATEGORIA

create procedure SP_Listar_x_Mar_Cat(
	@Id_Marca smallint,
	@Id_Categoria smallint
) as
BEGIN TRY
	select * from ARTICULOS where IdCategoria = @Id_Categoria and IdMarca = @Id_Marca
END TRY
BEGIN CATCH
	RAISERROR('Error al buscar articulos',16,1)
END CATCH
go

--- LISTAR ARTICULOS CON FILTROS DE MARCA, CATEGORIA Y PRECIO
create procedure SP_ListarConFiltros(
	@Id_Marca smallint,
	@Id_Categoria smallint,
	@PrecioMin money,
	@PrecioMax money	
) as
BEGIN TRY
	select * from ARTICULOS where IdCategoria = @Id_Categoria and IdMarca = @Id_Marca and Precio >= @PrecioMin and Precio <= @PrecioMax
END TRY
BEGIN CATCH
	RAISERROR('Error al buscar articulos',16,1)
END CATCH