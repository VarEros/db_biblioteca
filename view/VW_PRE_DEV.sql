CREATE OR ALTER VIEW VW_PRE_DEV AS
SELECT        TOP (100) PERCENT dbo.TBL_LIBRO.id_libro, dbo.TBL_LIBRO.codigo, dbo.TBL_LIBRO.titulo, dbo.TBL_PERSONA.id_persona, dbo.TBL_PERSONA.cedula, dbo.TBL_PERSONA.nombre, dbo.TBL_PERSONA.apellido, 
                         dbo.TBL_PRE_DEV.fecha, dbo.TBL_PRE_DEV.tipo
FROM            dbo.TBL_LIBRO INNER JOIN
                         dbo.TBL_PRE_DEV ON dbo.TBL_LIBRO.id_libro = dbo.TBL_PRE_DEV.id_libro INNER JOIN
                         dbo.TBL_PERSONA ON dbo.TBL_PRE_DEV.id_persona = dbo.TBL_PERSONA.id_persona
ORDER BY dbo.TBL_PRE_DEV.fecha DESC