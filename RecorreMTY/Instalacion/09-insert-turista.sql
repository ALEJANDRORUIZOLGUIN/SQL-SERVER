-- Tema:        PIA - RecorreMTYDB
-- Descripción: Datos iniciales de Turista (12 turistas, uno dado de baja)
-- Autor:       Ruiz Olguin Alejandro (2253555)

USE RecorreMTYDB;

INSERT INTO Turista
	(Nombre, Correo, FechaRegistro, idPais, Activo)
SELECT v.Nombre, v.Correo, v.FechaRegistro, p.idPais, v.Activo
FROM (VALUES
	('Ana Lucía Ramírez', 'ana.ramirez@correo.com', '2026-01-10', 'México', 1),
	('Jorge Pérez', 'jorge.perez@correo.com', '2026-01-15', 'México', 1),
	('Emily Brown', 'emily.brown@correo.com', '2026-02-03', 'Canadá', 1),
	('John Smith', 'john.smith@correo.com', '2026-02-10', 'Estados Unidos', 1),
	('Laura Gómez', 'laura.gomez@correo.com', '2026-02-20', 'España', 1),
	('Carlos Ruiz', 'carlos.ruiz@correo.com', '2026-03-01', 'Colombia', 1),
	('Sofía Torres', 'sofia.torres@correo.com', '2026-03-05', 'Colombia', 1),
	('Mark Wilson', 'mark.wilson@correo.com', '2026-03-12', 'Canadá', 1),
	('Daniel Herrera', 'daniel.herrera@correo.com', '2026-03-20', 'México', 0),
	('Olivia Davis', 'olivia.davis@correo.com', '2026-04-02', 'Estados Unidos', 1),
	('Pablo Navarro', 'pablo.navarro@correo.com', '2026-04-10', 'España', 1),
	('María Fernanda Ortiz', 'maria.ortiz@correo.com', '2026-04-18', 'México', 1)
) AS v (Nombre, Correo, FechaRegistro, NombrePais, Activo)
INNER JOIN Pais p ON p.Nombre = v.NombrePais;
