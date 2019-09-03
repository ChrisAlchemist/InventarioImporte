use ImporteInventario
go


if exists (
			SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'FN_BANCA_CIFRAR_CONTRASENA'
                    AND Routine_Type = 'FUNCTION'
			)
	DROP FUNCTION [dbo].[FN_BANCA_CIFRAR_CONTRASENA]
GO

CREATE FUNCTION dbo.FN_BANCA_CIFRAR_CONTRASENA(@texto_a_cifrar VARCHAR(max))
RETURNS VARBINARY(MAX)
AS
BEGIN
   DECLARE @CADENA_CIFRADA VARBINARY(MAX)
   SELECT @CADENA_CIFRADA =  ENCRYPTBYPASSPHRASE( 'LLAVE',@texto_a_cifrar) 
RETURN @CADENA_CIFRADA
END
GO

GRANT EXECUTE ON FN_BANCA_CIFRAR_CONTRASENA TO PUBLIC