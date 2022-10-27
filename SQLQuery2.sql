
/* Seccion de transacciones: aplicacion de la estructura de transaciones para un scrip especifico o incluirla dentro de un 
	strored prcedure.
	permite ejecutar un blocue de transacion , validarla y si se realizan los procedimientos deseados se ejecuta un commit
	o ejecutar rollback es decir cancelarla
*/

-- estructura de transacciones: se utiliza para evaluar una porcion de codigo en la que estamos actualizando o borrando datos
--(DELETES, UPDATES y INSERTS) todo lo que tenga que ver con la manipulacion de datos. cuando uno obtiene resultados no deseados 
--puede ejecutar una transaccion para poder validarla, es decir, si no estamos seguros que sucedio lo que esperabamos lo corremos en 
--una transaccion y asi no afectamos nuestro sistema.

select * from paciente
go

BEGIN TRAN 
	UPDATE Paciente set telefono = 2221765698 where idPaciente =5 --actualizamos telefono del paciente 5
	--Cuando se incia una trasaccion los comandos que sigan despues hacen que la tabla utilizada quede bloqueada hasta que se 
	--corra un comit o rollback. porque cuando la inciemos inmediatamente esta esperando el comit o rollback, en caso de no hacerlo
	--vamos atener bloqueo y ningun usuario podra acceder a ella.
if @@ROWCOUNT = 1  --CUANTOS REGISTROS FUERON  ACTUALIZADOS EN LA INSTRUCCION ANTERIOR
	commit TRAN
else
	rollback TRAN
go

BEGIN TRAN 
	UPDATE Paciente set telefono = 2221763778 where apellido = 'Arteaga'
if @@ROWCOUNT = 1 
	commit TRAN
else
	rollback TRAN 
	/* Corre el rollback ya que estamos especificando que se haga la modificacion si solo se afecta una row
	   pero como existen tres pacientes con el apellido Arteaga el rowcount no es 1 y entra la condicion else  
	*/
go

