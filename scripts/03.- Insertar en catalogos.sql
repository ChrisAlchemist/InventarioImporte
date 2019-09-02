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


select * from cat_banca_tipos_usuario