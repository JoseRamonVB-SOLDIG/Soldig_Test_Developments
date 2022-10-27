 /*
	una tabla temporal en memoria existe solo mientras el script se este ejecutando
*/

declare  @mitabla table(id int IDENTITY(1,1), pais varchar(50))

insert into @mitabla values ('MEXICO')
insert into @mitabla values ('PERU')
insert into @mitabla values ('ARGENTINA')
insert into @mitabla values ('COLOMBIA')
insert into @mitabla values ('ECUADOR')

select * from @mitabla

 /*
	una tabla temporal fisica existe en nuestra base de datos mientras el servidor este corriendo y se puede consultar mientras este 
	este corriendo. Cuando se reinicie, esta ya no existira
*/

create table #mitabla(id int IDENTITY(1,1), nombre varchar(50), apellido varchar(50)) --el numeral antes del nombre in dica que es temporal fisica

insert into #mitabla values ('Alejandro','Lopez')
insert into #mitabla values ('Rafael','Castillo')
insert into #mitabla values ('Fernando','Gonzalez')
select * from #mitabla

drop table #mitabla -- en caso de querer borrarla mientras el servidor corre