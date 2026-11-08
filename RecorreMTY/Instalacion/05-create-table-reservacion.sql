-- Tema:        PIA - RecorreMTYDB
-- Descripción: Tabla Reservacion (hecho principal: cada reservación cobrada)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

CREATE TABLE Reservacion (
	idReservacion INT IDENTITY(1,1) NOT NULL,
	idTurista INT NOT NULL,
	idRecorrido INT NOT NULL,
	FechaRecorrido DATE NOT NULL,
	NumPersonas INT NOT NULL,
	PrecioPersonaCobrado DECIMAL(10,2) NOT NULL,
	CONSTRAINT PK_Reservacion PRIMARY KEY (idReservacion),
	CONSTRAINT CK_Reservacion_NumPersonas CHECK (NumPersonas BETWEEN 1 AND 10),
	CONSTRAINT FK_Reservacion_Turista FOREIGN KEY (idTurista) REFERENCES Turista (idTurista),
	CONSTRAINT FK_Reservacion_Recorrido FOREIGN KEY (idRecorrido) REFERENCES Recorrido (idRecorrido)
);
