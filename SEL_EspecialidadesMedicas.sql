exec SEL_EspecialidadesMedicas
go

create proc SEL_EspecialidadesMedicas --Sin parametro por que es para obtener todas las especialidades
as
set nocount on

if exists(select * from Especialidad)
	select * from Especialidad
else
	print'No hay especialidades'
	select 0 as resultado