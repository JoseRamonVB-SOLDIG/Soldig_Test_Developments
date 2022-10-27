
-- exec CONS_TurnosCancelados

create proc CONS_TurnosCancelados

as
set nocount on 

Select * from turno where estado = 2
