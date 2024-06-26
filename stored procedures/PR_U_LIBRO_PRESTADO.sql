USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_U_LIBRO_PRESTADO]    Script Date: 19/04/2024 19:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_U_LIBRO_PRESTADO]
(
  @nombre NVARCHAR(30),
  @apellido NVARCHAR(30),
  @cedula NCHAR(14),
  @idLibro INT,
  @resultado NVARCHAR(20) OUTPUT,
  @msgError NVARCHAR(100) OUTPUT
)
AS
BEGIN
	DECLARE @cedulaExiste INT;
	DECLARE @estadoPersona INT;
	DECLARE @idPersona INT;

	SELECT 
		@cedulaExiste = COUNT(*)
	FROM TBL_PERSONA
	WHERE cedula = @cedula;

	IF @cedulaExiste = 0
		BEGIN
		INSERT INTO TBL_PERSONA
		(
			nombre,
			apellido,
			cedula,
			estado
		)
		VALUES
		(
			@nombre,
			@apellido,
			@cedula,
			1
		);
	END
	SELECT
		@estadoPersona = estado,
		@idPersona = id_persona
	FROM TBL_PERSONA
	WHERE cedula = @cedula;
	IF @estadoPersona = 1
	BEGIN
		-- Actualizar registro existente
		UPDATE TBL_LIBRO
		SET
		estado = 2,
		id_persona = @idPersona,
		fecha_prestado = SYSDATETIME()
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
			0
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
	END
	ELSE
	IF @estadoPersona = 2
	BEGIN
		SET @resultado = 'TIENE MULTA(S) PENDIENTE(S)';
		SET @msgError = '';
	END
	ELSE
	BEGIN
		SET @resultado = 'USTED ESTA BANEADA';
		SET @msgError = '';
	END;
END;

