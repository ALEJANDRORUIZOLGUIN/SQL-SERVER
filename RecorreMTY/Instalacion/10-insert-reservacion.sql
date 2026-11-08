-- Tema:        PIA - RecorreMTYDB
-- Descripción: Datos iniciales de Reservacion (23 reservaciones con el precio vigente)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

INSERT INTO Reservacion
	(idTurista, idRecorrido, FechaRecorrido, NumPersonas, PrecioPersonaCobrado)
SELECT t.idTurista, r.idRecorrido, v.FechaRecorrido, v.NumPersonas, r.PrecioPersona
FROM (VALUES
	('ana.ramirez@correo.com', 'Barrio Antiguo', '2026-03-05', 2),
	('ana.ramirez@correo.com', 'Chipinque', '2026-03-20', 4),
	('jorge.perez@correo.com', 'Paseo Santa Lucía', '2026-03-08', 1),
	('emily.brown@correo.com', 'Parque Fundidora', '2026-03-15', 3),
	('emily.brown@correo.com', 'Barrio Antiguo', '2026-04-02', 2),
	('john.smith@correo.com', 'Chipinque', '2026-04-05', 6),
	('laura.gomez@correo.com', 'Paseo Santa Lucía', '2026-04-12', 2),
	('carlos.ruiz@correo.com', 'Parque Fundidora', '2026-04-18', 1),
	('daniel.herrera@correo.com', 'Barrio Antiguo', '2026-03-25', 2),
	('olivia.davis@correo.com', 'Barrio Antiguo', '2026-05-02', 4),
	('olivia.davis@correo.com', 'Parque Fundidora', '2026-05-09', 2),
	('pablo.navarro@correo.com', 'Chipinque', '2026-05-16', 3),
	('maria.ortiz@correo.com', 'Paseo Santa Lucía', '2026-05-23', 5),
	('maria.ortiz@correo.com', 'Barrio Antiguo', '2026-06-06', 2),
	('ana.ramirez@correo.com', 'Parque Fundidora', '2026-06-13', 1),
	('jorge.perez@correo.com', 'Chipinque', '2026-06-20', 2),
	('emily.brown@correo.com', 'Paseo Santa Lucía', '2026-07-04', 4),
	('john.smith@correo.com', 'Parque Fundidora', '2026-07-11', 2),
	('laura.gomez@correo.com', 'Barrio Antiguo', '2026-07-18', 3),
	('carlos.ruiz@correo.com', 'Chipinque', '2026-08-01', 2),
	('olivia.davis@correo.com', 'Paseo Santa Lucía', '2026-08-08', 1),
	('pablo.navarro@correo.com', 'Parque Fundidora', '2026-09-12', 4),
	('maria.ortiz@correo.com', 'Chipinque', '2026-10-03', 2)
) AS v (Correo, NombreRecorrido, FechaRecorrido, NumPersonas)
INNER JOIN Turista t ON t.Correo = v.Correo
INNER JOIN Recorrido r ON r.Nombre = v.NombreRecorrido;
