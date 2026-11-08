-- Tema:        PIA - RecorreMTYDB
-- Descripción: Datos iniciales de Recorrido (recorridos y su precio vigente)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

INSERT INTO Recorrido
	(Nombre, DuracionHoras, PrecioPersona, Activo)
VALUES
	('Barrio Antiguo', 2.0, 250.00, 1),
	('Paseo Santa Lucía', 1.5, 200.00, 1),
	('Parque Fundidora', 3.0, 300.00, 1),
	('Chipinque', 4.0, 450.00, 1),
	('Cerro de la Silla', 5.0, 550.00, 1),
	('Grutas de García', 6.0, 650.00, 1);
