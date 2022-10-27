Select * from Medico
go

alter proc Fill_JefesDePiso(
			@idEspecialidad int,
			@Especialidad varchar(30),
			@idMedico int,
			@Nombre varchar(50),
			@Apellido varchar(50)
			)

as
set nocount on 

if EXISTS( Select * from Medico where idMedico = @idMedico and nombre = @Nombre and apellido = @Apellido)
BEGIN
	if NOT EXISTS(Select * from JefesDePiso where idespecialidad = @idEspecialidad)
	begin
		if EXISTS(Select * from especialidad where idEspecialidad = @idEspecialidad)
			insert into JefesDePiso(idEspecialidad,especialidad,idMedico,nombre,apellido) values (@idEspecialidad,@Especialidad,@idMedico,@Nombre,@Apellido)
	end
	else
		print'la especialidad ya cuenta con jefe de piso. Procedimiento erroneo'
END
ELSE
begin
	print 'el medico no existe'
	return
end

exec Fill_JefesDePiso 3,'Cirugia Plastica',2129,'Patricia','Ovchinnikova '
/*
	exec Fill_JefesDePiso 10,'Neurologia',2107,'Gabriela','Godinez'
	exec Fill_JefesDePiso 2,'Pediatria',2112,'Fernando','de Sevilla'
	exec Fill_JefesDePiso 9,'Infectologia',2114,'Rigoberto','Dadario'
	exec Fill_JefesDePiso 5,'Endoscopia',2116,'Davide','Tregniagui'
	exec Fill_JefesDePiso 8,'Ginecologia',2122,'Lucas','Portillo'
	exec Fill_JefesDePiso 14,'Cirugia General',2128,'Patricia','Forcella'
	exec Fill_JefesDePiso 3,'Cirugia Plastica',2129,'Patricia','Ovchinnikova '
	exec Fill_JefesDePiso 1,'Cardiologia',2131,'Francisca','Faggioni'
	exec Fill_JefesDePiso 12,'Ortopedia',2132,'Daniela','Vasíliev'
	exec Fill_JefesDePiso 6,'Gastroenterologia',2133,'Belen','Argüelles'
	exec Fill_JefesDePiso 11,'Oftalmologia',2134,'Daniel','Bautista'
	exec Fill_JefesDePiso 13,'Otorrinolaringologia',2136,'Victoria','Forcato'
	exec Fill_JefesDePiso 4,'Dermatologia',2144,'Amparo','Portillo'
*/