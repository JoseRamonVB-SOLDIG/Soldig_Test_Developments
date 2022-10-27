--Sentencia CREATE:
--creando un tipo de dato de usuario
create type pais from char(3)
go
-- creando funcion
--select dbo.nombreFun (256)
go

create function nombreFun(@var int)
returns int
as
begin
	set @var = @var * 5
	return @var
end
go

--Sentencia ALTER: modificar la estructura de una tabla tambien
alter table Paciente add estado smallint -- agregar compo estado a la tabla paciente.
alter table Paciente alter column estado bit -- si ya existe el campo y se quiere cambiar el tipo de dato se hace lo siguiente.
alter table Paciente drop column estado --eliminar un campo no deseado.
go

--Sentencia DROP: aliminar una tabla o base de datos completamente
create table ejemplo (campo int, campo2 int)
drop table ejemplo
--drop database ejemplo 
go 

-- Sentencia TRUNCATE: elimina por completo los registros de una tabla y resetea los valores de campos identity
create table ejemplo (campo0 int IDENTITY (1,1), campo1 int, campo2 int)
select * from ejemplo
insert into ejemplo values (2,3)

truncate table ejemplo
go
