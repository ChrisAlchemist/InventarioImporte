use BANCA
go


if exists (
			SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'FN_BANCA_DESCIFRAR'
                    AND Routine_Type = 'FUNCTION'
			)
	DROP FUNCTION [dbo].[FN_BANCA_DESCIFRAR]
GO

CREATE FUNCTION dbo.FN_BANCA_DESCIFRAR(@texto_a_descifrar VARBINARY(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
   DECLARE @CADENA_DESCIFRADA VARCHAR(MAX)
   SELECT @CADENA_DESCIFRADA =  DECRYPTBYPASSPHRASE( 'LLAVE',@texto_a_descifrar) 
RETURN @CADENA_DESCIFRADA
END
GO

GRANT EXECUTE ON FN_BANCA_DESCIFRAR TO PUBLIC