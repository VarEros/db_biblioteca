DECLARE @resultado NVARCHAR(20);
DECLARE @msgError NVARCHAR(100);

EXEC PR_CU_LIBRO @idLibro = NULL, @titulo = 'El principito', @autor = 'Antoine de Saint-Exupéry', @anio_edicion = 1943, @genero = 'Ficción', @resultado = @resultado OUTPUT, @msgError = @msgError OUTPUT;

PRINT @resultado;
PRINT @msgError;