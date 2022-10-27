exec SEL_TurnosPaciente 7
go

alter proc SEL_TurnosPaciente(
					@idPaciente paciente
					)

as
set nocount on
--insert into MedicoEspecialidad (idMedico,idEspecialidad,descripcion) values(2,12,'')
--select * from turno
--select * from TurnoPaciente
--select * from MedicoEspecialidad 
--select * from Especialidad
--select * from Paciente
if exists(select * from Paciente P
			inner join TurnoPaciente TP
			on TP.idPaciente = P.idPaciente
			inner join Turno T
			on T.idTurno = TP.idTurno
			inner join MedicoEspecialidad M
			on M.idMedico = TP.idMedico
			where P.idPaciente = @idPaciente)
	select * from Paciente P
	inner join TurnoPaciente TP
	on TP.idPaciente = P.idPaciente
	inner join Turno T
	on T.idTurno = TP.idTurno
	inner join MedicoEspecialidad M
	on M.idMedico = TP.idMedico
	where P.idPaciente = @idPaciente --Condicion principal
else
	select 0 as resultado

