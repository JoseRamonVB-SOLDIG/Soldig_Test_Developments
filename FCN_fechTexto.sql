-- print dbo.FCN_fechaTexto('20190102')

alter function FCN_fechaTexto(@fecha datetime)
returns varchar(60)
as

begin
declare @dia varchar(20)
declare @mes varchar(20)
declare @fechaTexto varchar(50)
set @dia = (case when datepart (dw,@fecha) = 1 then 'Domingo ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 2 then 'Lunes ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 3 then 'Martes ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 4 then 'Miercoles ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 5 then 'Jueves ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 6 then 'Viernes ' + convert(char(2),datepart (dd,@fecha))
				when datepart (dw,@fecha) = 7 then 'Sabado ' + convert(char(2),datepart (dd,@fecha))
			end)
set @mes = (case when datepart (mm,@fecha) = 1 then 'Enero'
				when datepart (mm,@fecha) = 2 then 'Febrero'
				when datepart (mm,@fecha) = 3 then 'Marzo'
				when datepart (mm,@fecha) = 4 then 'Abril'
				when datepart (mm,@fecha) = 5 then 'Mayo'
				when datepart (mm,@fecha) = 6 then 'Junio'
				when datepart (mm,@fecha) = 7 then 'Julio'
				when datepart (mm,@fecha) = 8 then 'Agosto'
				when datepart (mm,@fecha) = 9 then 'Septiembre'
				when datepart (mm,@fecha) = 10 then 'Octubre'
				when datepart (mm,@fecha) = 11 then 'Noviembre'
				when datepart (mm,@fecha) = 12 then 'Diciembre'
			end)
set @fechaTexto = @dia + ' de ' + @mes
return @fechaTexto

end