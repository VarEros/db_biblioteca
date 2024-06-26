USE [BdBiblioteca]
GO
/****** Object:  StoredProcedure [dbo].[PR_R_INICIO_SESION]    Script Date: 19/04/2024 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[PR_R_INICIO_SESION]
(
  @usuario NVARCHAR(10),
  @password NCHAR(64),
  @resultado NVARCHAR(30) OUTPUT
)
AS
BEGIN
  SELECT *
  FROM TBL_USUARIO us
  WHERE us.usuario = @usuario AND us.password = @password;

  IF @@ROWCOUNT = 0
  BEGIN
    SET @resultado = 'CREDENCIALES INCORRECTAS';
  END
  ELSE
  BEGIN
    SET @resultado = 'CREDENCIALES CORRECTAS';
  END;
END;

