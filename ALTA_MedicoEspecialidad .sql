

alter proc ALTA_MedicoEspecialidad (
			@idMedico int,
			@idEspecialidad int,
			@descripcion varchar(1000)
			)
as
set nocount on

insert into MedicoEspecialidad (idMedico,idEspecialidad,descripcion) values (@idMedico,@idEspecialidad,'')