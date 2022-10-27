
exec UPD_Pacientes 7,'2324324','20000410','Pase del Alamo', '2223546798', 'jorge.lpz@outlook.com','se le debe comunicar que dia estaran sus estudios'

--select * from Paciente


alter proc UPD_Pacientes(
				@idPaciente paciente,
				@dni varchar(20),
				@fechaNacimiento date,
				@domicilio varchar(50),
				@telefono varchar(20),
				@email varchar(30),
				@observacion observacion
				)
as
set nocount on

if exists(select * from Paciente where idPaciente = @idPaciente)
begin
		UPDATE Paciente set dni = @dni,
		                    fNacimiento = @fechaNacimiento,
							domicilio = @domicilio,
							telefono = @telefono,
							email = @email,
							observacion = @observacion
		where idPaciente = @idPaciente
end
else
	select 0 as resultado