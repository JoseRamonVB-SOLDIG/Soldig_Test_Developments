exec SEL_HistoriaPaciente 7
go

alter proc SEL_HistoriaPaciente(
				@idPaciente paciente
				)
as
set nocount on
/*
select * from Historia
select * from HistoriaPaciente
*/
if exists (select * from Paciente P
			inner join HistoriaPaciente HP
			on HP.idPaciente = P.idPaciente
			inner join Historia H
			on H.idHistoria = HP.idHistoria
			inner join MedicoEspecialidad ME
			on ME.idMedico = HP.idMedico
			inner join Medico M
			on M.idMedico = ME.idMedico

			where  P.idPaciente = @idPaciente)
begin
	select * from Paciente P
	inner join HistoriaPaciente HP
	on HP.idPaciente = P.idPaciente
	inner join Historia H
	on H.idHistoria = HP.idHistoria
	inner join MedicoEspecialidad ME
	on ME.idMedico = HP.idMedico
	inner join Medico M
	on M.idMedico = ME.idMedico

	where  P.idPaciente = @idPaciente
end
else 
	print 'No existen historias clinicas para el paciente'
	select 0 as resultado