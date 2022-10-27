-- JOINS AND UNIONS
--INNER JOIN: nos permite cruzar tablas por el campo que tengan en comun para obtener un resultado que involucre un resultado mas amplio 

select * from Paciente
select * from TurnoPaciente
go

select * from Paciente P --(alias para referenciar e identificar cada tablaba en este caso P)
INNER JOIN TurnoPaciente T 
on T.idPaciente = P.idPaciente
go

--LEFT JOIN: obtener los registros de la primera tabla con los que coincidan de la seguna 
--todos los que no tengan una correspondencia en la segunda tabla tendran un valor de NULL
select * from Paciente P --(alias para referenciar e identificar cada tablaba en este caso P)
LEFT JOIN TurnoPaciente T 
on T.idPaciente = P.idPaciente
go

--RIGHT JOIN: permite todo lo contrario el left join
select * from Paciente P --(alias para referenciar e identificar cada tablaba en este caso P)
RIGHT JOIN TurnoPaciente T 
on T.idPaciente = P.idPaciente
go

-- PERFORMANCE ENTRE TABLAS
--INNER JOIN: debe asegurarse que en la clausula on se debe hacer la igualdad o cruce con las primary keys.
-- siempre del lado izquierdo el campo que pertenece a la primer tabla conectada con el inner join.
-- siempre se deben utilizar alias a las tablas para facilitar las consultas y evitar ambiguedades.

--UNION: nos permite unir dos resultados de dos consultas diferentes (dos consultas diferentes con la misma cantidad de campos)

select * from turno
UNION
select * from turno
go

select * from turno where estado = 3
UNION 
select * from Turno where estado = 1
go

select idTurno from turno
UNION 
select idPaciente from Paciente
go

--UNION ALL: difiere por no eliminar las repeticiones, en UNION se eliminan los resultados repetidos
select idTurno from turno
UNION ALL
select idPaciente from Paciente
go

