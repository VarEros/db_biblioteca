USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_R_LIBROS]    Script Date: 19/04/2024 17:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_R_LIBROS]
AS
BEGIN
  SELECT 
	*
  FROM TBL_LIBRO
  WHERE estado <> 3;
END;