/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      mlBiblioteca.DM1
 *
 * Date Created : Monday, April 22, 2024 22:27:50
 * Target DBMS : Microsoft SQL Server 2016
 */

USE BdBiblioteca
go
/* 
 * TABLE: TBL_LIBRO 
 */

CREATE TABLE TBL_LIBRO(
    id_libro          int              IDENTITY(1,1),
    codigo            nvarchar(16)     NOT NULL,
    titulo            nvarchar(100)    NOT NULL,
    autor             nvarchar(40)     NOT NULL,
    anio_edicion      nchar(4)         NOT NULL,
    genero            nvarchar(20)     NOT NULL,
    estado            int              NOT NULL,
    fecha_prestado    datetime2(0)     NULL,
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
 * TABLE: TBL_MULTA 
 */

CREATE TABLE TBL_MULTA(
    id_multa      int    IDENTITY(1,1),
    id_libro      int    NOT NULL,
    id_persona    int    NOT NULL,
    monto         int    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (id_multa, id_libro, id_persona)
)
go



IF OBJECT_ID('TBL_MULTA') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_MULTA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_MULTA >>>'
go

/* 
 * TABLE: TBL_PERSONA 
 */

CREATE TABLE TBL_PERSONA(
    id_persona    int             IDENTITY(1,1),
    cedula        nchar(14)       NOT NULL,
    nombre        nvarchar(30)    NOT NULL,
    apellido      nvarchar(30)    NOT NULL,
    estado        int             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (id_persona),
    UNIQUE(cedula)
)
go



IF OBJECT_ID('TBL_PERSONA') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_PERSONA >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_PERSONA >>>'
go

/* 
 * TABLE: TBL_PRE_DEV 
 */

CREATE TABLE TBL_PRE_DEV(
    id_pre_dev    int             IDENTITY(1,1),
    id_libro      int             NOT NULL,
    id_persona    int             NOT NULL,
    fecha         datetime2(0)    NOT NULL,
    tipo          bit             NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (id_pre_dev, id_libro, id_persona)
)
go



IF OBJECT_ID('TBL_PRE_DEV') IS NOT NULL
    PRINT '<<< CREATED TABLE TBL_PRE_DEV >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TBL_PRE_DEV >>>'
go

/* 
 * TABLE: TBL_USUARIO 
 */

CREATE TABLE TBL_USUARIO(
    id_usuario    int             IDENTITY(1,1),
    usuario       nvarchar(10)    NOT NULL,
    password      nchar(64)       NOT NULL,
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


/* 
 * TABLE: TBL_MULTA 
 */

ALTER TABLE TBL_MULTA ADD CONSTRAINT RefTBL_LIBRO7 
    FOREIGN KEY (id_libro)
    REFERENCES TBL_LIBRO(id_libro)
go

ALTER TABLE TBL_MULTA ADD CONSTRAINT RefTBL_PERSONA9 
    FOREIGN KEY (id_persona)
    REFERENCES TBL_PERSONA(id_persona)
go


/* 
 * TABLE: TBL_PRE_DEV 
 */

ALTER TABLE TBL_PRE_DEV ADD CONSTRAINT RefTBL_LIBRO6 
    FOREIGN KEY (id_libro)
    REFERENCES TBL_LIBRO(id_libro)
go

ALTER TABLE TBL_PRE_DEV ADD CONSTRAINT RefTBL_PERSONA8 
    FOREIGN KEY (id_persona)
    REFERENCES TBL_PERSONA(id_persona)
go


