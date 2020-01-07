USE ImporteInventario
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

Autor			Cristian Pérez García
UsuarioRed		pegc837648
Fecha			20190730
Objetivo		Obtiene el desglose de un prestamo que tenga el socio con respecto a un reporte de cmv finanzas
Proyecto		Inventario de importes
Ticket			ticket

*/

if exists (select * from sysobjects where name like 'SP_INVENTARIO_VALIDAR_USUARIO' and xtype = 'p')
	drop proc SP_INVENTARIO_VALIDAR_USUARIO
go

create proc

	[dbo].[SP_INVENTARIO_VALIDAR_USUARIO]
	
		-- parametros		
		--num_usuario, 
		--usuario, 
		@numUsuario int,
		@usuario varchar(max),		
		@contrasena varchar(max)				
		
as

	begin -- procedimiento
		
		begin try -- try principal
		
			begin -- inicio

				-- declaraciones
				declare @estatus int = 200,
						@error_message varchar(255) = '',
						@error_line varchar(255) = '',
						@error_severity varchar(255) = '',
						@error_procedure varchar(255) = ''	,
						@mensaje varchar = ''
						
					
			end -- inicio
			
			if exists (select * from TBL_IMPORTES_USUARIOS where USUARIO = @usuario and NUM_USUARIO = @numUsuario and ImporteInventario.dbo.FN_INVENTARIO_DESCIFRAR_CONTRASENA (CONTRASENA) = @contrasena)
			begin
				select @estatus = 200, @mensaje = 'Los datos de inicio de sesión son correctos'
			end
			else
			begin

				select @estatus = -1, @error_message = 'Alguno de los datos ingresados es incorrecto'
			end
			

		end try -- try principal
		
		begin catch -- catch principal
		
			-- captura del error
			select	@estatus = -error_state(),
					@error_procedure = coalesce(error_procedure(), 'CONSULTA DINÁMICA'),
					@error_line = error_line(),
					@error_message = error_message(),
					@error_severity =
						case error_severity()
							when 11 then 'Error en validación'
							when 12 then 'Error en consulta'
							when 13 then 'Error en actualización'
							else 'Error general'
						end
		
		end catch -- catch principal
		
		begin -- reporte de estatus
			if @error_message<>''
			begin
				select	
					@estatus estatus,
					@error_procedure error_procedure,
					@error_line error_line,
					@error_severity error_severity,
					@error_message error_message
			
			end
			else
			begin
				select 				
					NUM_USUARIO,
					USUARIO,
					NOMBRE_USUARIO,
					CORREO,
					TEL_CELULAR,
					ID_TIPO_USUARIO,
					ID_DE_SUCURSAL					
				from 
					TBL_IMPORTES_USUARIOS 
				where 
					USUARIO = @usuario 
				and 
					NUM_USUARIO = @numUsuario 
			end
				
		end -- reporte de estatus
		
	end -- procedimiento
	go

	grant exec on SP_INVENTARIO_VALIDAR_USUARIO to public
	go