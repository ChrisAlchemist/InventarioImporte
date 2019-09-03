use ImporteInventario
go

if not exists(select 1 from cat_banca_tipos_usuario where descripcion like 'Administrador de Software')
begin
	insert into cat_banca_tipos_usuario values ('Administrador de Software')
end
go

if not exists(select 1 from cat_banca_tipos_usuario where descripcion like 'Ejecutivo')
begin
	insert into cat_banca_tipos_usuario values ('Ejecutivo')
end
go

if not exists(select 1 from cat_banca_tipos_usuario where descripcion like 'Administrador')
begin
	insert into cat_banca_tipos_usuario values ('Administrador')
end
go

if not exists(select 1 from TBL_BANCA_USUARIOS where id_tipo_usuario = 1)
begin
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
					 4001,
					 'INV_SA',
					 'ADMINISTRADOR DE SOFTWARE',
					 ImporteInventario.dbo.FN_BANCA_CIFRAR_CONTRASENA('SBS_ADMIN_54'),
					 'cristian.perez.garcia.54@gmail.com',
					 '7861021588',
					 1,
					 1,
					 getdate()
					 )
end



--select * from cat_banca_tipos_usuario

select * from tbl_banca_usuarios