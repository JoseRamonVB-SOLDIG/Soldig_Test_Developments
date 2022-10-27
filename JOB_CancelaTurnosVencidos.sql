

/*
	select * from Turno
	select * from TurnoEstado
*/
update turno set estado = 2 where convert(char(8),fechaTurno,112) < convert(char(8),getdate(),112)
and estado  = 0