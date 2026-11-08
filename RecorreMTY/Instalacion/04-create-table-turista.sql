-- Tema:        PIA - RecorreMTYDB
-- Descripción: Tabla Turista (personas que hacen reservaciones)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

CREATE TABLE Turista (
	idTurista INT IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Correo VARCHAR(100) NOT NULL,
	FechaRegistro DATE NOT NULL,
	idPais INT NOT NULL,
	Activo BIT NOT NULL CONSTRAINT DF_Turista_Activo DEFAULT 1,
	CONSTRAINT PK_Turista PRIMARY KEY (idTurista),
	CONSTRAINT UQ_Turista_Correo UNIQUE (Correo),
	CONSTRAINT FK_Turista_Pais FOREIGN KEY (idPais) REFERENCES Pais (idPais)
);
