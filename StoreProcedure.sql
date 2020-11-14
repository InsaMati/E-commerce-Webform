use TP_FINAL

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
-- AGREGAR USUARIO
create procedure SP_AgregarUsuario(
@Email varchar(100),
@Contraseña varchar(50),
@IdTipoUsuario smallint
) AS
BEGIN TRY
	INSERT INTO USUARIO (Email,Contraseña,IdTipoUsuario,Estado)
	VALUES (@Email,@Contraseña,@IdTipoUsuario,1)
END TRY
BEGIN CATCH
	RAISERROR('ERROR AL CARGAR UN USUARIO',16,1)
END CATCH