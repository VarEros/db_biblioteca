USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_U_LIBRO_REGRESADO]    Script Date: 19/04/2024 19:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_U_LIBRO_REGRESADO]
(
  @idLibro INT,
  @resultado NVARCHAR(20) OUTPUT,
  @msgError NVARCHAR(100) OUTPUT
)
AS
BEGIN
	DECLARE @idPersona INT;
	SELECT
		@idPersona = id_persona
	FROM TBL_LIBRO
	WHERE @idLibro = id_libro;

	-- Actualizar registro existente
	UPDATE TBL_LIBRO
	SET
	estado = 1,
	fecha_prestado = null,
	id_persona = null
	WHERE id_libro = @idLibro;

	--Agregar al registro de prestamos & devoluciones
	INSERT INTO TBL_PRE_DEV
		(
			id_libro,
			id_persona,
			fecha,
			tipo
		) 
		VALUES
		(
			@idLibro,
			@idPersona,
			SYSDATETIME(),
			1
		);

	IF @@ROWCOUNT = 0
	BEGIN
	SET @resultado = 'REGISTRO NO ENCONTRADO';
	SET @msgError = 'El ID de libro especificado no existe.';
	END
	ELSE
	BEGIN
	SET @resultado = 'REGISTRO ACTUALIZADO';
	SET @msgError = '';
	END;

END;

