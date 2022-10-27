--select * from Medico
--select * from MedicoEspecialidad
--select * from Especialidad

--EXEC alta_especialidad 'DERMATOLOGÍA' 

alter proc ALTA_Especialidades_SP(
			@especialidad varchar(30)
			)
as

set nocount on
if NOT EXISTS (select TOP 1 idEspecialidad from Especialidad where especialidad=@especialidad)
begin
	 insert into Especialidad(especialidad)
	 values(@especialidad)
	 print 'La especialidad se agrego correctamente.'
	 return
end
else 
begin
	print 'La especialidad ya existe.'
	return
end