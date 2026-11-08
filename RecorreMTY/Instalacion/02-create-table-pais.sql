-- Tema:        PIA - RecorreMTYDB
-- Descripción: Tabla Pais (países de origen de los turistas)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

CREATE TABLE Pais (
	idPais INT IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Activo BIT NOT NULL CONSTRAINT DF_Pais_Activo DEFAULT 1,
	CONSTRAINT PK_Pais PRIMARY KEY (idPais),
	CONSTRAINT UQ_Pais_Nombre UNIQUE (Nombre)
);
