USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_CU_LIBRO]    Script Date: 19/04/2024 17:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_CU_LIBRO]
(
  @idLibro INT,
  @titulo NVARCHAR(100),
  @autor NVARCHAR(40),
  @anioEdicion NCHAR(4),
  @genero NVARCHAR(20),
  @resultado NVARCHAR(20) OUTPUT,
  @msgError NVARCHAR(100) OUTPUT
)
AS
BEGIN
  DECLARE @codigo NVARCHAR(16);

	IF @idLibro = 0
	BEGIN
	  DECLARE @secuencia INT;

	  SET @secuencia = COALESCE((SELECT MAX(id_libro) + 1 FROM TBL_LIBRO), 1);
	  SET @codigo = LEFT(@titulo, 1) + LEFT(@autor, 1) + @anioEdicion + CAST(@secuencia AS NVARCHAR(10));
	  -- Insertar nuevo registro
	  INSERT INTO TBL_LIBRO
	  (
		titulo,
		autor,
		anio_edicion,
		genero,
		codigo,
		estado
	  )
	  VALUES
	  (
		@titulo,
		@autor,
		@anioEdicion,
		@genero,
		@codigo,
		1
	  );

	  SET @resultado = 'REGISTRO INSERTADO';
	END
	ELSE
	BEGIN
	SET @codigo = LEFT(@titulo, 1) + LEFT(@autor, 1) + @anioEdicion + CAST(@idLibro AS NVARCHAR(10));
	  -- Actualizar registro existente
	  UPDATE TBL_LIBRO
	  SET
		titulo = @titulo,
		autor = @autor,
		anio_edicion = @anioEdicion,
		genero = @genero,
		codigo = @codigo
	  WHERE id_libro = @idLibro;

	  IF @@ROWCOUNT = 0
	  BEGIN
		SET @resultado = 'REGISTRO NO ENCONTRADO';
		SET @msgError = 'El ID de libro especificado no existe.';
	  END
	  ELSE
	  BEGIN
		SET @resultado = 'REGISTRO ACTUALIZADO';
	  END;
	END;

END;

