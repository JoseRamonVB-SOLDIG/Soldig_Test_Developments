/*
	exec ALTA_Turnos_SP '20210608 07:00',7,2,'Alta definitiva tentativa'
	select * from Medico
	select * from Turno
	select * from TurnoPaciente
	Select * from Paciente
*/

declare @turnos table(id int IDENTITY(1,1), idTurno turno, idPaciente paciente)
declare @idPaciente paciente
set @idPaciente = 7

insert into @turnos (idTurno, idPaciente)
select	TP.idPaciente,P.idPaciente from Paciente P
	inner join TurnoPaciente TP
	on TP.idPaciente = P.idPaciente
--select * from @turnos

declare @i int, @total int
set @i = 1
set @total = (select count(*) from @turnos)
while @i<= @total
begin
	if(select idPaciente from @turnos where id = @i) <> 7--<> distinto de valor
		delete from @turnos where id = @i
	set @i = @i + 1
end
select * from Paciente P
	inner join @turnos T
	on T.idPaciente = P.idPaciente

