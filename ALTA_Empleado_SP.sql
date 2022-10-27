/*
select * from Empleados 
select * from Areas
select * from Medico
Select * from Recepcionista
Select * from Soporte
Select * from Administracion
Select * from Cajero 
select * from MedicoEspecialidad
select * from Especialidad
*/

alter proc ALTA_empleado(
				@nombre varchar(50),
				@apellido varchar(50),
				@idArea int,
				@idEspecialidad int
			)

as 
set nocount on
declare @user  varchar(50)
declare @pass varchar(20)

if NOT EXISTS (select TOP 1 idSistema from Empleados where  nombre=@nombre and apellido=@apellido)
begin 
	if EXISTS (select * from Areas where idArea = @idArea)
	begin
		insert into Empleados(nombre, apellido, idArea)
		values (@nombre, @apellido, @idArea)
		declare @auxIdEmpleado int
		set @auxIdEmpleado = @@IDENTITY
			if (@idArea = 1) 
			begin
				if EXISTS(select * from Especialidad where idEspecialidad = @idEspecialidad)
				begin
					insert into Medico(idMedico,nombre,apellido) values(@auxIdEmpleado,@nombre,@apellido)
					set @user = CONCAT(LOWER(substring(@nombre,1,1)),substring(@nombre,2,LEN(@nombre)),'_',@apellido)
					set @pass = CONCAT(LOWER(substring(@nombre,1,1)),LOWER(substring(@apellido,1,1)),'_medico')
					EXEC sp_addlogin @user, @pass
					if NOT EXISTS(SELECT * FROM sys.database_principals where default_schema_name = 'dbo' and name <> 'dbo')
						EXEC sp_adduser @user, @user, 'medico'; 
				end
			end
			if (@idArea = 2)
			begin
				insert into Cajero(idCajero,nombre,apellido) values(@auxIdEmpleado,@nombre,@apellido)
				set @user = CONCAT(LOWER(substring(@nombre,1,1)),substring(@nombre,2,LEN(@nombre)),'_',@apellido)
				set @pass = CONCAT(LOWER(substring(@nombre,1,1)),LOWER(substring(@apellido,1,1)),'_cajero')
				EXEC sp_addlogin @user, @pass
				if NOT EXISTS(SELECT * FROM sys.database_principals where default_schema_name = 'dbo' and name <> 'dbo')
					EXEC sp_adduser @user, @user, 'cajero'; 
			end
			if (@idArea = 4)
			begin
				insert into Recepcionista (idRecepcionista,nombre,apellido) values(@auxIdEmpleado,@nombre,@apellido)
				set @user = CONCAT(LOWER(substring(@nombre,1,1)),substring(@nombre,2,LEN(@nombre)),'_',@apellido)
				set @pass = CONCAT(LOWER(substring(@nombre,1,1)),LOWER(substring(@apellido,1,1)),'_recepcionista')
				EXEC sp_addlogin @user, @pass
				if NOT EXISTS(SELECT * FROM sys.database_principals where default_schema_name = 'dbo' and name <> 'dbo')
					EXEC sp_adduser @user, @user, 'recepcionista'; 
			end
			if (@idArea = 5) 
			begin
				insert into Soporte(idSoporte,nombre,apellido) values(@auxIdEmpleado,@nombre,@apellido)
				set @user = CONCAT(LOWER(substring(@nombre,1,1)),substring(@nombre,2,LEN(@nombre)),'_',@apellido)
				set @pass = CONCAT(LOWER(substring(@nombre,1,1)),LOWER(substring(@apellido,1,1)),'_soporte')
				EXEC sp_addlogin @user, @pass
				if NOT EXISTS(SELECT * FROM sys.database_principals where default_schema_name = 'dbo' and name <> 'dbo')
					EXEC sp_adduser @user, @user, ''; 
			end
			if (@idArea = 6)
			begin
				insert into Administracion(idAdministracion,nombre,apellido) values(@auxIdEmpleado,@nombre,@apellido)
				set @user = CONCAT(LOWER(substring(@nombre,1,1)),substring(@nombre,2,LEN(@nombre)),'_',@apellido)
				set @pass = CONCAT(LOWER(substring(@nombre,1,1)),LOWER(substring(@apellido,1,1)),'_administracion')
				EXEC sp_addlogin @user, @pass
				if NOT EXISTS(SELECT * FROM sys.database_principals where default_schema_name = 'dbo' and name <> 'dbo')
					EXEC sp_adduser @user, @user, ''; 
			end
	end
end