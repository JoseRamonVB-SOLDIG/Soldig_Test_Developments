/*
	select Em.sentencia from ( 
	Select CONCAT(LOWER(substring(nombre,1,1)),substring(nombre,2,LEN(nombre)),'_',apellido) as sentencia from Empleados) Em
	where Em.sentencia not in (select sp.name as login
	from sys.server_principals sp
	left join sys.sql_logins sl
				on sp.principal_id = sl.principal_id 
	where sp.type not in ('G', 'R') and sp.type_desc = 'SQL_LOGIN'  and  sp.is_disabled <> 1 and sp.name <> 'sa')
*/
exec CRT_UserLogs_SP 
go 

alter proc CRT_UserLogs_SP 
as 
set nocount on 

declare @userid varchar(50)
DECLARE cur CURSOR FOR select Em.sentencia from ( 
Select CONCAT(LOWER(substring(nombre,1,1)),substring(nombre,2,LEN(nombre)),'_',REPLACE(apellido,' ','_')) as sentencia from Empleados) Em
where Em.sentencia not in (select sp.name as login
from sys.server_principals sp
left join sys.sql_logins sl
			on sp.principal_id = sl.principal_id 
where sp.type not in ('G', 'R') and sp.type_desc = 'SQL_LOGIN'  and  sp.is_disabled <> 1 and sp.name <> 'sa')
OPEN cur
FETCH NEXT FROM cur INTO @userid
WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC sp_addlogin @userid, 'medicos_123';
    FETCH NEXT FROM cur INTO @userid
END
CLOSE cur    
DEALLOCATE cur 
/*
DECLARE cur CURSOR FOR SELECT Id, Password FROM @temp
OPEN cur
FETCH NEXT FROM cur INTO @id, @pass
WHILE @@FETCH_STATUS = 0 BEGIN
    EXEC mysp @id, @pass ... -- call your sp here
    FETCH NEXT FROM cur INTO @id, @pass
END
CLOSE cur    
DEALLOCATE cur
*/