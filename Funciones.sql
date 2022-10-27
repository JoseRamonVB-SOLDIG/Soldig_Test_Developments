/* 
	Funciones escalares y de tipo tabla:
	Escalares: permiten recibir uno o mas parametros y devolver un valor de tipo especifico. (realizar calculos o procesos)
	Tabla: recibir uno o mas parametros y con ellos realizar acciones dentro de la funcion, con el fin de retornar una tabla o conjunto de registros
	Para poder revisar las funciones que se tienen se debe ir al siguiente path: Databases/'Nombre de la base'/Programmability/Functions 
*/

-- ESCALAR:

Select dbo.concatenar ('Lopez','Roberto')
go
select dbo.obtenerPais (4)
go


create function concatenar(
				@Apellido varchar(50),
				@Nombre varchar(50)
				)
returns varchar (100)

as
begin
	declare @resultado varchar(100)
	Set @resultado = @Apellido + ', ' + @Nombre
	return @resultado
end
go 

create function obtenerPais(
				@idPaciente paciente
				)
returns varchar(50)

as
begin 
	declare @pais varchar (50)
	set @pais = (select Pa.pais from  Paciente P
				inner join Pais PA
				on PA.idPais = P.idPais
				where idPaciente = @idPaciente)
	return @pais
end
go

-- TABLA:

select * from dbo.listaPaises()
go

create function listaPaises ()
returns @paises TABLE(idPais char(3), Pais varchar(50))
as
begin
	insert into @paises values('ESP','España')
	insert into @paises values('MEX','Mexico')
	insert into @paises values('CHI','Chile')
	insert into @paises values('PER','Perú')
	insert into @paises values('ARG','Argentina')
	return
end

