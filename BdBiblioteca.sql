/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      mlBiblioteca.DM1
 *
 * Date Created : Saturday, April 13, 2024 16:08:44
 * Target DBMS : Microsoft SQL Server 2016
 */

USE master
go
CREATE DATABASE BdBiblioteca
go
USE BdBiblioteca
go
/* 
 * TABLE: TBL_LIBRO 
 */

CREATE TABLE TBL_LIBRO(
    id_libro          int              IDENTITY(1,1),
    titulo            nvarchar(100)    NOT NULL,
    autor             nvarchar(40)     NOT NULL,
    anio_edicion      int              NOT NULL,
    genero            nvarchar(20)     NULL,
    codigo            nvarchar(16)     NOT NULL,
    estado            int              NOT NULL,
    fecha_prestado    datetime         NULL,
    id_persona        int              NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (id_libro)
)
go



IF OBJECT_ID('TBL_LIBRO') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_LIBRO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_LIBRO >>>'
go

/* 
 * TABLE: TBL_PERSONA 
 */

CREATE TABLE TBL_PERSONA(
    id_persona    int             IDENTITY(1,1),
    nombres       nvarchar(30)    NOT NULL,
    apellidos     nvarchar(30)    NOT NULL,
    cedula        nvarchar(14)    NOT NULL,
    estado        int             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (id_persona)
)
go



IF OBJECT_ID('TBL_PERSONA') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_PERSONA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_PERSONA >>>'
go

/* 
 * TABLE: TBL_USUARIO 
 */

CREATE TABLE TBL_USUARIO(
    id_usuario    int              IDENTITY(1,1),
    usuario       nvarchar(10)     NOT NULL,
    password      nvarchar(100)    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (id_usuario)
)
go



IF OBJECT_ID('TBL_USUARIO') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_USUARIO >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_USUARIO >>>'
go

/* 
 * TABLE: TBL_LIBRO 
 */

ALTER TABLE TBL_LIBRO ADD CONSTRAINT RefTBL_PERSONA5 
    FOREIGN KEY (id_persona)
    REFERENCES TBL_PERSONA(id_persona)
go


