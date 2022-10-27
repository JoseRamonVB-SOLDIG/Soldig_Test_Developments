/*
	Es un desencadenador de un evento.
	Eventos:
		- INSERT
		- UPDATE
		- DELETE
	en relacion a esa infromacion actualizada podremos tomar acciones: registro de logs, cargar datos en otra tabla, emitir alertas, mandar mails
	etc. Pero en si monitorea los cambios que se hagan para poder tomar desiciones con respecto a lo modificado.
*/


-- Ejemplo para guardar log si el paciente que se ingresa es Mexico 

create trigger PacientesCreados on Paciente --(el on determina sobre que tabla se hace el nuevo insert)
after insert --(determina que se dispare inmediatamente despues de un insert)
as

if(select idPais from inserted) = 'MEX' --Inserted: refiere el ultimo registro hecho en la tabla
	insert into PacientesLog (idPaciente, idPais, fechaAlta)
		select i.idPaciente, i.idPais, getdate() from inserted i