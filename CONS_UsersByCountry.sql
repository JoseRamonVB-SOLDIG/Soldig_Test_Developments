create proc CONS_UsersByCountry
as
set nocount on

Select * from (select idPais, COUNT(idPais) as Clients from Paciente
group by idPais
having (COUNT(idPais)>0))pa
INNER JOIN Pais P
on P.idPais = pa.idPais 
order by pa.idPais
