use TP_FINAL
go
create trigger TR_ArticuloInsert
on ARTICULOS for insert  as
set nocount on -- El mensaje 1 row affected esta oculto para el trigger
declare @CodigoProducto varchar (50)
select @CodigoProducto = Codigo from inserted
insert into HISTORIAL values (getdate(),@CodigoProducto,'Registro nuevo', SYSTEM_USER) 
go
create trigger TR_UsuarioInsert
on USUARIO after insert as
set nocount on
declare @IdUsuario smallint 
select @IdUsuario = ID from inserted
insert into DATOS_PERSONALES values--(Idusuario,Nombre,Apellido,Dni,Direccion,IdProvincia,IdGenero,Telefono,FechaNac)
-- 
