USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_R_PRE_DEV]    Script Date: 19/04/2024 19:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_R_MULTAS]
AS
BEGIN
  SELECT 
	*
  FROM VW_MULTA;
END;
