
create proc CONS_TurnosEspecialidad

as 
set nocount on 

/*
	select * from turnopaciente
	select * from medicoEspecialidad
	select * from especialidad

*/

Select * from (select idMedico, COUNT(idMedico) as NumberoTurno from TurnoPaciente
group by idMedico
having (COUNT(idMedico)>0))m
INNER JOIN MedicoEspecialidad me
on me.idMedico = m.idMedico
order by m.idMedico
