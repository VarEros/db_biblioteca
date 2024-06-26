USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_U_LIBRO_DAR_BAJA]    Script Date: 19/04/2024 17:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_U_LIBRO_DAR_BAJA]
(
  @idLibro INT,
  @resultado NVARCHAR(20) OUTPUT,
  @msgError NVARCHAR(100) OUTPUT
)
AS
BEGIN
  -- Actualizar registro existente
  UPDATE TBL_LIBRO
  SET
    estado = 3
  WHERE id_libro = @idLibro;

  IF @@ROWCOUNT = 0
  BEGIN
    SET @resultado = 'REGISTRO NO ENCONTRADO';
    SET @msgError = 'El ID de libro especificado no existe.';
  END
  ELSE
  BEGIN
    SET @resultado = 'REGISTRO ELIMINADO';
    SET @msgError = '';
  END;

END;

