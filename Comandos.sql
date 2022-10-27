
SELECT * FROM Paciente

SELECT idPaciente, nombre, apellido FROM Paciente

-- comando insert

INSERT INTO Paciente (nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)values ('Emilio','Arteaga','2015-03-20','linda vista 78','ARG','','','')

-- comando update

UPDATE Paciente SET observacion= 'Pacientes creados desde UI'

-- Clausula select: permite filtrar datos

SELECT * FROM Paciente WHERE apellido ='Perez'
SELECT * FROM Paciente WHERE nombre ='Claudio' and apellido ='Lopez'
DELETE FROM  Paciente WHERE nombre ='Claudio' and apellido ='Lopez'
UPDATE Paciente SET  observacion= 'Observación modificada' WHERE nombre ='Claudio' and apellido ='Lopez'

-- Clausula TOP: Selecciona un limite de registros de una tabla
SELECT TOP(2) * FROM Paciente
SELECT TOP(2) * FROM Paciente WHERE apellido ='Perez'
SELECT TOP(1) * FROM Turno ORDER BY fechaTurno DESC --TOP uno con fecha en orden descendente

-- Clausula ordey bay: ordena un conjunto de registros de acuerdo a un campo especificado
SELECT * FROM Paciente ORDER BY fNacimiento DESC
SELECT * FROM Paciente ORDER BY fNacimiento ASC

-- Clausula distinct: 
SELECT DISTINCT (apellido) FROM Paciente
SELECT DISTINCT idPaciente,apellido FROM Paciente -- con mas de un campo no debe llevar apellidos

-- Clausula group by: utilizar funciones de agregado (poder aplicar funciones y tiene un mayor performance)
SELECT apellido FROM Paciente GROUP BY apellido

-- Funciones de agregado (MAX Y MIN)
SELECT MAX(idPaciente) FROM Paciente
SELECT MIN(idPaciente) FROM Paciente
SELECT apellido, MIN(idPaciente) FROM Paciente GROUP BY apellido

-- funcion SUM: suma el total de los campos numericos en relación a ta clasula group by
SELECT SUM(idPaciente) FROM Paciente
SELECT SUM(idPaciente), apellido FROM Paciente GROUP BY apellido

-- funcion AVG: permite calcular un promedio de registros en campo de tipo numerico
SELECT AVG(idPaciente) FROM Paciente

-- funcion COUNT: cunata cantidad de filas
SELECT COUNT(*) FROM paciente
SELECT COUNT(*) FROM Paciente WHERE apellido = 'Perez'

-- funcion HAVING: tabaja en conjunto con la funcion count y la clasula group by (where sombre registro en particular
-- el having filtra los registros en la condicion sobre un conjunto de registros, por eso siempre lleva la clausula
-- group by)
SELECT estado FROM Turno GROUP BY estado HAVING COUNT(estado) = 2 --regresa countos estados tienen unicamente 2 registros

-- OPERADORES LOGICOS:
-- AND: permite concatenar varias condiciones dentro de la condicion where
SELECT * FROM Paciente WHERE apellido='Perez' AND nombre='Roberto' and idPaciente=3
-- OR: permite concatenar varias condiciones dentro de la condicion where
SELECT * FROM Paciente WHERE apellido='Perez' OR apellido='Arteaga' 
-- IN: filtrar por un grupo de valores establecidos por nosotros
SELECT * FROM turno WHERE estado IN (2,1,3)
SELECT * FROM Paciente WHERE apellido IN('Perez','Arteaga')
-- LIKE: trabajar sobre tipos de campo de tipo cadena de caracter, filtrar el resultado por caracter que exista en 
-- el campo
SELECT * FROM Paciente WHERE nombre LIKE 'Roberto' -- por definicion completa.
SELECT * FROM Paciente WHERE nombre LIKE 'Rober%' -- los que contienen rober y mas.
SELECT * FROM Paciente WHERE nombre LIKE '%ober%' -- los que contienen ober con doble limitador.
-- NOT: negar cualquier operador que hayamos ejecutado de los anteriormente descritos
SELECT * FROM Paciente WHERE nombre NOT LIKE '%ober%'
SELECT * FROM Paciente WHERE apellido NOT IN('Perez','Arteaga')
-- BETWEEN: filtrar los registros por un determinado rango (numero o textos)
SELECT * FROM Turno WHERE fechaTurno BETWEEN '20190102' AND '20201212 00:00:00' --AÑO,MES,DIA se puede definir hora para mayor presicion.
SELECT * FROM Paciente WHERE idPaciente BETWEEN 1 and 4

--CALLING A STORED PROCEDURE
EXEC SP_paciente 3 -- 3 representa el parametro, que en este caso es idPaciente.

-- Proceso SP_HELP: nos ayuda obtener el detalle de los objetos que tenemos definidos
sp_help pais
sp_help paciente
sp_help ALTA_Turnos_SP

-- Proceso SP_HELPTEXT: se diferencia por solo recivir stored procedures como parametros (ver todo el contenido almacenado)
sp_helptext ALTA_Turnos_SP


