alter proc UPD_JefesDePiso(
			@idEspecialidad int,
			@Especialidad varchar(30),
			@idMedico int,
			@Nombre varchar(50),
			@Apellido varchar(50)
			)

as
set nocount on 

if EXISTS( Select * from Medico where idMedico = @idMedico and nombre = @Nombre and apellido = @Apellido)
BEGIN
	if EXISTS(Select * from JefesDePiso where idespecialidad = @idEspecialidad)
	begin
		if EXISTS(Select * from especialidad where idEspecialidad = @idEspecialidad)
			UPDATE JefesDePiso SET idMedico=@idMedico, nombre=@Nombre, apellido=@Apellido where idEspecialidad=@idEspecialidad and especialidad=@Especialidad
		else
			print 'Especialidad no referenciada'
	end
	else
		print'El jefe de piso no puede ser actualizado. falta de referencia'
END
ELSE
begin
	print 'el medico no existe'
	return
end