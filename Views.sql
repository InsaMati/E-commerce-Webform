use TP_Final
go
CREATE VIEW VW_ListarArticulos as
	select P.ID, P.Codigo,P.Nombre, P.Descripcion, M.Nombre as Marca, C.Nombre as Categoria, P.ImagenUrl,P.Precio,M.ID as IDmarca, C.ID as IDcategoria,P.Estado, P.Stock
	from ARTICULOS P
	inner join MARCA M on m.ID = p.IdMarca
	inner join CATEGORIA C on c.ID = p.IdCategoria


create view VW_Listar_Usuarios as
select U.ID,U.Email, U.Contraseña, U.Estado, TU.ID as IdTipo, TU.Nombre as TipoUsuario from USUARIO as U
inner join TIPO_DE_USUARIO as TU on TU.ID = U.IdTipoUsuario




