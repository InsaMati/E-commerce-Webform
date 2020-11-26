use TP_Final
go
CREATE VIEW VW_ListarArticulos as
	select P.ID, P.Codigo,P.Nombre, P.Descripcion, M.Nombre as Marca, C.Nombre as Categoria, P.ImagenUrl,P.Precio,M.ID as IDmarca, C.ID as IDcategoria,P.Estado, P.Stock
	from ARTICULOS P
	inner join MARCA M on m.ID = p.IdMarca
	inner join CATEGORIA C on c.ID = p.IdCategoria

GO

create view VW_Listar_Usuarios as
select U.ID,U.Email, U.Contraseña, U.Estado, TU.ID as IdTipo, TU.Nombre as TipoUsuario from USUARIO as U
inner join TIPO_DE_USUARIO as TU on TU.ID = U.IdTipoUsuario

create view VW_ListarAdmPedidos as
select P.ID,P.ID_CARRITO,P.ID_Estado, P.Fecha, C.Costo_Total [Importe], TP.Descripcion [Forma De Pago]  ,E.Descripcion [Estado] from PEDIDO as P
inner join ESTADO as E on E.ID = P.ID_estado
inner join CARRITO as C on C.ID = P.ID_carrito
inner join FACTURA as F on F.ID = P.ID
inner join TIPO_DE_PAGO as TP on TP.ID = F.ID_FormPago

