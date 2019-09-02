if exists (select * from sysdatabases where (name = 'ImporteInventario'))
begin
	drop database ImporteInventario
end

create database ImporteInventario

go
