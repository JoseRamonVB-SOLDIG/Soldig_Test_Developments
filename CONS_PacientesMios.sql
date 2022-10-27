
alter proc CONS_PacientesMios(
			@idMedico int
			)		

as 
set nocount on 
declare @quantity int
set @quantity = 0
if EXISTS(Select * from Medico  where idMedico = @idMedico)
begin
    select @quantity = COUNT(*) from TurnoPaciente where idMedico=@idMedico
	if(@quantity > 0 )
		Select distinct * from Paciente where idPaciente = (Select idPaciente from TurnoPaciente where idMedico = @idMedico)
	else 
		print 'Por el momento no cuenta con pacientes' 
end
else
	print 'Medico no identificado, favor de corroborar sus datos'

/*
	exec CONS_PacientesMios 2129
*/