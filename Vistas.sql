
/*
	Almacena una consulta especifica en la base de datos localemnete. y cuando se ejecuta siempre se actualiza.
	Sin embargo, al utilizar las vistas esta se guarda en la base de datos y siempre se hara de forma mas eficiente
	select * from Turno
	select * from TurnoPaciente
	Select * from Paciente
*/

--Probando la vista:
select * from PacientesTurnosPendientes

create view PacientesTurnosPendientes as

select P.idPaciente,P.nombre,P.apellido,T.idTurno,T.estado from Paciente P
	inner join TurnoPaciente TP 
	on TP.idPaciente = P.idPaciente
	inner join Turno T
	on T.idTurno = TP.idTurno

where isnull(T.estado,0) = 0
