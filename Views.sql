use TP_Final
go
CREATE VIEW VW_ListarArticulos as
	select P.ID, P.Codigo,P.Nombre, P.Descripcion, M.Nombre as Marca, C.Nombre as Categoria, P.ImagenUrl,P.Precio,M.ID as IDmarca, C.ID as IDcategoria,P.Estado, P.Stock
	from ARTICULOS P
	inner join MARCA M on m.ID = p.IdMarca
	inner join CATEGORIA C on c.ID = p.IdCategoria
