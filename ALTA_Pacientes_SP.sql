
alter proc ALTA_Pacientes_SP(
			@dni varchar(20),
			@nombre varchar(50),
			@apellido varchar(50),
			@fnacimiento varchar(8), -- EX: '20180315' 15 de marzo de 2018
			@domicilio varchar(50),
			@idpais char(3),
			@tel varchar(20) = '',
			@email varchar(30),
			@observacion observacion = ''
			)
as

if NOT EXISTS (select * from Paciente where dni=@dni)
begin
	 insert into Paciente (dni, nombre, apellido, fnacimiento, domicilio, idPais, telefono, email, observacion)
	 values(@dni,@nombre,@apellido,@fnacimiento,@domicilio,@idpais,@tel,@email,@observacion)
	 print 'El paciente se agrego correctamente.'
	 return
end
else 
begin
	print 'El paciente ya existe.'
	return
end