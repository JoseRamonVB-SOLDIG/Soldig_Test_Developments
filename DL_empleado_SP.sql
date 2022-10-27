alter proc DEL_Empleado(
		@id int,
		@area int
		)
as 

if EXISTS (select * from Empleados where idSistema=@id and idArea=@area)
begin 
	if(@id=1)
	begin
		DELETE FROM turno where idTurno IN
		(SELECT q.idTurno From Turno q
			INNER JOIN TurnoPaciente u on ( u.idTurno = q.idTurno)
		WHERE(u.idMedico = @id));
		DELETE FROM TurnoPaciente Where idMedico = @id;
		DELETE FROM Medico where idMedico = @id;
		DELETE FROM Empleados where idSistema = @id;
	end
	if(@id=2)
	begin
		print 'No Habilidato'
	end
	if(@id=3)
	begin
		print 'No Habilidato'
	end
	if(@id=4)
	begin
		print 'No Habilidato'
	end
	if(@id=5)
	begin
		print 'No Habilidato'
	end
	if(@id=6)
	begin
		print 'No Habilidato'
	end

end
else
begin
	print 'No se identifico el empleado.'
	return
end