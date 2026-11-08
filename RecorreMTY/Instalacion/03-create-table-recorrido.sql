-- Tema:        PIA - RecorreMTYDB
-- Descripción: Tabla Recorrido (recorridos turísticos y precio vigente)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

CREATE TABLE Recorrido (
	idRecorrido INT IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	DuracionHoras DECIMAL(3,1) NOT NULL,
	PrecioPersona DECIMAL(10,2) NOT NULL,
	Activo BIT NOT NULL CONSTRAINT DF_Recorrido_Activo DEFAULT 1,
	CONSTRAINT PK_Recorrido PRIMARY KEY (idRecorrido),
	CONSTRAINT UQ_Recorrido_Nombre UNIQUE (Nombre),
	CONSTRAINT CK_Recorrido_DuracionHoras CHECK (DuracionHoras > 0),
	CONSTRAINT CK_Recorrido_PrecioPersona CHECK (PrecioPersona > 0)
);
