-- conjunto de instrucciones SQL almacenadas (internamente en el SQL Server) desponible para ejecutarse cuando sea necesario
/*
	PARA REALIZAR ALGO EN ESPECIFICO
	- Generar procesos de incersion de registros:
	- Proceso de borrado de registros:
	- Proceso de actualizacion: 
*/
SET ANSI_NULLS ON -- ON FOR OMITING NULL VALUES | OFF FOR ENABLE QUERING NULL VALUES
GO
SET QUOTED_IDENTIFIER ON -- ON ENABLES THE USAGE OF RESERVED WORDS ON SQL TO BE USABLE IF THEY ARE QUOTED (EX: "SELECT")
GO
ALTER PROC SP_paciente ( -- it can be used ALTER PROC for auto save modifications on the same procedure
			/* Recepcion de parametros*/
			@idPaciente int
)
AS 
/*para declarar variable se usa la palabra reservada DECLERE: objeto en memoria que almacena un valor (nombre precedido con arroba)
DECLARE @ordenamiento CHAR(1) = 'B' -- SET @ordenamiento = 'A' otra forma de inicializarla pero la opcion primeria es en una sola linea
DECLARE @valorOrdenamiento CHAR(1)

SET @valorOrdenamiento =ISNULL(@ordenamiento,'A') -- si el valor es null en este caso imprimiria el valor "A"
PRINT @ordenamiento*/

SELECT apellido, nombre, idPais, observacion, 
	( SELECT pais FROM Pais ps WHERE ps.idPais = pa.idPais) descPais --pa y ps son alias para sus respectivas tablas, descPais es alias de la nueva columna
FROM Paciente pa WHERE idPaciente = @idPaciente

GO -- (divisor terminal de ejecucion) instrucciones por debajo se corren por separado 
