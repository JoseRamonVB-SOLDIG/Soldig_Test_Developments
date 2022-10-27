exec DEL_Turno 3
/*
select * from Turno
Select * from TurnoPaciente
*/
alter proc DEL_Turno(
				@idTruno turno)
as
set nocount on

if exists (select * from Turno where idTurno = @idTruno)
begin 
		DELETE from Turno where idTurno = @idTruno
		DELETE from TurnoPaciente where idTurno = @idTruno
end
else
	select 0 as resultado