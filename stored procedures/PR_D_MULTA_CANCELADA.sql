USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_U_LIBRO_DAR_BAJA]    Script Date: 19/04/2024 18:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_D_MULTA_CANCELADA]
(
  @idMulta INT,
  @resultado NVARCHAR(20) OUTPUT,
  @msgError NVARCHAR(100) OUTPUT
)
AS
BEGIN
  -- Eliminar registro existente
  DELETE TBL_MULTA
  WHERE id_multa = @idMulta;

  IF @@ROWCOUNT = 0
  BEGIN
    SET @resultado = 'REGISTRO NO ENCONTRADO';
    SET @msgError = 'El ID de multa especificado no existe.';
  END
  ELSE
  BEGIN
    SET @resultado = 'REGISTRO ELIMINADO';
    SET @msgError = '';
  END;

END;