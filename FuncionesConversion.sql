-- LEFT Y RIGHT: para variables varchar o var y determinan una cierta cadena de caracteres de la cadena completa
declare @var1 varchar(20)
set @var1 = 'Ramiro'
print LEFT(@var1,2) -- el resultado es 'Ra'
print Right(@var1,2) -- el resultado es 'ro'
go

declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = 'Ramiro'
set @var2 = 'Gonzales'
print LEFT(@var1,1) + LEFT(@var2,1) -- el resultado es 'RG'
go  

-- LEN: contar la cantidad de caracteres de una variable de tipo chat o varchar
declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = 'Ramiro'
set @var2 = 'Gonzales'
print LEN(@var1)
print LEN(@var2)
print LEN(@var1) + LEN(@var2)
print LEFT(@var2, LEN(@var2)-1)
go

--UPPER Y LOWER: permiten formatear vareables de tipo texto o campos de una tabla (minusculas o mayusculas)
declare @var1 varchar(20)
declare @var2 varchar(20)
declare @var3 varchar(20)
set @var1 = 'Ramiro'
set @var2 = 'Gonzales'
set @var3 = 'SEBASTIAN'
print LOWER(@var1) + ' ' + LOWER(@var2)
print UPPER(@var1) + ' ' + UPPER(@var2)
print UPPER(LEFT(@var3,1)) + LOWER(RIGHT(@var3,LEN(@var3)-1))
go

--REPLACE: remplaza un caracter por otro en una variable de tipo string o en el campo de una tabla
declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = 'Ramir"o'
set @var2 = 'Gonz@ales'
-- entradas: variable o campo, caracter a remplazar, caracter de remplazo
select REPLACE(@var1,'"','')
select REPLACE(@var2,'@','')
go  

-- REPLICATE repetir un caracter o cadena de caracteres cuentas veces queramos
declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = 'Ramiro '
set @var2 = 'Gonzales '
-- entradas: variable o campo, cantidad de veces a repetir
print REPLICATE(@var1,5)
print REPLICATE(@var2,5)
go  

--LTRIM y RTRIM: permiten eliminar los espacios en una cadena de caracteres ya sea izquerda o derecha
-- prevenir que un valor de una tabla o en un stored procedures no lleve espacios vacios, siempre debe limpierse
declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = '    Ramiro       '
set @var2 = '    Gonzales     '
print @var1 + @var2+'¨*'
print LTRIM(RTRIM(@var1)) +' '+ LTRIM(RTRIM(@var2)) + '¨*'
go  

--CONCACT: concatenamos dos valores diferentes
declare @var1 varchar(20)
declare @var2 varchar(20)
set @var1 = '    Ramiro       '
set @var2 = '    Gonzales     '
print @var1 + @var2+'¨*'
print CONCAT(LTRIM(RTRIM(@var1)),' ',LTRIM(RTRIM(@var2))) -- No hay limite de parametros para la funcion
go  

--GETDATE y GATEDATEUTC: para casos de querer alamacenar la fecha y la hora en la que el registro ha sido creado
select GETDAtE()
select GETUTCDATE() -- hora definida por el meriadiano
go

--DATEADD: agregar a una fecha intervalos ya sea (meses, dias, años, horas, minutos y segundos)
-- entradas: parametro a agregar, cantidad de agregamiento(positivo o negativo), fecha a modificar
print DATEADD(day,2,getdate())
print DATEADD(year,4,getdate())
-- equivalentes
print DATEADD(dd,2,getdate())
print DATEADD(yy,4,getdate())
print DATEADD(mm,4,getdate()) -- mes
print DATEADD(mi,4,getdate()) -- minutos
go

--DATEDIFF: diferencia entre dos fechas segun el intervalo que se especifique
--entradas: intervalo, los dos siguentes son las fechas en la que se quiere calcular la diferencia

print DATEDIFF(year, getdate(), '20170120')
print DATEDIFF(year,'20170120', getdate())
print DATEDIFF(month,'20170120', getdate())
go

--DATEPART: obtener un intervalo especifico de una fecha
print DATEPART(month,getdate()) -- regresa mes del año
print DATEPART(year,getdate()) -- regersa el año
print DATEPART(dw,getdate()) -- regresa dia de la semana
print DATEPART(day,getdate()) -- regresa dia del mes
go
--ISDATE: evalua si una fecha especifica tiene el formato correcto o no

print ISDATE(getdate()) -- regesa 1 por true en el formato
print ISDATE('uwbdiqwd')-- regresa 0 por no contener un formato de fecha
print ISDATE('20190131')-- regesa 1 por true en el formato
print ISDATE('20190135')-- regresa 0 por tener el formato pero enero no puede tener 35 dias
go

if ISDATE('20190131') = 1
	print 'es una fecha correcta'
else
	print 'es una fecha incorrecta'
go

-- funciones de conversion de tipo de datos(CAST:funcion generica que convierte tipo de dato en otro siempre y
--cuando sea del mismo genero (int to smallint) y CONVERT: implementacion de cast con parametros que permiten convertir
--con mas detalle)

declare @numero money
set @numero = 500.40
print @numero
select CAST(@numero as int) as numero -- no cambia la variable pero castea el valor en el momento para visualizacion.
go

select CAST(idPaciente as money) from Paciente
go

-- en CONVERT si se puede utilizar print
declare @numero money
set @numero = 500.40
-- entredas: veriable a convertir, parametro de conversion
select CONVERT(int, @numero)
go

declare @fecha datetime
set @fecha = getdate()
print @fecha

print CONVERT(char(20), @fecha,112)--tercer parametro sive para especificar dentro de ese tipo de dato que fromato devolver
print CONVERT(char(20), @fecha,104)
print CONVERT(char(20), @fecha,111)
-- todos los formatos para fechas archivo: S15-FormatosFecha