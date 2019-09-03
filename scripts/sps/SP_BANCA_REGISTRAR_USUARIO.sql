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
Proyecto		Banca/Poliza de diario (Actualizado)
Ticket			ticket

*/

if exists (select * from sysobjects where name like 'SP_BANCA_REGISTRAR_USUARIO' and xtype = 'p')
	drop proc SP_BANCA_REGISTRAR_USUARIO
go

create proc

	[dbo].[SP_BANCA_REGISTRAR_USUARIO]
	
		-- parametros		
		--num_usuario, 
		--usuario, 
		@nombreUsuario varchar(max),
		@contrasena varchar(max),
		@correo varchar(max),
		@telCelular varchar(max),
		@idTipoUsuario int,
		@idDeSucursal int
		
as

	begin -- procedimiento
		
		begin try -- try principal
		
			begin -- inicio

				-- declaraciones
				declare @estatus int = 1,
						@error_message varchar(255) = '',
						@error_line varchar(255) = '',
						@error_severity varchar(255) = '',
						@error_procedure varchar(255) = '',
						@fecha datetime = getdate(),
						@usuario varchar(max) = '',
						@numeroUsuario int		
						 
						
					
			end -- inicio
			
			
			
			begin -- ámbito de la actualización
			if not exists 
			(
				select 
					1 
				from 
					tbl_banca_usuarios 
				where 
					nombre_usuario = @nombreUsuario 
				and 
					correo = @correo 
				and 
					tel_celular = @telCelular
			)
			BEGIN
				 SELECT @numeroUsuario= MAX(num_usuario) + 1 FROM TBL_BANCA_USUARIOS
				
				if(@idTipoUsuario = 2)
					begin
						select @usuario = CONCAT('ADMIN_', @idDeSucursal, '_', @numeroUsuario)
					end
				else if(@idTipoUsuario = 3)
					begin
						select @usuario = CONCAT('AGEN_', @idDeSucursal, '_', @numeroUsuario)
					end


				INSERT INTO TBL_BANCA_USUARIOS 
				(
					num_usuario, 
					usuario, 
					nombre_usuario,
					contrasena,
					correo,
					tel_celular,
					id_tipo_usuario,
					id_de_sucursal,
					fecha_alta
				 ) 
				 VALUES
				 (
					@numeroUsuario,
					@usuario,
					@nombreUsuario,
				 	ImporteInventario.dbo.FN_BANCA_CIFRAR_CONTRASENA(@contrasena),
					@correo,
					@telCelular,
					@idTipoUsuario,
					@idDeSucursal,
					GETDATE()
				 )

				 
				select 
					@estatus ESTATUS, 
					*
				from 
					tbl_banca_usuarios 
					where num_usuario = @numeroUsuario
			
				END
				ELSE
				BEGIN
				select @estatus = 0
				select 
					@estatus as estatus,
					'El usuario ya existe' as mensaje
				END
			
			end -- ámbito de la actualización

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
				
		end -- reporte de estatus
		
	end -- procedimiento
	go

	grant exec on SP_BANCA_REGISTRAR_USUARIO to public
	go