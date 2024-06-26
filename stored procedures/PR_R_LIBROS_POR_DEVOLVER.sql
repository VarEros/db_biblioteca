USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_R_LIBROS_POR_DEVOLVER]    Script Date: 19/04/2024 18:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_R_LIBROS_POR_DEVOLVER]
(
  @cedula NCHAR
)
AS
BEGIN
  SELECT 
	li.*
  FROM TBL_LIBRO li
  INNER JOIN TBL_PERSONA pe ON pe.id_persona = li.id_persona AND pe.cedula = @cedula
  WHERE li.estado <> 3;
END;