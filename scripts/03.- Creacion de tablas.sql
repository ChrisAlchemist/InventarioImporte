use ImporteInventario

IF NOT EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'tbl_banca_usuarios')
begin
	create table 
		tbl_banca_usuarios 
		(
			id_usuario int IDENTITY, 
			num_usuario int, 
			usuario varchar(max), 
			nombre_usuario varchar(max),
			contrasena varbinary(max),
			id_tipo_usuario int,
			id_de_sucursal int,
			fecha_alta datetime
		)
end
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'cat_banca_tipos_usuario')
begin
	create table 
		cat_banca_tipos_usuario
		(
			id_tipo_usuario int IDENTITY,
			descripcion varchar(max)
		)
end

--drop table cat_banca_tipos_usuario

--DROP TABLE tbl_banca_usuarios