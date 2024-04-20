CREATE OR ALTER VIEW [dbo].[VW_MULTA]
SELECT        dbo.TBL_MULTA.id_multa, dbo.TBL_MULTA.monto, dbo.TBL_LIBRO.id_libro, dbo.TBL_LIBRO.titulo, dbo.TBL_LIBRO.codigo, dbo.TBL_PERSONA.id_persona, dbo.TBL_PERSONA.cedula, dbo.TBL_PERSONA.nombre, 
                         dbo.TBL_PERSONA.apellido
FROM            dbo.TBL_MULTA INNER JOIN
                         dbo.TBL_LIBRO ON dbo.TBL_MULTA.id_libro = dbo.TBL_LIBRO.id_libro INNER JOIN
                         dbo.TBL_PERSONA ON dbo.TBL_LIBRO.id_persona = dbo.TBL_PERSONA.id_persona