DECLARE @resultado NVARCHAR(20);
EXEC PR_R_INICIO_SESION @usuario = 'erick', @password = 'password', @resultado = @resultado OUTPUT;
PRINT @resultado;