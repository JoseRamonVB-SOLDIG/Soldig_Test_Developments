
-- SUMA +, RESTA -, DIVISION /, MULTIPLICACION * Y MODULO %

DECLARE @num1 decimal(9,2) = 70.6
DECLARE @num2 decimal(9,2) = 30.8
DECLARE @calculation decimal(9,2)


SET @calculation = @num1 % @num2
PRINT @calculation
go

DECLARE @num1 varchar(20) = 'Hola, me llamo'
DECLARE @num2 varchar(20) = 'Joserra'
DECLARE @calculation varchar(40)


SET @calculation = @num1 + ' ' + @num2
PRINT @calculation
go

-- Operadores condicionales  < > = <>

DECLARE @num1 decimal(9,2) = 70.6
DECLARE @num2 decimal(9,2) = 30.8
IF @num1 >= @num2
PRINT'si'
go

DECLARE @tex1 varchar(20) = 'Hola, me llamo'
DECLARE @tex2 varchar(20) = 'Joserra'
IF @tex1 <= @tex2
PRINT 'si: tiene menos caracteres'
go

DECLARE @tex1 varchar(20) = 'Hola, me llamo a'
DECLARE @tex2 varchar(20) = 'Hola, me llamo x'
IF @tex1 < @tex2
PRINT 'si: por orden alfabetico aunque sea de igual tamaño'
go

