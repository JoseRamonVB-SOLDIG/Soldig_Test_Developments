create proc DEL_Pacientes(
		@id int,
		@dni varchar(20),
	    @nombre varchar(50),
	    @apellido varchar(50)
		)
as 

if EXISTS (select * from Paciente where dni=@dni and nombre=@nombre and apellido=@apellido)
begin
   DELETE FROM TurnoPaciente WHERE idPaciente=@id
   DELETE FROM Paciente WHERE idPaciente=@id and dni=@dni and nombre=@nombre and apellido=@apellido	
end
else 
begin
	print 'No se identifico el paciente.'
	return
end