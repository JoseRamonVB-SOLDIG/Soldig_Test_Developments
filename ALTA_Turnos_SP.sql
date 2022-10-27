--select * from Turno
--select * from Paciente
--select * from TurnoPaciente
--select * from Medico
--select * from TurnoEstado
--select * from HistoriaPaciente
--select * from Historia
--select * from Pais
--insert into Medico values ('Vicente','Gomez')
--insert into Pais values ('PRT','Portugal')
/*
	valor = 0 estado pendiente
	valor = 1 estado completado
	valor = 2 estado cancelado
*/
--exec ALTA_Turnos_SP '20190215 08:15',7,2,'El paciente tiene que estar en ayunas'
alter proc ALTA_Turnos_SP(
			@fecha char(14),-- EX: '20180315 12:00' 15 de marzo de 2018
			@idpaciente paciente,
			@idmedico medico,
			@observacion observacion = ''
			)
as

set nocount on
if NOT EXISTS (select TOP 1 idTurno from Turno where fechaTurno=@fecha)
begin
	 insert into turno (fechaTurno,estado,observacion)
	 values(@fecha,0,@observacion)

	 declare @auxIdTurno  turno
	 set @auxIdTurno = @@IDENTITY
	 insert into TurnoPaciente(idTurno,idPaciente,idMedico)
	 values (@auxIdTurno,@idpaciente,@idmedico)
	 print 'El turno se agrego correctamente.'
	 return
end
else 
begin
	if NOT EXISTS(select TOP 1 idTurno from TurnoPaciente where idMedico=@idmedico and idPaciente= @idpaciente)
	begin
		insert into turno (fechaTurno,estado,observacion)
		values(@fecha,0,@observacion)

		set @auxIdTurno = @@IDENTITY
		insert into TurnoPaciente(idTurno,idPaciente,idMedico)
		values (@auxIdTurno,@idpaciente,@idmedico)
		print 'El turno se agrego correctamente.'
		return
	end
	else
		print 'El turno ya existe.'
	return
end