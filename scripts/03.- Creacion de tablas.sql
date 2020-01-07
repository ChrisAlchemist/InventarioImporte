use ImporteInventario
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'TBL_IMPORTES_USUARIOS')
begin
	create table 
		TBL_IMPORTES_USUARIOS
		(
			ID_USUARIO int IDENTITY, 
			NUM_USUARIO int, 
			USUARIO varchar(max), 
			NOMBRE_USUARIO varchar(max),
			CONTRASENA varbinary(max),
			CORREO varchar(max),
			TEL_CELULAR varchar(max),
			ID_TIPO_USUARIO int,
			ID_DE_SUCURSAL int,
			FECHA_ALTA datetime
		)
end
go

IF NOT EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'CAT_INVENTARIO_TIPOS_USUARIOS')
begin
	create table 
		CAT_INVENTARIO_TIPOS_USUARIOS
		(
			ID_TIPO_USUARIO int IDENTITY,
			DESCRIPCION varchar(max)
		)
end

--drop table cat_banca_tipos_usuario

--DROP TABLE tbl_banca_usuarios