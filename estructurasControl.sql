-- condicional IF evalua el valor de una variable o consulta y ejecutar acciones con respecto al valor 
DECLARE @idPaciente int
SET @idPaciente = 4

IF @idPaciente = 4
	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
go
--------------------------------------------------------------------------------------------------------
DECLARE @idPaciente int
DECLARE @idTurno int
SET @idPaciente = 4

IF @idPaciente = 4
BEGIN -- begin y end son los limitadores del if, para poder ejecutar todas las operacion, si no contine solo corre la linea de abajo
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
	PRINT @idTurno
END
go
---------------------------------------------------------------------------------------------------------
DECLARE @idPaciente int
DECLARE @idTurno int
SET @idPaciente = 4

IF @idPaciente = 4
BEGIN -- begin y end son los limitadores del if, para poder ejecutar todas las operacion, si no contine solo corre la linea de abajo
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
	PRINT @idTurno
END
ELSE
BEGIN
	PRINT 'no se complio la condicional'
END
go

-- FUNCION EXISTS: EVALUA SI EXISTE UN GRUPO DE REGISTROS DE UNA DETERMINADA CONSULTA
IF EXISTS(SELECT * FROM Paciente WHERE idPaciente = 2)

DECLARE @idPaciente int
DECLARE @idTurno int
SET @idPaciente = 4

IF @idPaciente = 4
BEGIN -- begin y end son los limitadores del if, para poder ejecutar todas las operacion, si no contine solo corre la linea de abajo
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
	PRINT @idTurno
	IF EXISTS(SELECT * FROM Paciente WHERE idPaciente = 4)
		print 'existe'
END
go

-- ESTRUCTURA WHILE: EJECUTA UN BLOQUE DE CODIGO HASTA QUE SE COMPLA UNA CONDICION
DECLARE @contador int=0
WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET	@contador = @contador+1
END
go

-- CONDICIONAL CASE: TOMAR DESICIONES CON RESPECTO AL VALOR DE UNA VARIABLE O UN CAMPO
DECLARE @valor int
DECLARE @resultado char(10) = ''
SET @valor = 20

SET @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
						WHEN @valor = 20 THEN 'VERDE'
						WHEN @valor = 30 THEN 'AZUL'
				END)
print @resultado
go 

SELECT *,(CASE WHEN estado = 1 THEN 'VERDE'
				WHEN estado = 2 THEN 'ROJO'
				WHEN estado = 3 THEN 'AZUL' 
			ELSE 'GRIS'
		END) as colorTurno FROM Turno
go

-- INSTRUCCION RETURN: PERMITE SALIR DE SCRIPT FROZOSAMENTE
DECLARE @contador int=0
WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET	@contador = @contador+1
	IF @contador = 3
		RETURN
		-- sale completamente del script
END
go

DECLARE @contador int=0
WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET	@contador = @contador+1
	IF @contador = 3
		BREAK
END
print 'sigue ejecutando las siguientes instrucciones'
go

-- ESTRUCTURA TRY CATCH: PERMITE EL MANEJO DE ERRORES EN TIEMPO DE EJECUCION
DECLARE @contador int=0
WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET	@contador = @contador+1
	IF @contador = 3
		BREAK
END
print 'sigue ejecutando las siguientes instrucciones'

BEGIN TRY
	SET  @contador = 'texto'
END TRY

BEGIN CATCH
	PRINT 'No es posible asignar texto a una variable int' 
END CATCH