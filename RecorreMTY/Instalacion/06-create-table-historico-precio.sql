--- Tema:        PIA - RecorreMTYDB
-- Descripción: Tabla HistoricoPrecio (cambios de precio de cada recorrido)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

CREATE TABLE HistoricoPrecio (
	idHistoricoPrecio INT IDENTITY(1,1) NOT NULL,
	idRecorrido INT NOT NULL,
	PrecioAnterior DECIMAL(10,2) NOT NULL,
	PrecioNuevo DECIMAL(10,2) NOT NULL,
	FechaCambio DATETIME NOT NULL CONSTRAINT DF_HistoricoPrecio_FechaCambio DEFAULT GETDATE(),
	CONSTRAINT PK_HistoricoPrecio PRIMARY KEY (idHistoricoPrecio),
	CONSTRAINT FK_HistoricoPrecio_Recorrido FOREIGN KEY (idRecorrido) REFERENCES Recorrido (idRecorrido)
);
