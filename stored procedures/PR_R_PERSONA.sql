USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_R_PRE_DEV]    Script Date: 19/04/2024 18:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_R_PERSONA]
(
  @idPersona INT
)
AS
BEGIN
  SELECT 
	*
  FROM TBL_PERSONA
  WHERE id_persona = @idPersona;
END;
