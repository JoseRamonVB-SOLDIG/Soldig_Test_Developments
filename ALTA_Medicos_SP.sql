--select * from Medico
--select * from MedicoEspecialidad
--select * from Especialidad
--exec ALTA_Turnos_SP '20190215 08:15',7,2,'El paciente tiene que estar en ayunas'

alter proc ALTA_Medico_SP(
			@nombre varchar(50),
			@apellido varchar(50),
			@idespecialidad int,
			@descripcion varchar(50) = ''
			)
as

set nocount on
if NOT EXISTS (select TOP 1 idMedico from Medico where nombre=@nombre and apellido=@apellido)
begin
	 insert into Medico(nombre,apellido)
	 values(@nombre,@apellido)
	 declare @auxIdMedico int
	 set @auxIdMedico = @@IDENTITY
	 insert into MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
	 values (@auxIdMedico, @idespecialidad, @descripcion)
	 print 'El Medico se agrego correctamente.'
	 return
end
else 
begin
	print 'El Medico ya existe.'
	return
end