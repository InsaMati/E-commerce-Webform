use TP_FINAL
go

create trigger TR_ArticuloInsert
on ARTICULOS for insert  as
begin
	declare @CodigoProducto varchar (50)
	select @CodigoProducto = Codigo from inserted
	insert into HISTORIAL values (getdate(),@CodigoProducto,'Registro nuevo', SYSTEM_USER)
end