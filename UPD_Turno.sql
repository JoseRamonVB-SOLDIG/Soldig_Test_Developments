/*
select * from Turno
select * from TurnoPaciente
select * from TurnoEstado
*/
exec UPD_Turno 4,2,'El paciente llamo para cancelar el turno'
go 

-- se puede actualizar el estado, la observacion
alter proc UPD_Turno(
				@idTurno turno,
				@estado tinyint,
				@observacion observacion)
as
set nocount on

if exists(select * from Turno where idTurno = @idTurno)
begin
		UPDATE turno SET estado = @estado,
						observacion = @observacion
		where idTurno = @idTurno
end

else
	Select 0 as resultado
